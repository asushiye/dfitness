import { Component, OnInit } from '@angular/core';
import { StudentService } from './student.service';
import { ResponsePage,ResponsePageEx, RequestPage, PageConfig } from '../../../system/result/page';
import { Student, Columns, TemplateData, wb_tmp_name, ws_tmp_name, StudentInterface, wb_export_name, ws_export_name } from './student';
import { Result } from '../../../system/result/result';
import { Ng2TableService } from '../../../system/table/ng2Table.service';
import * as XLSX from 'xlsx';
import { AuthService } from '../../../system/auth/auth.service';
import { GlobalService } from '../../../system/utils/global.service';
import { BodyPageDto } from '../../../system/dto/dto';

@Component({
    selector: 'app-user',
    templateUrl: './student.component.html',
    styleUrls: ['./student.component.scss']
})
export class StudentComponent implements OnInit {

    public ng2TableData: Array<Student>;
    public rows: Array<any> = [];
    public columns = Columns;
    public pageConfig = new PageConfig();

    public config: any = {
        paging: true,
        sorting: { columns: this.columns },
        filtering: { filterString: '' },
        className: ['table-striped', 'table-bordered', 'mb-0', 'd-table-fixed']
    };

    // public error: any;

    constructor(private studentService: StudentService,
        private authService: AuthService,
        private globalService: GlobalService,
        private ng2TableService: Ng2TableService) { }

    ngOnInit() {
        this.pageConfig.page= 1; 
    }

    //分页查询 - 学生信息
    onGetList(code: string, name: string, grade: string, specialty: string, 
        pageinfo: any = { page: this.pageConfig.page, itemsPerPage: this.pageConfig.size}) {
        const body = {
            'code': code,
            'name': name,
            'grade': grade,
            'specialty': specialty,
            'paged': true,
            'page': pageinfo.page-1,
            'size': pageinfo.itemsPerPage
        };
        
        this.studentService.getList(body)
            .subscribe(
                (resp) => {
                    console.log(JSON.stringify(resp));
                    const result: Result<ResponsePage<Student[]>> = resp;
                    if (result.status) {
                        const ResponsePage: ResponsePage<Student[]> = result.data;
                        this.ng2TableData = ResponsePage.content;
                        this.pageConfig.totalSize = ResponsePage.totalSize;
                        // this.requestPage.numPages = ResponsePage.totalPages;
                        this.pageConfig.realSize = ResponsePage.realSize;
                        this.onChangeTable(this.config);
                    } else {
                        console.log('get List failure' + result.msg)
                        confirm("网络连接不上，请重试");
                    }
                }
            );
    }

       //分页查询 - 学生信息
    onGetListEx(code: string, name: string, grade: string, specialty: string, 
    pageinfo: any = { page: this.pageConfig.page, itemsPerPage: this.pageConfig.size}) {
    const body = {
        'code': code,
        'name': name,
        'grade': grade,
        'specialty': specialty,
        'paged': true,
        'page': pageinfo.page-1,
        'size': pageinfo.itemsPerPage
    };
    
    this.studentService.getListEx(body)
        .subscribe(
            (resp) => {
                console.log(JSON.stringify(resp));
                const result: Result<ResponsePageEx<Student[]>> = resp;
                if (result.status) {
                    const ResponsePage: ResponsePageEx<Student[]> = result.data;
                    this.ng2TableData = ResponsePage.content;
                    this.pageConfig.totalSize = ResponsePage.totalSize;
                    this.pageConfig.realSize = ResponsePage.realSize;
                    this.pageConfig.totalPage = ResponsePage.totalPage;
                    this.pageConfig.realPage = ResponsePage.realPage;
                    this.onChangeTable(this.config);
                } else {
                    console.log('get List failure' + result.msg)
                    confirm("网络连接不上，请重试");
                }
            }
        );
    }

   //分页查询 - 学生信息
   onGetListDto(code: string, name: string, grade: string, specialty: string, 
    pageinfo: any = { page: this.pageConfig.page, itemsPerPage: this.pageConfig.size}) {
        const requestbody: BodyPageDto<{}, RequestPage> = new BodyPageDto();
        requestbody.body={
            'code': code,
            'name': name,
            'grade': grade,
            'specialty': specialty               
        }
        const page: RequestPage=  new RequestPage();
        page.size = pageinfo.itemsPerPage;
        page.page = pageinfo.page-1;
        page.paged = true;
        requestbody.page = page; 

    this.studentService.getListDto(requestbody)
        .subscribe(
            (resp) => {
                console.log(JSON.stringify(resp));
                const result: Result<ResponsePageEx<Student[]>> = resp;
                if (result.status) {
                    const ResponsePage: ResponsePageEx<Student[]> = result.data;
                    this.ng2TableData = ResponsePage.content;
                    this.pageConfig.totalSize = ResponsePage.totalSize;
                    this.pageConfig.realSize = ResponsePage.realSize;
                    this.pageConfig.totalPage = ResponsePage.totalPage;
                    this.pageConfig.realPage = ResponsePage.realPage;
                    this.onChangeTable(this.config);
                } else {
                    console.log('get List failure' + result.msg)
                    confirm("网络连接不上，请重试");
                }
            }
        );
    }

    //变动 - 表格数据
    public onChangeTable(config: any): any {
        if (config.filtering) {
            (<any>Object).assign(this.config.filtering, config.filtering);
        }

        if (config.sorting) {
            (<any>Object).assign(this.config.sorting, config.sorting);
        }

        this.rows = this.ng2TableService.changeTableForServer(this.ng2TableData, this.config);
    }

       //下载 - 学生信息
       onDownLoadStudent(code: string, name: string, grade: string, specialty: string) {
        const body = {
            'code': code,
            'name': name,
            'grade': grade,
            'specialty': specialty,
            'paged': false,
            'pageNum': 0,
            'pageSize': 0
        };
 
        this.studentService.getList(body)
            .subscribe(
                (resp) => {
                    console.log(JSON.stringify(resp));
                    const result: Result<Student[]> = resp;
                    if (result.status) {
                        const students: Student[] = result.data;
                        console.log(JSON.stringify(students));
                        let jsonData: Array<any>=[];
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
    transformStudentData(students: Student[], uploadData: Array<any>=[]): boolean {
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
                this.studentService.save(students)
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
        let i = 0;
        studentInterface.forEach(item => {
            const student = new Student();
            student.code = item.学号;
            student.name = item.姓名;
            student.gender = item.性别;
            student.specialty = item.专业;
            student.grade = item.年级;
            if (student.code.length <= 0) {
                alert("第" + (i + 2) + "行,学号不能为空");
                return false;
            }
            if (student.name.length <= 0) {
                alert("第" + (i + 2) + "行,姓名不能为空");
                return false;
            }
            if (student.gender.length <= 0) {
                alert("第" + (i + 2) + "行,性别不能为空");
                return false;
            }
            if (student.specialty.length <= 0) {
                alert("第" + (i + 2) + "行,专业不能为空");
                return false;
            }
            if (student.grade.length <= 0) {
                alert("第" + (i + 2) + "行,年级不能为空");
                return false;
            }
            student.createdBy = this.authService.authUser.username;
            student.updatedBy = student.createdBy;
            student.createdDate = this.globalService.getToday();
            student.updatedDate = student.createdDate;
            students[i++] = student;
        });
        return true;
    }


    public onCellClick(data: any): any {
        console.log(JSON.stringify(data));
        console.log(JSON.stringify(data.column));
        console.log(JSON.stringify(data.row));
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

}
