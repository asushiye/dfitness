import { Injectable } from '@angular/core'
import { Filter } from './ngx-datatable';

/*
 * @Author: asushiye
 * @Date: 2019-02-12 16:58:52
 * @Commit: FilterService for ngx-datatable to filter data
 */

@Injectable()
export class FilterService {    

    filterTable<T>(filterString:any, tableData: Array<T> = [], columns: Array<any>=[]) {
        // console.log(JSON.stringify(tableFilter));
        let filteredData = tableData.slice(0, tableData.length);

        if (filterString) {
            let tempArray: Array<any> = [];
            let ddd: string;
            filteredData.forEach((item: any) => {
                let flag = false;
                columns.forEach((column: any) => {
                    console.log(column.name);
                    if (column.name != '') {
                        let itemString = JSON.stringify(item[column.name]);
                        if (itemString.match(filterString)) {
                            flag = true;
                        }
                    }
                });
                if (flag) {
                    tempArray.push(item);
                }
            });
            filteredData = tempArray;
        }
        // console.log(filteredData);
        return filteredData; 
    }

    filterColumn<T>(columnFilters:Filter[]=[], tableData: Array<T> = [], columns: Array<any>=[]) {
        console.log(JSON.stringify(columnFilters));
        let filteredData = tableData.slice(0, tableData.length);

        if (columnFilters.length >= 1) {
            columnFilters.forEach((filter) => {
                if (filter.name) {
                    filteredData = filteredData.filter((item: any) => {
                        return item[filter.name].match(filter.filterString);
                    });
                }
            });
        }
        console.log(filteredData);
        return filteredData; 
    }


}