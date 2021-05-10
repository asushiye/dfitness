# guide

​    Technical description
​    deployment
​      Database deployment
​      Front and rear end integration deployment
​      Front and rear end split deployment
​      development environment

## Technical description

Dfitness will use spring and angular to develop web, separating it from the front and back

Bfitness: Spring MVC source code

Ng2angle: angular6 source code

Docs: the directory contains installation documents, development environment documents, user manual documents

## deployment

### Database deployment

Install mysql5.7 database, create database dfinness (utf8mb4 -- UTF-8 Unicode), and run database script fitness.sql.

Front and rear end integration deployment

Angular compilation package

When using angular to enter the front-end development, although the front end is independent, it is deployed in the actual production environment with the front and rear end integrated

Next, spring MVC + angular will be integrated and deployed

Since the angular compilation package output is static files, you can copy all static files to \src\main\webapp

Compiling and packaging ng build --prod

Copy static resources to webapp directory of spring MVC project

Set spring MVC to allow static resources to be accessed

< mvc:resources location= "/" mapping= "/ * * /" / / > indicates that static resources in webapp directory can be accessed or directory can be specified to configure

Note here that the code at the front and back ends is separate, so it is not the same as JSP in spring configuration

Web server, using tomcat8.0v version

**Can you omit the copy of the output file**

Specify a path as long as you compile the package in angular

ng build --prod --aot --outputPath=out

All static resource files in angular are compiled and packaged into out directory. If out directory does not exist, it will be created automatically. If it already exists, delete it in creation first.

Copy all files in out directory to webapp directory of Java, and then start the system

String package deployment

### Front and rear end split deployment

Nginx service is used in the front end and Tomcat server is used in the back end

Front end deployment

### Nginx configuration

The front-end server should solve the following problems

Index.html as backup page

Specify the IP, port, and document root of monitoring service

Set up URL interception agent to solve cross domain problems that are not on the same server

Copy all compiled files to root directory

```pro
server {
  listen 4200;

  server_ name 127.0.0.1;

  root /fitness;

  try_ files $uri $uri/ /index.html;

  location /api {

  proxy_ set_ header Host $http_ host;

  proxy_ set_ header X-Real-IP $remote_ addr;

  proxy_ set_ header REMOTE-HOST $remote_ addr;

  proxy_ set_ header X-Forwarded-For $proxy_ add_ x_ forwarded_ for;

  proxy_ pass http://127.0.0.1 :8080/api;

  }

  location /student {

  proxy_ set_ header Host $http_ host;

  proxy_ set_ header X-Real-IP $remote_ addr;

  proxy_ set_ header REMOTE-HOST $remote_ addr;

  proxy_ set_ header X-Forwarded-For $proxy_ add_ x_ forwarded_ for;

  proxy_ pass http://127.0.0.1 :8080/student;

  }

  location /item {

  proxy_ set_ header Host $http_ host;

  proxy_ set_ header X-Real-IP $remote_ addr;

  proxy_ set_ header REMOTE-HOST $remote_ addr;

  proxy_ set_ header X-Forwarded-For $proxy_ add_ x_ forwarded_ for;

  proxy_ pass http://127.0.0.1 :8080/item;

  }

  location /score {

  proxy_ set_ header Host $http_ host;

  proxy_ set_ header X-Real-IP $remote_ addr;

  proxy_ set_ header REMOTE-HOST $remote_ addr;

  proxy_ set_ header X-Forwarded-For $proxy_ add_ x_ forwarded_ for;

  proxy_ pass http://127.0.0.1 :8080/score;

  }

  location /code {

  proxy_ set_ header Host $http_ host;

  proxy_ set_ header X-Real-IP $remote_ addr;

  proxy_ set_ header REMOTE-HOST $remote_ addr;

  proxy_ set_ header X-Forwarded-For $proxy_ add_ x_ forwarded_ for;

  proxy_ pass http://127.0.0.1 :8080/code;

  }

}
```



Above, multiple routes need to be configured separately. We need to unify the beginning of a routing API. This requires modifying the access URL address of the lower back end

## development environment

### Java development environment

Open the bfitness directory using IntelliJ idea February 4, 2018 x64

Angular development environment

Vscode opens the ng2angle directory

Install dependency package: execute NPM install

Set the angular proxy profile proxy.conf.json:

{

"/api": {

"target": " http://localhost :8082",

"secure": false

},

"/student": {

"target": " http://localhost :8082",

"secure": false

},

"/item": {

"target": " http://localhost :8082",

"secure": false

},

"/score": {

"target": " http://localhost :8082",

"secure": false

},

"/code": {

"target": " http://localhost :8082",

"secure": false

},

"/img": {

"target": " http://localhost :8082",

"secure": false

}

}

Run command: NPM start or ng serve - proxy config proxy.conf.json

Compile package: NPM build or ng build --prod