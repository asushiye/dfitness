import { Injectable } from '@angular/core'
import { HttpParams, HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError, map, retry, tap,delay } from 'rxjs/operators';
import { HttpErrorHandler, HandleError } from '../../../../system/error/http-error-handler-navtive.service';
import { LoggerService } from '../../../../system/log/logger.service';
import { Result } from '../../../../system/result/result';

const httpOptions = {
    headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Authorization': 'my-auth-token'
    })
};

@Injectable()
export class UserService {    

    private handleError: HandleError;

    constructor(
        private http: HttpClient,
        private logger: LoggerService,
        httpErrorHandler: HttpErrorHandler) {
        this.handleError = httpErrorHandler.createHandleError('UserService');
    }


    getList(i_offset: number, i_limit: number, i_search: string): Observable<any> {
        const params = {
            offset: i_offset,
            limit: i_limit,
            search: i_search
        };

        this.logger.debug('get User List params ' + JSON.stringify(params));

        return this.http.post('/api/user/list', params, httpOptions)
            .pipe(
                retry(1),
                tap(data => this.logger.debug('get User List success: ' + JSON.stringify(data))),
                catchError(this.handleError('get User List'))
            );
    }
}
