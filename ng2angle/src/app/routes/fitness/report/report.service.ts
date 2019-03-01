import { Injectable, OnInit } from '@angular/core'
import { HttpParams, HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError, map, retry, tap, delay } from 'rxjs/operators';
import { HttpErrorHandler} from '../../../system/error/http-error-handler.service';
import { LoggerService } from '../../../system/log/logger.service';
import { Result } from '../../../system/result/result';
import { StatisticsStudent } from './report';

const httpOptions = {
    headers: new HttpHeaders({
        'Content-Type': 'application/json',
        'Authorization': 'my-auth-token'
    })
};

@Injectable()
export class ReportService implements OnInit {

    constructor(
        private http: HttpClient,
        private logger: LoggerService,
        private httpError: HttpErrorHandler) {
            this.logger.title = "ReportService";
    }

    ngOnInit() {
    }

    getStatisticsStudent(body: any): Observable<any> {
        const produceName = "getStatisticsStudent";
        const url ='/score/StatisticsStudent';

        this.logger.debugRequest(JSON.stringify(body),produceName);

        return this.http.post<Result<StatisticsStudent[]>>(url, body, httpOptions)
        .pipe(
            retry(1),
            tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
            catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
        );
        
    }

    getStatisticsItem(body: any): Observable<any> {
        const produceName = "getStatisticsItem";
        const url ='/score/StatisticsItem';

        this.logger.debugRequest(JSON.stringify(body),produceName);

        return this.http.post<Result<StatisticsStudent[]>>(url, body, httpOptions)
        .pipe(
            retry(1),
            tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
            catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
        );        
    }

    getStatisticsItemCol(body: any): Observable<any> {
        const produceName = "getStatisticsItemCol";
        const url ='/score/StatisticsItemCol';

        this.logger.debugRequest(JSON.stringify(body),produceName);

        return this.http.post<Result<StatisticsStudent[]>>(url, body, httpOptions)
        .pipe(
            retry(1),
            tap(data => this.logger.debugResponse(JSON.stringify(data), produceName)),
            catchError(this.httpError.handleError(this.logger.title+'.'+produceName))
        );
        
    }


}
