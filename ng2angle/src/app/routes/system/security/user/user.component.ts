import { Component, OnInit } from '@angular/core';
import { UserService } from './user.service';
import { Page } from '../page';
import { User } from './user';


@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.scss']
})
export class UserComponent implements OnInit {

  public ng2TableData: Array<User>;
  // public ng2TableData: Array<any> = TableData;

  constructor(private userService: UserService) { }

  ngOnInit() {
    this.getList();
    setTimeout(() => {
      this.onChangeTable(this.config);
    }, 1000);
  }

  getList() {
    // const username = this.valForm.get('username').value;
    this.userService.getList(0, 5, '').subscribe((result) => {
      if (result.code == '200') {
        const pageinfo: Page = result.obj;
        this.ng2TableData = pageinfo.content;
        console.log(JSON.stringify(this.ng2TableData));
      } else {
        console.log('get List failure' + result.msg)
      }
    });
  }

  public rows: Array<any> = [];
  public columns: Array<any> = [
      { title: 'username', name: 'username', filtering: { filterString: '', placeholder: 'Filter by username' } },
      {
          title: 'password',
          name: 'password',
          sort: false,
          filtering: { filterString: '', placeholder: 'Filter by password' }
      },
      { title: 'email', className: ['email-header', 'text-success'], name: 'email', sort: 'asc' },
      { title: 'phone.', name: 'phone', sort: '', filtering: { filterString: '', placeholder: 'Filter by phone' } },
      { title: 'status', className: 'text-warning', name: 'status' },
      { title: 'createTime', name: 'createTime' }
  ];
  public page: number = 1;
  public itemsPerPage: number = 10;
  public maxSize: number = 5;
  public numPages: number = 1;
  public length: number = 0;

  public config: any = {
      paging: true,
      sorting: { columns: this.columns },
      filtering: { filterString: '' },
      className: ['table-striped', 'table-bordered', 'mb-0', 'd-table-fixed']
  };

  public changePage(page: any, data: Array<any> = this.ng2TableData): Array<any> {
      let start = (page.page - 1) * page.itemsPerPage;
      let end = page.itemsPerPage > -1 ? (start + page.itemsPerPage) : data.length;
      return data.slice(start, end);
  }

  public changeSort(data: any, config: any): any {
      if (!config.sorting) {
          return data;
      }

      let columns = this.config.sorting.columns || [];
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
      this.columns.forEach((column: any) => {
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
              item[config.filtering.columnName].match(this.config.filtering.filterString));
      }

      let tempArray: Array<any> = [];
      filteredData.forEach((item: any) => {
          let flag = false;
          this.columns.forEach((column: any) => {
              if (item[column.name].toString().match(this.config.filtering.filterString)) {
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

  public onChangeTable(config: any, page: any = { page: this.page, itemsPerPage: this.itemsPerPage }): any {
      if (config.filtering) {
          (<any>Object).assign(this.config.filtering, config.filtering);
      }

      if (config.sorting) {
          (<any>Object).assign(this.config.sorting, config.sorting);
      }

      let filteredData = this.changeFilter(this.ng2TableData, this.config);
      let sortedData = this.changeSort(filteredData, this.config);
      this.rows = page && config.paging ? this.changePage(page, sortedData) : sortedData;
      this.length = sortedData.length;
  }

  public onCellClick(data: any): any {
      console.log(data);
  }

}
