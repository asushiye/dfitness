export class Item {
    'id': string;
    'item': string;
    'category': string;
    'gender': string;
    'unit': string;
    'great': string;
    'good': string;
    'pass': string;
    'createdBy': string;
    'createdDate': string;
    'updatedBy': string
    'updatedDate': string;
}

export const columns: Array<any> = [
    { name: 'item' },
    { name: 'category' },
    { name: 'gender'},
    { name: 'unit' },
    { name: 'great' },
    { name: 'good' },
    { name: 'pass' },
    { name: 'createdBy' },
    { name: 'createdDate' }
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
    '优秀': string;
    '良好': string;
    '及格': string;
}


export const TemplateData = [
    { '类别': '入学入伍训练', '考核项目': '单杠引体向上★', '性别': '男', '单位': '次数', '优秀': '15', '良好': '10', '及格': '5'}
];


