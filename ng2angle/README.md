# Ng2angle

 npm start 

 ng serve --proxy-config proxy.conf.json


This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 6.0.1.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).


登录返回JSON


demo

font icon

search = search
add    = plus,plus-circle,plus-square,plus-square
delete = minus,minus-circle,minus-square, minus-square
trash,trash-alt,trash-alt

edit   = edit,edit

upload = upload,.icon-cloud-upload,cloud-upload-alt
download = download,cloud-download-alt,.icon-cloud-download


file = file-excel,file

               <em class="fa-2x mr-2 fas fa-plus-square"></em>
                <span>plus-square</span>
    
                <em class="fa-2x mr-2 fas fa-search"></em>
                <span>search</span>
    
                <em class="fa-2x mr-2 fas fa-minus-square"></em>
                <span>minus-square</span>
    
                <em class="fa-2x mr-2 fas fa-upload"></em>
                <span>upload</span>
    
                <em class="fa-2x mr-2 fas fa-download"></em>
                <span>download</span>
    
                <em class="fa-2x mr-2 fas fa-file-excel"></em>
                <span>file-excel</span>


开发规约更多查看

1. 组件中方法命名

用于模板调用格式 on+动作+实体  例如 onDownLoadStudent

模板自己调用格式 动作+实体    

2.服务方法命名

服务方法和后端方法名一致，一般约定为 动作+实体

所有方法，小写驼峰法命名

变量方法命名：小写驼峰法命名


angular 组件

分页：ngx-bootstrap/pagination   包装在SharedModule中
表格：@swimlane/ngx-datatable