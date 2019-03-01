/*
 * @Author: asushiye
 * @Date: 2019-01-10 16:58:52
 * @Commit: RequestPage, PageConfig, ResponsePage, ResponsePageEx
 */

 export class RequestPage {
    'paged':boolean;            //分页标识,默认true
    'page':number;              //请求第几页, 默认第一页 0
    'size':number;              //请求每页限制数, 默认 10条
    constructor(){
        this.paged = true;
        this.page = 0;
        this.size=10;
    }
}


export class PageConfig extends RequestPage {
    'showPage':number;          //显示页数,默认 5
    'realSize':number;          //实际返回记录数，默认0
    'realPage':number;          //实际返回页码，默认0
    'totalSize' :number;        //实际返回总记录数，默认0
    'totalPage': number;        //实际返回总页数,默认 0 
    constructor(){
        super();
        this.showPage = 5;
        this.realSize = 0;
        this.realPage = 0;
        this.totalSize = 0;
        this.totalPage = 0;
    }
}

// 后端访问分页基本属性
export class ResponsePage<T> {
    'content':T;  
    'realSize':number;
    'totalSize':number;
}

// 后端访问分页扩展属性
export class ResponsePageEx<T> extends ResponsePage<T> {
    'paged':boolean;
    'sorted':boolean;
    'first':boolean;
    'last':boolean;
    'realPage':number;
    'totalPage':number;
}
