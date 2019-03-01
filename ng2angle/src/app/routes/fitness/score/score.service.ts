import { Injectable, OnInit } from '@angular/core'
import { HttpParams, HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError, map, retry, tap, delay } from 'rxjs/operators';
import { HttpErrorHandler} from '../../../system/error/http-error-handler.service';
import { LoggerService } from '../../../system/log/logger.service';
import { Result } from '../../../system/result/result';
import { ResponsePage, ResponsePageEx } from '../../../system/result/page';
import { Score } from './score';


const httpOptions = {
    headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Authorization': 'my-auth-token'
    })
};

@Injectable()
export class ScoreService implements OnInit {

    constructor(
        private http: HttpClient,
        private logger: LoggerService,
        private httpError: HttpErrorHandler) {
            this.logger.title = "ScoreService";
    }

    ngOnInit() {
    }

    getList(body: any): Observable<any> {
        const produceName = "getList";
        const url ='/score/list';

        this.logger.debugRequest(JSON.stringify(body),produceName);

        if (body.paged){
            return this.http.post<Result<ResponsePageEx<Score[]>>>(url, body, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );
        }else{
            return this.http.post<Result<Score[]>>(url, body, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );

        }
    }


    save(students: any): Observable<any> {
        const produceName = "save";
        const url ='/score/save';
    
        this.logger.debugRequest(JSON.stringify(students),produceName);

        return this.http.post<Result<boolean>>(url, students, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );
    }

    update(students: any): Observable<any> {
        const produceName = "update";
        const url ='/score/update';
    
        this.logger.debugRequest(JSON.stringify(students),produceName);

        return this.http.post<Result<boolean>>(url, students, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );
    }
    
    deleteByTitle(body: any): Observable<any> {
        const produceName = "deleteByTitle";
        const url ='/score/deleteByTitle';
    
        this.logger.debugRequest(JSON.stringify(body),produceName);

        return this.http.post<Result<string>>(url, body, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );
    }

    delete(body: any): Observable<any> {
        const produceName = "delete";
        const url ='/score/delete';
    
        this.logger.debugRequest(JSON.stringify(body),produceName);

        return this.http.post<Result<Number>>(url, body, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );
    }

}
