import { Injectable } from '@angular/core'

@Injectable()
export class Ng2TableService {    

    public changeTableForServer(tableData: Array<any>, config: any): any {       
        let filteredData = this.changeFilter(tableData, config);
        let sortedData = this.changeSort(filteredData, config);
        return sortedData;
    }

    //用于客户端分页
    public changeTableForClient(tableData: Array<any>, config: any, page:any={'page':1,'itemsPerPage':10}): any {       
        let filteredData = this.changeFilter(tableData, config);
        let sortedData = this.changeSort(filteredData, config);
        return config.paging ? this.changePage(page, sortedData) : sortedData;
    }
    
    public changePage(page: any, data: Array<any>): Array<any> {
        let start = (page.page - 1) * page.itemsPerPage;
        let end = page.itemsPerPage > -1 ? (start + page.itemsPerPage) : data.length;
        return data.slice(start, end);
    }

    public changeSort(data: any, config: any): any {
        if (!config.sorting) {
            return data;
        }

        let columns = config.sorting.columns || [];
        let columnName: string = void 0;
        let sort: string = void 0;

        for (let i = 0; i < columns.length; i++) {
            if (columns[i].sort !== '' && columns[i].sort !== false) {
                columnName = columns[i].name;
                sort = columns[i].sort;
            }
        }

        if (!columnName) {
            return data;
        }

        // simple sorting
        return data.sort((previous: any, current: any) => {
            if (previous[columnName] > current[columnName]) {
                return sort === 'desc' ? -1 : 1;
            } else if (previous[columnName] < current[columnName]) {
                return sort === 'asc' ? -1 : 1;
            }
            return 0;
        });
    }

    public changeFilter(data: any, config: any): any {

        let filteredData: Array<any> = data;
        let columns = config.sorting.columns || [];
        columns.forEach((column: any) => {
            if (column.filtering) {
                filteredData = filteredData.filter((item: any) => {
                    return item[column.name].match(column.filtering.filterString);
                });
            }
        });

        if (!config.filtering) {
            return filteredData;
        }

        if (config.filtering.columnName) {
            return filteredData.filter((item: any) =>
                item[config.filtering.columnName].match(config.filtering.filterString));
        }

        let tempArray: Array<any> = [];
        filteredData.forEach((item: any) => {
            let flag = false;
            columns.forEach((column: any) => {
                if (item[column.name].toString().match(config.filtering.filterString)) {
                    flag = true;
                }
            });
            if (flag) {
                tempArray.push(item);
            }
        });
        filteredData = tempArray;

        return filteredData;
    }

}