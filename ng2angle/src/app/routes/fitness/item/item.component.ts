import { Component, OnInit, ViewChild, ViewEncapsulation } from '@angular/core';
import { DatatableComponent } from '@swimlane/ngx-datatable';
import { NgxDataTableMessage } from '../../../system/table/ngx-dataTable';
import {
  Item, wb_export_name, ws_export_name, wb_tmp_name, ws_tmp_name,
  TemplateData, ItemInterface, columns
} from './item';
import { RequestPage, PageConfig, ResponsePage } from '../../../system/result/page';
import { ItemService } from './item.service';
import { AuthService } from '../../../system/auth/auth.service';
import { GlobalService } from '../../../system/utils/global.service';
import { FilterService } from '../../../system/table/filter.service';
import { BodyPageDto } from '../../../system/dto/dto';
import { Result } from '../../../system/result/result';
import * as XLSX from 'xlsx';
import swal from 'sweetalert';
import { FitnessService } from '../common/fitness.service';

@Component({
  selector: 'app-item',
  templateUrl: './item.component.html',
  styleUrls: ['./item.component.scss'],
  encapsulation: ViewEncapsulation.None
})
export class ItemComponent implements OnInit {

  @ViewChild(DatatableComponent) table: DatatableComponent;

  public tableMessage: NgxDataTableMessage = new NgxDataTableMessage();

  public tableData: Array<Item> = [];
  public selected: Item[] = [];
  public rows: Array<Item> = [];
  public columns = columns;

  constructor(private itemService: ItemService,
    private fitnessService: FitnessService,
    private authService: AuthService,
    private globalService: GlobalService,
    private filterService: FilterService) { }

  ngOnInit() {
 
  }

  public requestPage = new RequestPage();
  public pageConfig = new PageConfig();


  //查询 - 考核项目
  onGetList(item: string, category: string, gender: string,
    pageInfo: any = { offset: this.requestPage.page, limit: this.requestPage.size }) {
    const requestbody: BodyPageDto<{}, RequestPage> = new BodyPageDto();
    requestbody.body = {
      'item': item,
      'category': category,
      'gender': gender
    }
    const page: RequestPage = new RequestPage();
    page.size = pageInfo.limit;
    page.page = pageInfo.offset;
    page.paged = true;
    requestbody.page = page;

    this.pageConfig.page = pageInfo.offset;

    this.itemService.getList(requestbody)
      .subscribe(
        (resp) => {
          console.log(JSON.stringify(resp));
          const result: Result<ResponsePage<Item[]>> = resp;
          if (result.status) {
            const responsePage: ResponsePage<Item[]> = result.data;
            this.pageConfig.totalSize = responsePage.totalSize;
            // this.requestPage.totalPages = responsePage.totalPages;
            this.pageConfig.realSize = responsePage.realSize;
            this.tableData = responsePage.content;
            this.onChangeTable();
          } else {
            console.log('get List failure' + result.msg)
            confirm("网络连接不上，请重试");
          }
        }
      );
  }

  //变动 - 表格数据
  public onChangeTable(): void {
    this.rows = this.tableData.slice(0, this.tableData.length);
  }

  //下载 - 项目信息
  onDownLoad(item: string, category: string, gender: string) {
    const requestbody: BodyPageDto<{}, {}> = new BodyPageDto();
    requestbody.body = {
      'item': item,
      'category': category,
      'gender': gender
    }
    requestbody.page = {
      'paged': false,
      'size': 0,
      'page': 0
    };

    this.itemService.getList(requestbody)
      .subscribe(
        (resp) => {
          console.log(JSON.stringify(resp));
          const result: Result<Item[]> = resp;
          if (result.status) {
            const items: Item[] = result.data;
            console.log(JSON.stringify(items));
            let jsonData: Array<any> = [];
            const transform = this.transformData(items, jsonData);
            if (transform) {
              this.globalService.downloadXlsx(jsonData, wb_export_name, ws_export_name);
            } else {
              confirm('按条件查询无数据，请重新填写条件');
            }
          } else {
            console.log('onExport failure' + result.msg)
            confirm("网络连接不上，请重试");
          }
        }
      );
  }

  //转换-项目信息
  transformData(items: Item[], uploadData: Array<any> = []): boolean {
    let i = 0;
    items.forEach(item => {
      const rowData = { '类别': item.category, '考核项目': item.item, '性别': item.gender, '单位': item.unit, '优秀': item.great, '良好': item.good, '及格': item.pass, '导入时间': item.createdDate };
      uploadData[i++] = rowData;
    });
    return i >= 1;
  }


  //下载 - 学生导入模版
  onDownloadTemplate() {
    this.globalService.downloadXlsx(TemplateData, wb_tmp_name, ws_tmp_name);
  }


  // 上传- 导入项目评分信息
  onUploadXlsx(evt: any) {
    /* wire up file reader */
    const target: DataTransfer = <DataTransfer>(evt.target);
    if (target.files.length !== 1) throw new Error('Cannot use multiple files');
    const reader: FileReader = new FileReader();
    reader.onload = (e: any) => {
      /* read workbook */
      const bstr: string = e.target.result;
      //验证文件类型 ？
      const wb: XLSX.WorkBook = XLSX.read(bstr, { type: 'binary' });

      /* grab first sheet */
      const wsname: string = wb.SheetNames[0];
      const ws: XLSX.WorkSheet = wb.Sheets[wsname];

      /* save data */
      const jsonData = XLSX.utils.sheet_to_json(ws, { header: 2 });
      console.log(JSON.stringify(jsonData));
      evt.target.value = "";
      let items: Item[] = [];

      const validation = this.validationUploadData(jsonData, items);
      if (validation) {
        this.itemService.save(items)
          .subscribe(
            (resp) => {
              console.log(JSON.stringify(resp));
              const result: Result<String> = resp;
              if (result.status) {
                confirm("上传成功" + result.msg);
              } else {
                console.log('get List failure' + result.msg)
                confirm("网络连接不上，请重试");
              }
            }
          )
      }
    };
    reader.readAsBinaryString(target.files[0]);
  }

  //验证-学生信息
  validationUploadData(uploadData: any, items: Item[] = []): boolean {
    let itemInterface: ItemInterface[] = uploadData;
    let i = 1;
    itemInterface.forEach(itemi => {
      i++;
      const tmp = new Item();
      if (this.globalService.IsEmpty(itemi.考核项目)) {
        alert("第" + i + "行,考核项目不能为空");
        return false;
      } else {
        tmp.item = itemi.考核项目.trim();
      };
      if (this.globalService.IsEmpty(itemi.类别)) {
        alert("第" + i + "行,类别不能为空");
        return false;
      } else {
        tmp.category = itemi.类别.trim();
      };
      if (this.globalService.IsEmpty(itemi.性别)) {
        alert("第" + i + "行,性别不能为空");
        return false;
      } else {
        tmp.gender = itemi.性别.trim();
      };
      if (this.globalService.IsEmpty(itemi.单位)) {
        alert("第" + i + "行,性别不能为空");
        return false;
      } else {
        tmp.unit = itemi.单位.trim();
      };

      if (this.globalService.IsEmpty(itemi.优秀)) {
        alert("第" + i + "行,优秀不能为空");
        return false;
      } else {
        tmp.great = this.globalService.getValue(itemi.优秀);
      };
      if (!this.fitnessService.IsBMIOrPMF(tmp.item)) {
        if (this.globalService.IsEmpty(itemi.良好)) {
          alert("第" + i + "行,良好不能为空");
          return false;
        } else {
          tmp.good = this.globalService.getValue(itemi.良好);
        };
      }
      if (this.globalService.IsEmpty(itemi.及格)) {
        alert("第" + i + "行,及格不能为空");
        return false;
      } else {
        tmp.pass = this.globalService.getValue(itemi.及格);
      };

      let info: { status: boolean, error: string } = this.fitnessService.checkTime(tmp.great);
      if (!info.status) {
        alert("第" + i + "行,优秀" + info.error);
        return false;
      };

      if (!this.fitnessService.IsBMIOrPMF(tmp.item)) {
        info = this.fitnessService.checkTime(tmp.good);
        if (!info.status) {
          alert("第" + i + "行,良好" + info.error);
          return false;
        }
      };

      info = this.fitnessService.checkTime(tmp.pass);
      if (!info.status) {
        alert("第" + i + "行,及格" + info.error);
        return false;
      };

      tmp.createdBy = this.authService.authUser.username;
      tmp.updatedBy = tmp.createdBy;
      tmp.createdDate = this.globalService.getTodayTime();
      tmp.updatedDate = tmp.createdDate;
      items[i - 2] = tmp;
    });
    return true;
  }


  onDelete() {
    let body: Array<string> = [];
    this.selected.forEach((row) => {
      body.push(row.id);
    })

    if (this.selected.length <= 0) {
      swal({ title: '', text: '请选择要删除的数据', type: 'info' });
      return;
    } else {
      swal({
        title: '',
        text: '请确定真的要删除' + this.selected.length + '条数据 ？',
        type: 'info',
        showCancelButton: true,
        confirmButtonColor: '#DD6B55',
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        closeOnConfirm: false,
      }, (isConfirm) => {
        if (isConfirm) {
          this.itemService.delete(body)
            .subscribe(
              (resp) => {
                console.log(JSON.stringify(resp));
                const result: Result<string> = resp;
                if (result.status) {
                  const icount: string = result.data;
                  this.rows = this.deleteRows();
                } else {
                  console.log('onExport failure' + result.msg)
                  swal('网络异常', '网络连接不上，请重试 :)', 'error');
                }
              }
            );
          swal('', '数据删除成功.', 'success');
        } else {
          // swal('Cancelled', 'Your imaginary file is safe :)', 'error');
        }
      });
    }
  }

  //删除-数组数据
  deleteRows() {
    const rowdata = this.globalService.deleteArray(this.tableData, this.selected);
    this.pageConfig.totalSize = this.pageConfig.totalSize - this.selected.length;
    this.selected = [];
    this.table.offset = 0;
    return rowdata;
  }

  //过滤 - 匹配所有栏位的过滤
  onFilterTable(value: any) {
    if (this.tableData.length >= 1) {
      this.rows = this.filterService.filterTable(value, this.tableData, this.columns);
    }
  }

  //选择 - 表格数据
  onSelect({ selected }) {
    console.log('Event: select', event, this.selected);
    this.selected.splice(0, this.selected.length);
    this.selected.push(...selected);
  }

  public summaryForGender(cells: string[]) {
    const males = cells.filter(cell => cell === '男').length;
    const females = cells.filter(cell => cell === '女').length;

    return `男: ${males}, 女: ${females}`;
  }

}
