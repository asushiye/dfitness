# 安装向导

		打包部署
			数据库部署
			前后端整合部署
			前后端分离部署
		开发环境

## 数据库部署

安装mysql5.7数据库，创建数据库dfitness(utf8mb4 -- UTF-8 Unicode)，并运行数据库脚本fitness.sql。

## 前后端整合部署

### angular编译打包

使用angular进去前端开发时，虽然前端独立了，但是在实际生产环境，前后端整合一起部署

下面将spring mvc + angular进行整合部署

由于angular编译打包输出的是静态文件，只要将所有静态文件拷贝到 **\src\main\webapp** 就可以

1. 编译打包 `ng build --prod`

2. 将静态资源拷贝到spring mvc项目的webapp目录下

3. 设置spring-mvc 允许静态资源被访问

`<mvc:resources location="/" mapping="/**/*"/>` 表明 webapp目录下静态资源可以被访问，也可以指定目录来配置

这里要注意的是：前后端的代码是分离，因此在spring配置上和jsp方式不一样的

web服务器，使用tomcat8.0v版本

** 可以不可以省略输出文件的拷贝呢？**

只要在angular编译打包时，指定路径就可以

 `ng build --prod --aot --outputPath=out`


angular所有静态资源文件编译打包到out目录下，如果out目录不存在，则自动创建，如果已经存在，先删除在创建。

将out目录所有文件拷贝java的webapp目录下，就可以启动系统


### string打包部署


## 前后端分离部署

前端使用nginx服务，后端使用tomcat服务器

### 前端部署

#### nginx配置

前端服务器，要解决如下问题

1. index.html 作为后备页面
2. 指定监听服务IP，端口，文档根目录
3. 设置url拦截代理, 来解决不在同一个服务器上的跨域问题
4. 将编译出来的所有文件拷贝root目录下

```nginx
server {
    listen       4200;
    server_name  127.0.0.1;
    root   /fitness;
    try_files $uri $uri/ /index.html;   
    location /api {
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header REMOTE-HOST $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://127.0.0.1:8080/api;
    }

    location /student {
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header REMOTE-HOST $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://127.0.0.1:8080/student;
    }

    location /item {
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header REMOTE-HOST $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://127.0.0.1:8080/item;
    }

    location /score {
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header REMOTE-HOST $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://127.0.0.1:8080/score;
    }

    location /code {
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header REMOTE-HOST $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://127.0.0.1:8080/code;
    }
}
```

上面需要分开配置多个路由，我们统一个路由api开头，这要修改下后端访问url地址


## 开发环境

### java开发环境

使用IntelliJ IDEA 2018.2.4 x64 打开bfitness 目录


### angular开发环境

vscode 打开ng2angle目录

安装依赖包：执行`npm install`

设置angular代理配置文件proxy.conf.json：

```typescript
{
  "/api": {
    "target": "http://localhost:8082",
    "secure": false
  },
  "/student": {
    "target": "http://localhost:8082",
    "secure": false
  },
  "/item": {
    "target": "http://localhost:8082",
    "secure": false
  },
  "/score": {
    "target": "http://localhost:8082",
    "secure": false
  },
  "/code": {
    "target": "http://localhost:8082",
    "secure": false
  },
  "/img": {
    "target": "http://localhost:8082",
    "secure": false
  }

}
```

运行命令：`npm start` 或 `ng serve --proxy-config proxy.conf.json`

编译打包：`npm build` 或 `ng build --prod`

