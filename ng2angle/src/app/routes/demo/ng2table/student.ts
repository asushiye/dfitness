export class Student {
    'code':string;
    'name':string;
    'gender':string;
    'age':number;
    'grade':string;
    'specialty':string;
    'sclass':string;
    'createdBy':string;
    'createdDate':string;
    'updatedBy':string
    'updatedDate':string;
}

export const  Columns: Array<any> = [
    { title: 'code', name: 'code', filtering: { filterString: '', placeholder: 'Filter by code' } },
    { title: 'name', name: 'name', filtering: { filterString: '', placeholder: 'Filter by name' }, sort: false },
    { title: 'gender', name: 'gender', filtering: { filterString: '', placeholder: 'Filter by gender' }, sort: '' },
    //   { title: 'age', name: 'age', sort: 'asc', className: ['email-header', 'text-success'] },
    { title: 'grade', name: 'grade', filtering: { filterString: '', placeholder: 'Filter by grade' }, className: 'text-warning' },
    { title: 'specialty', name: 'specialty', filtering: { filterString: '', placeholder: 'Filter by specialty' } },
    //   { title: 'sclass', name: 'sclass' },
    { title: 'createdBy', name: 'createdBy' },
    { title: 'createdDate', name: 'createdDate' }
];


export const wb_tmp_name='学生导入模版.xlsx';
export const ws_tmp_name='学生信息';

export const wb_export_name='学生信息.xlsx';
export const ws_export_name='学生信息';


export interface StudentInterface {
    '学号':string;
    '姓名':string;
    '性别':string;
    '专业':string;
    '年级':string;
} 

export const TemplateData=[
    {'学号':'0123456789','姓名':'张三','性别':'男','专业':'临床医学五年制','年级':'2019' }
];


