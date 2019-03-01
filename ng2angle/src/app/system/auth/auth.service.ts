import { Injectable, OnInit } from '@angular/core'
import { HttpParams, HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError, map, retry, tap, delay } from 'rxjs/operators';
import { HttpErrorHandler } from '../error/http-error-handler.service';
import { LoggerService } from '../log/logger.service';
import { Result } from '../result/result';
import { AuthUser, AuthMenu} from './auth';

const httpOptions = {
    headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Authorization': 'my-auth-token'
    })
};

@Injectable({
    providedIn: 'root'
})
export class AuthService implements OnInit {

    public authUser: AuthUser;
    public authMenus: AuthMenu[];

    isAuthenticate: boolean;


    constructor(
        private http: HttpClient,
        private logger: LoggerService,
        private httpError: HttpErrorHandler) {
        this.logger.title = "AuthService";
        // this.handleError = httpErrorHandler.createHandleError('AuthService');
    }

    ngOnInit() {

    }
    // store the URL so we can redirect after logging in
    redirectUrl: string;

    // login(): Observable<boolean> {
    //     return of(true).pipe(
    //         delay(1000),
    //         tap(val => this.isAuthenticate = true)
    //     );
    // }

    logout(): void {
        this.isAuthenticate = false;
        this.redirectUrl = '';
    }

    // isAuthenticated(): Observable<boolean> {
    //     return this.http.get<boolean>('/api/authenticated')
    //         .pipe(
    //             catchError(this.handleError<boolean>('getHeroes', false))
    //         );
    // }

    login(i_username: string, i_password: string, i_rememberMe: string): Observable<Result<AuthUser>> {
        const procedureName = 'login';
        const url = '/api/login';
        const params = {
            username: i_username,
            password: i_password,
            rememberMe: i_rememberMe
        };

        let body = new HttpParams({ fromObject: params });

        this.logger.debugRequest(JSON.stringify(params), procedureName);
        let responseError= new Result<AuthUser>();
                   
        return this.http.post<Result<AuthUser>>(url, params, httpOptions)
            .pipe(
                retry(1),
                tap(data => {
                    this.logger.debugResponse(JSON.stringify(data), procedureName);
                }),
                catchError(this.httpError.handleError('AuthService',procedureName))
            );
    }
}
