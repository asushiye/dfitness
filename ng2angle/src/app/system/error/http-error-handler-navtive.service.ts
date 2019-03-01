import { Injectable } from '@angular/core';
import { HttpErrorResponse } from '@angular/common/http';
import { Observable, of } from 'rxjs';

import { LoggerService } from '../log/logger.service';

/** Type of the handleError function returned by HttpErrorHandler.createHandleError */
export type HandleError =
  <T> (operation?: string, result?: T) => (error: HttpErrorResponse) => Observable<T>;

/** Handles HttpClient errors */
@Injectable({
  providedIn: 'root'
})
export class HttpErrorHandler {
  constructor(private logger: LoggerService) {
    this.logger.title = 'HttpErrorHandler';
  }

  /** Create curried handleError function that already knows the service name */
  createHandleError = (serviceName = '') => <T> (operation = 'operation', result = {} as T) => this.handleError(serviceName, operation, result);

  /**
   * Returns a function that handles Http operation failures.
   * This error handler lets the app continue to run as if no error occurred.
   * @param serviceName = name of the data service that attempted the operation
   * @param operation - name of the operation that failed
   * @param result - optional value to return as the observable result
   */
  handleError<T>(serviceName = '', operation = 'operation', result = {} as T) {

    return (error: HttpErrorResponse): Observable<T> => {
      // TODO: send the error to remote logging infrastructure

      console.error(error); // log to console instead

      let message = '';

      if (error.error instanceof ErrorEvent) {
        // A client-side or network error occurred. Handle it accordingly.
        message = error.error.message;
      } else {
        // The backend returned an unsuccessful response code.
        // The response body may contain clues as to what went wrong,
        message = `server returned code ${error.status} with body "${error.error}"`;
      }

      // TODO: better job of transforming error for user consumption

      //this.logger.error(`${serviceName}: ${operation} failed: ${message}`);
      this.logger.error(`${serviceName}: ${operation} failed: ${JSON.stringify(error)}`, 'handleError');
      // Let the app keep running by returning a safe result.
      return of(result);
    };

  }
}
