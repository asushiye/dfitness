import { Injectable, OnInit } from '@angular/core'
import { HttpParams, HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError, map, retry, tap, delay } from 'rxjs/operators';
import { HttpErrorHandler} from '../../../system/error/http-error-handler.service';
import { LoggerService } from '../../../system/log/logger.service';
import { Result } from '../../../system/result/result';


const httpOptions = {
    headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Authorization': 'my-auth-token'
    })
};

export const cst_score_category = 'score_category';
export const cst_score_title = 'score_title';


@Injectable()
export class TypeCodeService implements OnInit {

     

    constructor(
        private http: HttpClient,
        private logger: LoggerService,
        private httpError: HttpErrorHandler) {
            this.logger.title = "TypeCodeService";
    }

    ngOnInit() {
    }


    getCodes(body: any): Observable<any> {
        const produceName = "getCodes";
        const url ='/code/names';

        this.logger.debugRequest(JSON.stringify(body),produceName);

        return this.http.post<Result<string>>(url, body, httpOptions)
        .pipe(
            retry(1),
            tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
            catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
        );
    }


    save(body: any): Observable<any> {
        const produceName = "save";
        const url ='/code/save';
    
        this.logger.debugRequest(JSON.stringify(body),produceName);
        return this.http.post<Result<String>>(url, body, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );
    }

    deleteById(body: any): Observable<any> {
        const produceName = "deleteById";
        const url ='/code/deleteById';
    
        this.logger.debugRequest(JSON.stringify(body),produceName);

        return this.http.post<Result<string>>(url, body, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );
    }

    existById(body: any): Observable<any> {
        const produceName = "existById";
        const url ='/code/existById';
    
        this.logger.debugRequest(JSON.stringify(body),produceName);

        return this.http.post<Result<boolean>>(url, body, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
                catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
            );
    }


}
