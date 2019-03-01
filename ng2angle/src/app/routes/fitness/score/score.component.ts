import { Component, OnInit, ViewChild, ViewEncapsulation } from '@angular/core';
import { DatatableComponent } from '@swimlane/ngx-datatable';
import { NgxDataTableMessage } from '../../../system/table/ngx-dataTable';
import { Score,wb_export_name, ws_export_name, wb_tmp_name, ws_tmp_name, 
  TemplateData, ScoreInterface,ScoreColumns} from './score';
import { RequestPage, PageConfig, ResponsePage } from '../../../system/result/page';
import { ScoreService } from './score.service';
import { AuthService } from '../../../system/auth/auth.service';
import { GlobalService } from '../../../system/utils/global.service';
import { FilterService } from '../../../system/table/filter.service';
import { BodyPageDto } from '../../../system/dto/dto';
import { Result } from '../../../system/result/result';
import * as XLSX from 'xlsx';
import swal from 'sweetalert';
import { TimepickerModule } from 'ngx-bootstrap/timepicker';
import { FitnessService } from '../common/fitness.service';
import { TypeCodeService, cst_score_title } from '../common/typecode.service';

@Component({
  selector: 'app-score',
  templateUrl: './score.component.html',
  styleUrls: ['./score.component.scss'],
  encapsulation: ViewEncapsulation.None
})
export class ScoreComponent implements OnInit {

  @ViewChild(DatatableComponent) table: DatatableComponent;

  public tableMessage: NgxDataTableMessage = new NgxDataTableMessage();

  public tableData: Array<Score> = [];
  public selected: Score[] = [];
  public rows: Array<Score> = [];
  public changeRows: Array<Score> = [];
  public columns = ScoreColumns;
  public titleList: any[] = [{'code':'','name':''}];
  selectTitle: string='';

  constructor(private scoreService: ScoreService,
    private fitnessService:FitnessService,
    private typeCodeService: TypeCodeService,
    private authService: AuthService,
    private globalService: GlobalService,
    private filterService: FilterService) { }

  ngOnInit() {
     this.onGetCode();

  }

  public requestPage = new RequestPage();
  public pageConfig = new PageConfig();


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
            if (this.titleList.length >= 1){
              this.selectTitle= this.titleList[0].code;
            }
            console.log(JSON.stringify(this.titleList));
          } else {
            console.log('get score_category code failure' + result.msg)
            confirm("网络连接不上，请重试");
          }
        }
    );
  }


  //查询 - 考核项目
  onGetList(title: string, item: string, code: string, name: string, specialty: string, category: string) {
    if (! this.checkTitle(title)){
      return ;
    };
    const requestbody: BodyPageDto<{}, RequestPage> = new BodyPageDto();
    requestbody.body = {
      'title': title,
      'item': item,
      'code': code,
      'name': name,
      'specialty':specialty,
      'category': category
    }
    const page: RequestPage = new RequestPage();
    page.size = 10;
    page.page = 0;
    page.paged = false;
    requestbody.page = page;

    // this.pageConfig.page = pageInfo.offset;

    this.scoreService.getList(requestbody)
      .subscribe(
        (resp) => {
          console.log(JSON.stringify(resp));
          const result: Result<Score[]> = resp;
          if (result.status) {
            this.tableData = result.data;
            this.onChangeTable();
          } else {
            console.log('get List failure' + result.msg)
            swal('查询失败','网络连接不上，请重试','warning');
          }
        }
      );
  }

  //变动 - 表格数据
  public onChangeTable(): void {
    this.rows = this.tableData.slice(0, this.tableData.length);
  }

  //下载 - 项目信息
  onDownLoad(title: string, item: string, code: string, name: string, specialty: string, category: string) {
    if (! this.checkTitle(title)){
      return ;
    };
    const requestbody: BodyPageDto<{}, {}> = new BodyPageDto();
    requestbody.body = {
      'title': title,
      'item': item,
      'code': code,
      'name': name,
      'specialty':specialty,
      'category': category
    }
    requestbody.page = {
      'paged': false,
      'size': 0,
      'page': 0
    };

    this.scoreService.getList(requestbody)
      .subscribe(
        (resp) => {
          console.log(JSON.stringify(resp));
          const result: Result<Score[]> = resp;
          if (result.status) {
            const items: Score[] = result.data;
            console.log(JSON.stringify(items));
            let jsonData: Array<any> = [];
            const transform = this.transformData(items, jsonData);
            if (transform) {
              this.globalService.downloadXlsx(jsonData, wb_export_name, ws_export_name);
            } else {
              swal('查询失败','按条件查询无数据，请重新填写条件','warning');
            }
          } else {
            console.log('onExport failure' + result.msg)
            swal('查询失败','网络连接不上，请重试','warning');
          }
        }
      );
  }

  //转换-项目信息
  transformData(scores: Score[], uploadData: Array<any> = []): boolean {
    let i = 0;
    scores.forEach(score => {
      const rowData = {
        '姓名': score.name, 
        '学号': score.code, 
        '性别': score.gender, 
        '专业': score.specialty, 
        '类别': score.category, 
        '考核项目': score.item, 
        '单位': score.unit, 
        '成绩': score.value};
      uploadData[i++] = rowData;
    });
    return i >= 1;
  }

  checkTitle(title: string=''):Boolean{
    const isNotNull = title.length >= 1;
    if (!isNotNull){
      swal('','请选择考核标题！','info');
    }
    return isNotNull;
  }

  //下载 - 学生考核项目导入模版
  onDownloadTemplate(title:string) {
      this.globalService.downloadXlsx(TemplateData, wb_tmp_name, ws_tmp_name);
  }


  // 上传- 导入项目评分信息
  onUploadXlsx(title:string, evt: any) {
    if (this.globalService.IsEmpty(title)){
      swal({ title: '', text: '请选择考核标题', type: 'info' });
      return;      
    };

    if (this.rows.length <= 0){
      swal({ title: '', text: '请先查询学生考核项目', type: 'info' });
      return ;
    };

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
      let scores: Score[] = [];

      const validation = this.validationUploadData(jsonData, scores);
      if (validation) {
        swal('','上传成功','success');
      }
    };
    reader.readAsBinaryString(target.files[0]);
  }


  //验证-学生信息
  validationUploadData(uploadData: any, items: Score[] = []): boolean {
    let scoreInterface: ScoreInterface[] = uploadData;
    let i = 1;
    scoreInterface.forEach(score=> {
      i++;     
      const tmp= new Score();
      if (this.globalService.IsEmpty(score.姓名)){
        alert("第" + i + "行,姓名不能为空");
        return false;
      }else{
        tmp.name= score.姓名.trim();
      };
      if (this.globalService.IsEmpty(score.性别)){
        alert("第" + i + "行,性别不能为空");
        return false;
      }else{
        tmp.gender= score.性别.trim();
      };
      if (this.globalService.IsEmpty(score.学号)){
        alert("第" + i + "行,学号不能为空");
        return false;
      }else{
        tmp.code= this.globalService.getValue(score.学号);
      };
      if (this.globalService.IsEmpty(score.类别)){
        alert("第" + i + "行,类别不能为空");
        return false;
      }else{
        tmp.category= score.类别.trim();
      };
      if (this.globalService.IsEmpty(score.考核项目)){
        alert("第" + i + "行,考核项目不能为空");
        return false;
      }else{
        tmp.item= score.考核项目.trim();
      };
      if (this.globalService.IsEmpty(score.单位)){
        alert("第" + i + "行,单位不能为空");
        return false;
      }else{
        tmp.unit= score.单位.trim();
      };

      if (this.globalService.IsEmpty(score.成绩)){
        alert("第" + i + "行,成绩不能为空");
        return false;
      }else{
        tmp.value= this.globalService.getValue(score.成绩);
      };
    
      if (this.fitnessService.IsBMIOrPMF(tmp.item)){
        let info:{status:boolean,error:string}= this.fitnessService.checkBMIOrPMI(tmp.value);
        if (!info.status){
          alert("第" + i + "行, 成绩"+info.error);
          return false;
        }
      }else{
        let info:{status:boolean,error:string}= this.fitnessService.checkScore(tmp.value);
        if (!info.status){
          alert("第" + i + "行, 成绩"+info.error);
          return false;
        }
      }
      
      this.rows.forEach((row)=>{
        if ((row.code==tmp.code) && (row.item==tmp.item) && (row.category==tmp.category)){
          row.value = tmp.value;
          if (this.fitnessService.IsBMIOrPMF(tmp.item)){
            tmp.comment = this.fitnessService.calcBMIComment(tmp.value, row.great, row.pass); 
          }else{
            tmp.comment = this.fitnessService.calcComment(tmp.value, row.great, row.good, row.pass); 
          };
          row.comment = tmp.comment;   
          row.updatedDate = this.globalService.getTodayTime();
          return false;
        }
      })
      items= this.rows;
    });
    return true;
  }

  onSave(){
    if (this.rows.length <= 0){
      swal({ title: '', text: '请先查询学生考核项目，并上传学生成绩', type: 'info' });
      return ;
    };

    if (this.stillEmpty()){
      swal({
        title: '',
        text: '还有学生未上传成绩，请确定是否要立即保存学生成绩 ？',
        type: 'info',
        showCancelButton: true,
        // confirmButtonColor: '#DD6B55',
        confirmButtonText: '确定',
        cancelButtonText: '稍后',
        cancelButtonColor: '#DD6B55',
        closeOnConfirm: false,
      }, (isConfirm) => {
        if (isConfirm) {
          this.save();
        } else {
          // swal('Cancelled', 'Your imaginary file is safe :)', 'error');
        }
      });
  }else{
    this.save();
  }

  }

  save(){    
    this.scoreService.update(this.rows)
    .subscribe(
      (resp) => {
        console.log(JSON.stringify(resp));
        const result: Result<String> = resp;
        if (result.status) {
          swal('','保存成功','success');
        } else {
          console.log('get List failure' + result.msg)
          swal('','网络连接不上，请重试','warning');
        }
      }
    )
  }


  onClear(){
    this.rows.forEach((row)=>{
      row.value = '';
      row.comment = '';
    })
  };
  
  stillEmpty():boolean{
    let isEmpty = false;
    this.rows.forEach((row)=>{
      if (this.globalService.IsEmpty(row.value)){
        isEmpty= true;
        return ; 
      }
    })
    return isEmpty;
  }

  onDelete(title:string) {
    const body={
      'title':title
    };

    if (this.globalService.IsEmpty(title)){
      swal({ title: '', text: '请选择考核标题', type: 'info' });
      return;      
    } else {
      swal({
        title: '',
        text: '请确定真的要删除[' + title + ']考核标题的数据 ？',
        type: 'info',
        showCancelButton: true,
        confirmButtonColor: '#DD6B55',
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        closeOnConfirm: false,
      }, (isConfirm) => {
        if (isConfirm) {
          this.scoreService.deleteByTitle(body)
            .subscribe(
              (resp) => {
                console.log(JSON.stringify(resp));
                const result: Result<string> = resp;
                if (result.status) {
                  const icount: string = result.data;
                  this.rows = [];
                  this.onGetCode();
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
