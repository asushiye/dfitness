import { Injectable, OnInit } from '@angular/core'
import { HttpParams, HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError, map, retry, tap, delay } from 'rxjs/operators';
import { HttpErrorHandler} from '../../../system/error/http-error-handler.service';
import { LoggerService } from '../../../system/log/logger.service';
import { Result } from '../../../system/result/result';
import { ResponsePage, ResponsePageEx } from '../../../system/result/page';
import { Student} from './student';


const httpOptions = {
    headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Authorization': 'my-auth-token'
    })
};

@Injectable()
export class StudentService implements OnInit {

    // private handleError: HandleError;

    constructor(
        private http: HttpClient,
        private logger: LoggerService,
        private httpError: HttpErrorHandler) {
            this.logger.title = "NgxtableService";
    }

    ngOnInit() {
    }

 
    getList(body: any): Observable<any> {
        const produceName = "getList";
        const url ='/student/list';


        this.logger.debugRequest(JSON.stringify(body),produceName);

        if (body.paged){
            return this.http.post<Result<ResponsePage<Student[]>>>(url, body, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );
        }else{
            return this.http.post<Result<Student[]>>(url, body, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );

        }
    }

    getListEx(body: any): Observable<any> {
        const produceName = "getListEx";
        const url ='/student/listEx';


        this.logger.debugRequest(JSON.stringify(body),produceName);

        if (body.paged){
            return this.http.post<Result<ResponsePageEx<Student[]>>>(url, body, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );
        }else{
            return this.http.post<Result<Student[]>>(url, body, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );

        }
    }

    getListDto(body: any): Observable<any> {
        const produceName = "getListDto";
        const url ='/student/listDto';


        this.logger.debugRequest(JSON.stringify(body),produceName);

        if (body.paged){
            return this.http.post<Result<ResponsePageEx<Student[]>>>(url, body, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );
        }else{
            return this.http.post<Result<Student[]>>(url, body, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );

        }
    }


    uploadJson(students: any): Observable<any> {
        const produceName = "uploadJson";
        const url ='/student/uploadJson';
    
        this.logger.debugRequest(JSON.stringify(students),produceName);

        return this.http.post<Result<String>>(url, students, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );
    }

    delete(body: any): Observable<any> {
        const produceName = "delete";
        const url ='/student/delete';
    
        this.logger.debugRequest(JSON.stringify(body),produceName);

        return this.http.post<Result<String>>(url, body, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );
    }

}
