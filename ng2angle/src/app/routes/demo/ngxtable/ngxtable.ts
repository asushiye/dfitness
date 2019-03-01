export class Student {
    'code': string;
    'name': string;
    'gender': string;
    'age': number;
    'grade': string;
    'specialty': string;
    'sclass': string;
    'createdBy': string;
    'createdDate': string;
    'updatedBy': string
    'updatedDate': string;
}



export const Columns: Array<any> = [
    { name: '',width:30, sortable:false,canAutoResize:false, draggable:false, resizeable:false, headerCheckboxable:true, checkboxable:true},
    { prop: 'code' },
    { name: 'name' },
    { name: 'gender' },
    { name: 'grade' },
    { name: 'specialty' },
    { name: 'createdBy' },
    { name: 'createdDate' }
];


export const wb_tmp_name = '学生导入模版.xlsx';
export const ws_tmp_name = '学生信息';

export const wb_export_name = '学生信息.xlsx';
export const ws_export_name = '学生信息';


export interface StudentInterface {
    '学号': string;
    '姓名': string;
    '性别': string;
    '专业': string;
    '年级': string;
}

export const TemplateData = [
    { '学号': '0123456789', '姓名': '张三', '性别': '男', '专业': '临床医学五年制', '年级': '2019' }
];

export class Filter{
    name: string;
    filterString: string;
    placeholder : string;
    constructor(){
        this.name = '';
        this.filterString = '';
        this.placeholder = '';
    }
}

export class TableFilter{
    AllFilter: Filter;
    ColumnFilters: Array<Filter>;
    constructor(){
        this.AllFilter= new Filter();
        this.AllFilter.name = 'ALL';
        this.ColumnFilters = [];
    }

    add(colFilter:Filter){
        this.ColumnFilters.push(colFilter);
    }
}

