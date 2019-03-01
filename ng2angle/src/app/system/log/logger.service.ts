import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class LoggerService {

  private _title:String;

  contexts: string[] = [];
  
  constructor() { 
  }

  set title(value:String){
    this._title= value;
  }
  get title():String{
    return this._title;
  }

  clear(){
    this.contexts= [];
  }

  baseInfo(method: string=''): string {
    //  return this.datePipe.transform((Date.now()), 'yyyy-MM-dd HH:mm:ss');
    return this.title+'.'+method+'; '+(new Date).toLocaleString();
  }

  error(info: string, method:string='') {
    this.contexts.push(this.baseInfo(method) + '; error; ' + info);
  }

  debug(info: string, method:string='') {
    this.contexts.push(this.baseInfo(method) + '; debug; ' + info);
  }

  debugRequest(info: string, method:string='') {
    this.debug("request params="+info, method);
  }

  debugResponse(info: string, method:string='') {
    this.debug("response body="+info, method);
  }

  info(info: string, method:string='') {
    this.contexts.push(this.baseInfo(method) + '; info; ' + info);
  }

  trace(info: string, method:string='') {
    this.contexts.push(this.baseInfo(method) + '; trace; ' + info);
  }
}
