export class Score {
    'id': string;
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

export const ScoreColumns: Array<any> = [
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

export const wb_tmp_name = '学生考核项目模版.xlsx';
export const ws_tmp_name = '学生考核项目';

export const wb_export_name = '学生考核项目导出.xlsx';
export const ws_export_name = '学生考核项目';


export interface ScoreInterface {
    '姓名': string;
    '性别': string;
    '学号': string;
    '专业': string;
    '类别': string;
    '考核项目': string;
    '单位': string;
    '成绩': string;
};

export const TemplateData = [
    { '姓名': '李四', '性别': '男', '学号': '100000','专业':'临床医学五年制', '类别':'空军学员', '考核项目': '单杠引体向上★', '单位':'次数', '成绩': '15'},
    { '姓名': '张飞', '性别': '男', '学号': '100001','专业':'临床医学五年制', '类别':'空军学员', '考核项目': '单杠引体向上★', '单位':'次数', '成绩': '缺勤'},
    { '姓名': '赵五', '性别': '男', '学号': '100002','专业':'临床医学五年制', '类别':'空军学员', '考核项目': '格斗术1-5组合', '单位':'评价', '成绩': '优秀'}
];


