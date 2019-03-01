import { Component, OnInit, ViewEncapsulation, TemplateRef, ViewChild } from '@angular/core';
import { StudentService } from '../student/student.service';
import { RequestPage} from '../../../system/result/page';
import { Student } from '../student/student';
import { Result } from '../../../system/result/result';
import { NgxDataTableMessage} from '../../../system/table/ngx-dataTable';
import { AuthService } from '../../../system/auth/auth.service';
import { GlobalService } from '../../../system/utils/global.service';
import { BodyPageDto } from '../../../system/dto/dto';
import { FilterService } from '../../../system/table/filter.service';
import swal from 'sweetalert';
import { Item } from '../item/item';
import { ItemService } from '../item/item.service';
import { Score } from './assess';
import { ScoreService } from '../score/score.service';
import { TypeCodeService, cst_score_title } from '../common/typecode.service';

@Component({
  selector: 'app-assess',
  templateUrl: './assess.component.html',
  styleUrls: ['./assess.component.scss'],
  encapsulation: ViewEncapsulation.None
})
export class AssessComponent implements OnInit {

  public studentSelected: Student[] = [];
  public studentRows: Array<Student> = [];

  public studentMessage: NgxDataTableMessage = new NgxDataTableMessage();

  public itemSelected: Item[] = [];
  public itemRows: Array<Item> = [];

  public scoreRows: Score[] = [];

  constructor(private studentService: StudentService,
    private itemService: ItemService,
    private scoreService: ScoreService,
    private typeCodeService: TypeCodeService,
    private authService: AuthService,
    private globalService: GlobalService,
    private filterService: FilterService) { }

  ngOnInit() {
  }

  //查询 - 学生信息
  onGetStudentList(grade: string, specialty: string) {
    const requestbody: BodyPageDto<{}, RequestPage> = new BodyPageDto();
    requestbody.body = {
      'code': '',
      'name': '',
      'grade': grade,
      'specialty': specialty
    }
    const page: RequestPage = new RequestPage();
    page.size = 10;
    page.page = 0;
    page.paged = false;
    requestbody.page = page;

    this.studentService.getListDto(requestbody)
      .subscribe(
        (resp) => {
          console.log(JSON.stringify(resp));
          const result: Result<Student[]> = resp;
          if (result.status) {
            this.studentRows = result.data;
          } else {
            console.log('get student list failure' + result.msg)
            confirm("网络连接不上，请重试");
          }
        }
      );
  }

  onSelectStudent({ selected }) {
    console.log('Event: select', event, this.studentSelected);
    this.studentSelected.splice(0, this.studentSelected.length);
    this.studentSelected.push(...selected);
  }


  //查询 - 考核项目信息
  onGetItemList(item: string, category: string) {
    const requestbody: BodyPageDto<{}, RequestPage> = new BodyPageDto();
    requestbody.body = {
      'item': item,
      'category': category,
      'gender': ''
    }
    const page: RequestPage = new RequestPage();
    page.size = 10;
    page.page = 0;
    page.paged = false;
    requestbody.page = page;

    this.itemService.getList(requestbody)
      .subscribe(
        (resp) => {
          console.log(JSON.stringify(resp));
          const result: Result<Item[]> = resp;
          if (result.status) {
            this.itemRows = result.data;
          } else {
            console.log('get item list failure' + result.msg)
            confirm("网络连接不上，请重试");
          }
        }
      );
  }

  onSelectItem({ selected }) {
    console.log('Event: select', event, this.itemSelected);
    this.itemSelected.splice(0, this.itemSelected.length);
    this.itemSelected.push(...selected);
  }

  onBuildScore(i_title: string) {
    if (this.globalService.IsEmpty(i_title)) {
      swal('请输入考核标题!');
      return;
    };

    const body = {
      'type': cst_score_title,
      'code': i_title
    };

    this.typeCodeService.existById(body)
      .subscribe(
        (resp) => {
          const result: Result<boolean> = resp;
          if (result.status) {
            if (result.data){
              swal('',i_title+' 考核标题已存在，请重新输入！', 'warning');
              return;              
            }
          } else {
            console.log('get score_category code failure' + result.msg)
            confirm("网络连接不上，请重试");
          }
        }
      );
    
    if (this.studentSelected.length <= 0) {
      swal('请选择考核学生！');
      return;
    }
    if (this.itemSelected.length <= 0) {
      swal('请选择考核项目！');
      return;
    }


    this.scoreRows = [];
    this.studentSelected.forEach((student) => {
      this.itemSelected.forEach((itemr) => {
        if (student.gender == itemr.gender) {
          const score = new Score();
          score.title = i_title;
          score.code = student.code;
          score.name = student.name;
          score.grade = student.grade;
          score.specialty = student.specialty;
          score.gender = student.gender;
          score.ficId = itemr.id;
          score.item = itemr.item;
          score.category = itemr.category;
          score.unit = itemr.unit;
          score.great = itemr.great;
          score.good = itemr.good;
          score.pass = itemr.pass;
          score.sremark = 'build';
          score.createdBy = this.authService.authUser.username;
          score.updatedBy = score.createdBy;
          score.createdDate = this.globalService.getTodayTime();
          score.updatedDate = score.createdDate;
          this.scoreRows.push(score);
        }
      })
    }
    )
  }

  onSave(i_title: string) {
    if (this.globalService.IsEmpty(i_title)) {
      swal('请输入考核标题!');
      return;
    };

    if (this.scoreRows.length <= 0) {
      swal('请先生成学生考核项目后，才能提交保存！');
      return;
    }


    this.scoreRows.forEach(item => {
      item.title = i_title;
    });

    this.scoreService.save(this.scoreRows).subscribe(
      (resp) => {
        const result: Result<boolean> = resp;
        if (result.status) {
          if (result.data) {
            swal('保存成功', result.msg, 'success');
          } else {
            swal('', i_title+' 考核标题已存在，请重新输入！', 'warning');
          }
        } else {
          console.log(JSON.stringify(resp));
          swal('保存失败', '网络连接不上，请重试', 'error');
        }
      }
    );
  }

  existByTitle(title: string) {
  
    const body = {
      'type': cst_score_title,
      'code': title
    };

    this.typeCodeService.existById(body)
      .subscribe(
        (resp) => {
          console.log(JSON.stringify(resp));
          const result: Result<boolean> = resp;
          if (result.status) {
            const IsExist = result.data;
          } else {
            console.log('get score_category code failure' + result.msg)
            confirm("网络连接不上，请重试");
          }
        }
      );
  }


}
