import { Component, OnInit, ViewEncapsulation, TemplateRef, ViewChild } from '@angular/core';
import { StudentService } from './student.service';
import { ResponsePage, ResponsePageEx, RequestPage, PageConfig } from '../../../system/result/page';
import { Student, Columns, TemplateData, wb_tmp_name, ws_tmp_name, StudentInterface, wb_export_name, ws_export_name } from './student';
import { Result } from '../../../system/result/result';
import { NgxDataTableMessage, Filter, TableFilter } from '../../../system/table/ngx-dataTable';
import * as XLSX from 'xlsx';
import { AuthService } from '../../../system/auth/auth.service';
import { GlobalService } from '../../../system/utils/global.service';
import { DatatableComponent } from '@swimlane/ngx-datatable';
import { BodyPageDto } from '../../../system/dto/dto';
import { FilterService } from '../../../system/table/filter.service';
import swal from 'sweetalert';
import { FitnessService } from '../common/fitness.service';


@Component({
    selector: 'app-user',
    templateUrl: './student.component.html',
    styleUrls: ['./student.component.scss'],
    encapsulation: ViewEncapsulation.None
})
export class StudentComponent implements OnInit {

    @ViewChild('headerTmp') headerTmp: TemplateRef<any>;
    @ViewChild('cellTmp') cellTmp: TemplateRef<any>;
    @ViewChild(DatatableComponent) table: DatatableComponent;

    public tableMessage: NgxDataTableMessage = new NgxDataTableMessage();

    public tableData: Array<Student> = [];
    public selected: Student[] = [];
    public rows: Array<Student> = [];
    public columns: Array<any> = [
        { name: '', width: 30, sortable: false, canAutoResize: false, draggable: false, resizeable: false, headerCheckboxable: true, checkboxable: true },
        { cellTemplate: this.cellTmp, headerTemplate: this.headerTmp, name: 'code', prop: 'code' },
        { cellTemplate: this.cellTmp, headerTemplate: this.headerTmp, name: 'name' },
        { name: 'gender', summaryFunc: (cells) => this.summaryForGender(cells) },
        { name: 'grade' },
        { cellTemplate: this.cellTmp, headerTemplate: this.headerTmp, name: 'specialty' },
        { name: 'createdBy' },
        { name: 'createdDate' }
    ];

    public requestPage = new RequestPage();
    public pageConfig = new PageConfig();

    constructor(private studentService: StudentService,
        private fitnessService:FitnessService,
        private authService: AuthService,
        private globalService: GlobalService,
        private filterService: FilterService) { }

    ngOnInit() {
    }

    //统一参数查询 - 学生信息, 推荐使用
    onGetListDto(code: string, name: string, grade: string, specialty: string,
        pageInfo: any = { offset: this.requestPage.page, limit: this.requestPage.size }) {
        const requestbody: BodyPageDto<{}, RequestPage> = new BodyPageDto();
        requestbody.body = {
            'code': code,
            'name': name,
            'grade': grade,
            'specialty': specialty
        }
        const page: RequestPage = new RequestPage();
        page.size = pageInfo.limit;
        page.page = pageInfo.offset;
        page.paged = true;
        requestbody.page = page;

        this.pageConfig.page = pageInfo.offset;

        this.studentService.getListDto(requestbody)
            .subscribe(
                (resp) => {
                    console.log(JSON.stringify(resp));
                    const result: Result<ResponsePage<Student[]>> = resp;
                    if (result.status) {
                        const responsePage: ResponsePage<Student[]> = result.data;
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
    // {"count":611,"pageSize":10,"limit":10,"offset":3}

    //下载 - 学生信息
    onDownLoadStudent(code: string, name: string, grade: string, specialty: string) {
        const requestbody: BodyPageDto<{}, {}> = new BodyPageDto();
        requestbody.body = {
            'code': code,
            'name': name,
            'grade': grade,
            'specialty': specialty
        }
        requestbody.page = {
            'paged': false,
            'size': 0,
            'page': 0
        };

        this.studentService.getListDto(requestbody)
            .subscribe(
                (resp) => {
                    console.log(JSON.stringify(resp));
                    const result: Result<Student[]> = resp;
                    if (result.status) {
                        const students: Student[] = result.data;
                        console.log(JSON.stringify(students));
                        let jsonData: Array<any> = [];
                        const transform = this.transformStudentData(students, jsonData);
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

    //转换-学生信息
    transformStudentData(students: Student[], uploadData: Array<any> = []): boolean {
        let i = 0;
        students.forEach(item => {
            const rowData = { '学号': item.code, '姓名': item.name, '性别': item.gender, '专业': item.specialty, '年级': item.grade, '导入时间': item.createdDate };
            uploadData[i++] = rowData;
        });
        return i >= 1;
    }


    //下载 - 学生导入模版
    onDownloadStudentTemplate() {
        this.globalService.downloadXlsx(TemplateData, wb_tmp_name, ws_tmp_name);
    }


    // 上传- 导入学生信息
    onUploadStudentXlsx(evt: any) {
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
            let students: Student[] = [];

            const validation = this.validationUploadStudentData(jsonData, students);
            if (validation) {
                this.studentService.uploadJson(students)
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
    validationUploadStudentData(uploadData: any, students: Student[] = []): boolean {
        let studentInterface: StudentInterface[] = uploadData;
        let i = 1;
        studentInterface.forEach(item => {
            i++;
            const tmp = new Student();
            if (this.globalService.IsEmpty(item.学号)){
                alert("第" + i + "行,学号不能为空");
                return false;
            }else{
                tmp.code= this.globalService.getValue(item.学号);
            };
            if (this.globalService.IsEmpty(item.姓名)){
                alert("第" + i + "行,姓名不能为空");
                return false;
            }else{
                tmp.name= this.globalService.getValue(item.姓名);
            };
            if (this.globalService.IsEmpty(item.性别)){
                alert("第" + i + "行,性别不能为空");
                return false;
            }else{
                tmp.gender= item.性别.trim();
            };
            if (this.globalService.IsEmpty(item.专业)){
                alert("第" + i + "行,专业不能为空");
                return false;
            }else{
                tmp.specialty= item.专业.trim();
            };
            if (this.globalService.IsEmpty(item.年级)){
                alert("第" + i + "行,年级不能为空");
                return false;
            }else{
                tmp.grade= this.globalService.getValue(item.年级);
            };
            
            tmp.createdBy = this.authService.authUser.username;
            tmp.updatedBy = tmp.createdBy;
            tmp.createdDate = this.globalService.getTodayTime();
            tmp.updatedDate = tmp.createdDate;
            students[i-2] = tmp;
        });
        return true;
    }



    onDelete() {
        let body: Array<string> = [];
        this.selected.forEach((row) => {
            body.push(row.code);
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
                    this.studentService.delete(body)
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

    //过滤 - 按每个栏位和栏位过滤条件进行过滤
    onFilterColumn(value: any) {
        if (this.tableData.length >= 1) {
            const filter = new Filter();
            filter.name = 'code';
            filter.filterString = value;

            const filters: Array<Filter> = []
            filters.push(filter);
            this.rows = this.filterService.filterColumn(filters, this.tableData, this.columns);
        }
    }

    //演示 - xlsx文件下载
    onDemoDownXlsx() {
        const data = [
            ['1', 'a', 'aa'],
            ['2', 'b', 'bb'],
            ['3', 'c', 'cc']
        ]

        const jsonData = [
            { '学号': '0123456789', '姓名': '张三', '性别': '男', '专业': '临床医学五年制', '年级': '2019' }
        ];

        const domData = null;

        /* generate worksheet */
        const ws1: XLSX.WorkSheet = XLSX.utils.aoa_to_sheet(data);
        const ws2: XLSX.WorkSheet = XLSX.utils.json_to_sheet(jsonData);
        // const ws3: XLSX.WorkSheet = XLSX.utils.table_to_sheet(domData);


        /* generate workbook and add the worksheet */
        const wb: XLSX.WorkBook = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(wb, ws1, 'Sheet1');
        XLSX.utils.book_append_sheet(wb, ws2, 'Sheet2');
        // XLSX.utils.book_append_sheet(wb, ws3, 'Sheet3');

        console.log(wb)
        /* save to file */
        XLSX.writeFile(wb, 'demoSheet.xlsx');
    }

    onSelect({ selected }) {
        console.log('Event: select', event, this.selected);
        this.selected.splice(0, this.selected.length);
        this.selected.push(...selected);
    }

    onActivate(event) {
        console.log('Event: activate', event);
    }

    editing = {};
    updateValue(event, cell, rowIndex) {
        console.log('inline editing rowIndex', rowIndex)
        this.editing[rowIndex + '-' + cell] = false;
        this.rows[rowIndex][cell] = event.target.value;
        this.rows = [...this.rows];
        console.log('UPDATED!', this.rows[rowIndex][cell]);
    }

    public summaryForGender(cells: string[]) {
        const males = cells.filter(cell => cell === '男').length;
        const females = cells.filter(cell => cell === '女').length;

        return `男: ${males}, 女: ${females}`;
    }

}
