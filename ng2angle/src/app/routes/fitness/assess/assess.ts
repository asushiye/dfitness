export class Score {
    'title': string;
    'code': string;
    'name': string;
    'grade': string;
    'specialty': string;
    'ficId': string;
    'item': string;
    'category': string;
    'gender': string;
    'unit': string;
    'great': string;
    'good': string;
    'pass': string;
    'value'?: string;
    'comment'?: string;
    'sremark'?: string;
    'createdBy': string;
    'createdDate': string;
    'updatedBy': string
    'updatedDate': string;
}

export const columns: Array<any> = [
    { name: 'title' },
    { name: 'code' },
    { name: 'name' },
    { name: 'grade' },
    { name: 'specialty' },
    { name: 'item' },
    { name: 'category' },
    { name: 'gender'},
    { name: 'unit' },
    { name: 'value' },
    { name: 'createdBy' },
    { name: 'createdDate' }
];

export const Columns: Array<any> = [
    { prop: 'code' },
    { name: 'name' },
    { name: 'gender' },
    { name: 'grade' },
    { name: 'specialty' }
];

export const ItemColumns: Array<any> = [
    { name: 'item' },
    { name: 'category' },
    { name: 'gender'},
    { name: 'unit' }
];

export const wb_tmp_name = '项目评分标准导入模版.xlsx';
export const ws_tmp_name = '项目评分标准';

export const wb_export_name = '项目评分标准.xlsx';
export const ws_export_name = '项目评分标准';


export interface ItemInterface {
    '考核项目': string;
    '类别': string;
    '性别': string;
    '单位': string;
    '优秀': number;
    '良好': number;
    '及格': number;
}



