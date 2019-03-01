/*
 * @Author: asushiye
 * @Date: 2019-01-10 17:10:40
 * @Commit: 
 * 设置服务端返回的信息： 用户信息，菜单信息，操作权限
 * 前端在接收时，需要按前端结构进行转换
 */
 
export class AuthUser {
    'id': number;
    'username': string;
    'password': string;
    'email': string;
    'phone': string;
    'salt': string;
    'status': number;
    'createTime': string;
    'updateTime': string;
    'permissionList': Array<AuthMenu>;
    'codeList':Array<string>;
}

export class AuthMenu {
    "id":number;
    "pid":number;
    "name":string;
    "text":string;
    "heading":boolean;
    "link":string;
    "elink":string;
    "icon": string;
    "target":string;
    "alert":string;
    "label":string;
    "permission":string;
    "oids":string;
    "operations":AuthOperation[];
    "children":AuthMenu[];
    "sort":number;
    "enable":boolean;
}


export class AuthOperation {
    "description":string;
    "enable":boolean;
    "id":string;
    "name":string;
    "permission":string
}
