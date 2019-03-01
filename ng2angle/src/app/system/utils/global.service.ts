import { Injectable } from '@angular/core';
import { DatePipe } from '@angular/common';
import * as XLSX from 'xlsx';

/*
 * @Author: asushiye
 * @Date: 2019-01-10 16:58:52
 * @Commit:
 * 1.string 处理函数 
 *    getValue: 取的字符串值，左右两边存在空格，则去除
      IsString: 验证字符串类型
      IsEmpty: 验证空 - null|undefined|''=true，其他=false 
      IsNotEmpty: 验证非空
  
 * 2.date 日期函数 
      getToday = yyyy-mm-dd
      getTodayTime = yyyy-mm-dd hh:mi:ss 
 *    downloadXlsx: 下载 - 公共方法
 *    deleteArray: 删除数组 -  按selected元素删除sources数组，数组元素结构一致
 
 * 3.全角和半角 
     ToDBC: 半角转换为全角
     ToCDB: 全角转换为半角
 */

@Injectable({
  providedIn: 'root'
})

export class GlobalService {
  datePipe: DatePipe;

  constructor() { }

  //取的字符串值，左右两边存在空格，则去除
  getValue(value:any):string{
    if (this.IsString(value)){
      return value.trim();
    }else{
      return value;
    };
  }

  //验证字符串类型
  IsString(value:any){
    return typeof(value)=='string';
  };

  //验证空 - null|undefined|''=true，其他=false
  IsEmpty(value:any){
    if (value==undefined&&value==null){
      return true;
    } else if (this.IsString(value)){
      return value.trim().length <= 0; 
    } else {
      return false;  
    }
  };

  //验证非空
  IsNotEmpty(value:any){
    return !this.IsEmpty;
  };


  getToday() {
    const date = new Date();
    const year: number = date.getFullYear();
    const month: any = (date.getMonth() + 1) < 10 ? '0' + (date.getMonth() + 1) : (date.getMonth() + 1);
    const day: any = date.getDate() < 10 ? '0' + date.getDate() : date.getDate();
    return year + '-' + month + '-' + day
  }

  getTodayTime() {
    const date = new Date();
    const year: number = date.getFullYear();
    const month: any = (date.getMonth() + 1) < 10 ? '0' + (date.getMonth() + 1) : (date.getMonth() + 1);
    const day: any = date.getDate() < 10 ? '0' + date.getDate() : date.getDate();
    const hour: any = date.getHours() < 10 ? '0' + date.getHours() : date.getHours();
    const minute: any = date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes();
    const second: any = date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds();
    return year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
  }

  getDate(date: any) {
    return this.datePipe.transform(date, "yyyy-MM-dd")
  }

  getDateTime(date: any) {
    return this.datePipe.transform(date, "yyyy-MM-dd hh:mm:ss")
  }

  //下载 - 公共方法
  downloadXlsx(jsonData: any, wb_name: string, ws_name: string) {

    /* generate worksheet */
    const ws: XLSX.WorkSheet = XLSX.utils.json_to_sheet(jsonData);

    /* generate workbook and add the worksheet */
    const wb: XLSX.WorkBook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, ws_name);

    console.log(wb)
    /* save to file */
    XLSX.writeFile(wb, wb_name);
  }

  //删除数组 -  按selected元素删除sources数组，数组元素结构一致
  deleteArray(sources: Array<any>, selected: Array<any>, clear: boolean = true) {
    selected.forEach((row) => {
      let i = sources.indexOf(row);
      if (i >= 0) {
        sources.splice(i, 1);
      }
    });
    if (clear) { selected = []; }
    return sources;
  }

    //删除数组 -  按selected元素删除sources数组，数组元素结构一致
    deleteElement(sources: Array<any>, element: any) {
      let i = sources.indexOf(element);
      if (i >= 0) {
        sources.splice(i, 1);
      };
      return sources;
    }

  //半角转换为全角
  ToDBC(str: String) {
    let tmp = "";
    for (let i = 0; i < str.length; i++) {
      if (str.charCodeAt(i) == 32) {
        tmp = tmp + String.fromCharCode(12288);
      }
      if (str.charCodeAt(i) < 127) {
        tmp = tmp + String.fromCharCode(str.charCodeAt(i) + 65248);
      } else {
        tmp = tmp + String.fromCharCode(str.charCodeAt(i))
      }
    }
    return tmp;
  }

  //全角转换为半角
  ToCDB(str: String) {
    let tmp = "";
    let strs: String= str;
    for (let i = 0; i < strs.length; i++) {
      if (strs.charCodeAt(i) == 12288) {
        tmp += String.fromCharCode(strs.charCodeAt(i) - 12256);
        continue;
      }
      if (strs.charCodeAt(i) > 65280 && strs.charCodeAt(i) < 65375) {
        tmp += String.fromCharCode(strs.charCodeAt(i) - 65248);
      }
      else {
        tmp += String.fromCharCode(strs.charCodeAt(i));
      }
    }
    return tmp
  }

}
