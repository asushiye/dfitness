import { Component, OnInit, ViewChild,ViewEncapsulation } from '@angular/core';
import { DatatableComponent } from '@swimlane/ngx-datatable';
import { NgxDataTableMessage } from '../../../system/table/ngx-dataTable';
import { StatisticsStudent } from './report';
import { ReportService } from './report.service';
import { GlobalService } from '../../../system/utils/global.service';
import { Result } from '../../../system/result/result';
import * as XLSX from 'xlsx';
import swal from 'sweetalert';
import { TypeCodeService, cst_score_title } from '../common/typecode.service';

@Component({
  selector: 'app-report',
  templateUrl: './report.component.html',
  styleUrls: ['./report.component.scss'],
  encapsulation: ViewEncapsulation.None
})
export class ReportComponent implements OnInit {

  @ViewChild(DatatableComponent) table: DatatableComponent;

  public tableMessage: NgxDataTableMessage = new NgxDataTableMessage();

  public ssRows: Array<StatisticsStudent> = [];
  public siRows: Array<any> = [];
  public siData: Array<any> = [];
  public siColumns: Array<any> = [];
  public titleList: any[] = [{ 'code': '', 'name': '' }];
  selectTitle: string = '';

  constructor(private reportService: ReportService,
    private globalService: GlobalService,
    private typeCodeService: TypeCodeService) {
    this.onGetCode();

  }

  ngOnInit() {
  }


  //查询 - 类型
  onGetCode() {
    const body = {
      'type': cst_score_title
    };

    this.typeCodeService.getCodes(body)
      .subscribe(
        (resp) => {
          console.log(JSON.stringify(resp));
          const result: Result<String[]> = resp;
          if (result.status) {
            // const titles: String[] = result.data;

            this.titleList = result.data
            if (this.titleList.length >= 1) {
              this.selectTitle = this.titleList[0].code;
            }
            console.log(JSON.stringify(this.titleList));
          } else {
            console.log('get score_category code failure' + result.msg)
            confirm("网络连接不上，请重试");
          }
        }
      );
  }

  onQuery(title: string) {
    this.onGetListSIC(title);
    this.onGetListSS(title);
  }

  //查询 - 考核项目
  onGetListSS(title: string) {
    const body = {
      'title': title
    }

    this.reportService.getStatisticsStudent(body)
      .subscribe(
        (resp) => {
          console.log(JSON.stringify(resp));
          const result: Result<StatisticsStudent[]> = resp;
          if (result.status) {
            this.ssRows = result.data;
            console.log(JSON.stringify(this.ssRows));
          } else {
            console.log('get List failure' + result.msg)
            confirm("网络连接不上，请重试");
          }
        }
      );
  }

  //查询 - 学生考核项目列表
  onGetListSIC(title: string) {
    const body = {
      'title': title
    }

    this.siColumns = [];
    this.reportService.getStatisticsItemCol(body)
      .subscribe(
        (resp) => {
          // console.log(JSON.stringify(resp));
          const result: Result<any[]> = resp;
          if (result.status) {
            const rdata: any[] = result.data;
            this.siColumns = this.getsiColumns(rdata);
            // console.log('siColumns= '+JSON.stringify(this.siColumns));
            this.onGetListSI(title);
          } else {
            console.log('get List failure' + result.msg)
            confirm("getStatisticsItemCol网络连接不上，请重试");
          }
        }
      );
  }

  //构建列
  getsiColumns(rdata: any[]): any[] {
    const tmpsiCols: any[] = [
      { name: '姓名', prop: '姓名', width: 85 },
      { name: '学号', prop: '学号', width: 90 },
      { name: '性别', prop: '性别', width: 45 },
      { name: '专业', prop: '专业', width: 150 }];

    rdata.forEach(data => {
      const cols: string[] = data.split(',');
      cols.forEach(col => {
        if (col.indexOf('评价') == -1) {
          tmpsiCols.push({ name: col, prop: col, width: 110 });
        } else {
          tmpsiCols.push({ name: '评价', prop: col, width: 60 });
        }
      })
    });
    return tmpsiCols;
  }

  //查询 - 学生考核项目
  onGetListSI(title: string) {
    const body = {
      'title': title
    }

    this.reportService.getStatisticsItem(body)
      .subscribe(
        (resp) => {
          // console.log(JSON.stringify(resp));
          const result: Result<any[]> = resp;
          if (result.status) {
            const rdata: any[] = result.data;
            this.siData = rdata;
            this.siRows = this.getsiRows(rdata);
            // console.log('siRows= ' + JSON.stringify(this.siRows));
          } else {
            console.log('get List failure' + result.msg)
            confirm("网络连接不上，请重试");
          }
        }
      );
  }

  //构建列值
  getsiRows(rdata: any[]): any[] {
    const tmpRows: any[] = [];
    rdata.forEach(data => {
      const values: string[] = data;
      const cols: { [index: string]: string } = {}
      for (let i = 0; i < this.siColumns.length; i++) {
        cols[this.siColumns[i].prop] = values[i];
      }
      tmpRows.push(cols);
    })
    return tmpRows;
  }

  //下载 - 学生考核成绩
  onDownLoadSS() {
    if (this.siRows.length >=1){
      // const sidata: any[] = [];
      // this.siData.forEach(data => {
      //   const values: string[] = data;
      //   const cols: { [index: string]: string } = {}
      //   for (let i = 0; i < this.siColumns.length; i++) {
      //     cols[this.siColumns[i].name+i] = values[i];
      //   }
      //   sidata.push(cols);
      // })
   
      this.globalService.downloadXlsx(this.siRows, '学生考核成绩汇总.xlsx', this.selectTitle);
    }
  }

  //下载 - 考核项目汇总报表
  onDownLoadSI() {
    if (this.ssRows.length >=1){
      const ssdata: any[] = [];
      this.ssRows.forEach(ssRow=>{
        ssdata.push(
          {'考核项目':ssRow.item,'缺勤人数':ssRow.notjoin,'参考人数':ssRow.sjoin,
          '参考率':ssRow.joinrate,'及格数':ssRow.pass,'及格率':ssRow.passrate})
      })
      this.globalService.downloadXlsx(ssdata, '考核项目汇总报表.xlsx', this.selectTitle);
    }
  }


}
