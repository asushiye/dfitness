import { Injectable } from '@angular/core';
import { GlobalService } from '../../../system/utils/global.service';

/*
 * @Author: asushiye
 * @Date: 2019-02-15 16:58:52
 * @Commit: 
    checkScore: 验证成绩
    checkTime: 验证格式 - 成绩 12 | 12.22 |01:12 | 00:01:12 | 00:01:12.12| 格式
    checkChinese: 中文判断

    calcComment: 计算 - 按单位和评分指标计算成绩的评价
    calcNumber(score:string) 计算数值 - 若是时间则算出秒
    toNumber(value:any) 转换为number类型
    calcLow:评价 - 按成绩从小到大来判断优劣
    calcUpp:评价 - 按成绩从大到小来判断优劣
 */

@Injectable({
  providedIn: 'root'
})

export class FitnessService {

  public Units: String[] = ['次数', '分数', '秒', '秒-大', '秒-小', '评价', '成绩'];

  constructor(private globalService: GlobalService) { }


  //验证成绩   
  checkScore(score: string): any {
    const cstList: String[] = ['缺勤', '优秀', '良好', '及格', '不及格'];
    if (this.checkChinese(score)) {
      if (cstList.includes(score)) {
        return { status: true, error: '' };
      } else {
        return { status: false, error: '输入的中文只能包含[缺勤, 优秀, 良好, 及格, 不及格]' };
      }
    } else {
      return this.checkTime(score);
    }
  }

  //验证格式 - 成绩 12 | 12.22 |01:12 | 00:01:12 | 00:01:12.12| 格式
  checkTime(score: string): any {
    const cScore: string = this.globalService.ToCDB(score.toString());
    let rSorce: string = '';
    const colon = cScore.split(':').length - 1;
    if (colon > 2) {
      return { status: false, error: '冒号超过两个，不符合时间格式!' };
    } else if (colon == 2) {
      rSorce = cScore.replace(':', '').replace(':', '').replace('.', '');
    } else if (colon == 1) {
      rSorce = cScore.replace(':', '').replace('.', '');
    } else if (colon == 0) {
      rSorce = cScore.replace(':', '').replace('.', '');
    } else {
      return { status: false, error: '不能为空!' };
    }
    const nReg = /^[0-9]+$/;
    if (nReg.test(rSorce)) {
      return { status: true, error: '' };
    } else {
      return { status: false, error: '输入的字符只能是数字,冒号或小数点 !!' };
    }
  }


  //中文判断
  checkChinese(val: string): boolean {
    const reg = new RegExp("[\\u4E00-\\u9FFF]+$", "g");
    return reg.test(val)
  }


  //评价 - 按成绩从大到小来判断优劣 
  calcUpp(value: number, great: number, good: number, pass: number): string {
    if (value >= great) {
      return '优秀';
    } else if (value < great && value >= good) {
      return '良好';
    } else if (value < good && value >= pass) {
      return '及格';
    } else if (value < pass) {
      return '不及格';
    } else {
      return '数据异常';
    };
  };

  //评价 - 按成绩从小到大来判断优劣
  calcLow(value: number, great: number, good: number, pass: number): string {
    if (value <= great) {
      return '优秀';
    } else if (value > great && value <= good) {
      return '良好';
    } else if (value > good && value <= pass) {
      return '及格';
    } else if (value > pass) {
      return '不及格';
    } else {
      return '数据异常';
    };
  };

  //计算 - 按单位和评分指标计算成绩的评价
  calcComment(score: string, great: string, good: string, pass: string): string {
    const cList: string[] = ['缺勤', '优秀', '良好', '及格', '不及格'];
    let comment: string = '';
    if (cList.includes(score)) {
      comment = score;
    } else {
      const iValue = this.calcNumber(score);
      const iGreat = this.calcNumber(great);
      const iGood = this.calcNumber(good);
      const iPass = this.calcNumber(pass);

      console.log('ivalue=' + iValue + '; iGreat=' + iGreat + '; iGood=' + iGood + '; iPass=' + iPass)
      if (iGreat >= iPass) {
        comment = this.calcUpp(iValue, iGreat, iGood, iPass);
      } else if (iGreat < iPass) {
        comment = this.calcLow(iValue, iGreat, iGood, iPass);
      }
    }
    return comment;
  }

  //转换为number类型
  toNumber(value: any): number {
    if (value != '0' || value != '00') {
      return value * 1;
    } else {
      return 0;
    }
  }

  //计算数值 - 若是时间则算出秒
  calcNumber(score: string): number {
    const cScore: string = this.globalService.ToCDB(score.toString());
    let rSorce: string = '';

    let ivalue: number = 0;
    let scores: string[] = cScore.split(':');
    if (scores.length == 1) {
      ivalue = this.toNumber(scores[0]);
    } else if (scores.length == 2) {
      ivalue = this.toNumber(scores[1]) + this.toNumber(scores[0]) * 60;
    } else if (scores.length == 3) {
      ivalue = this.toNumber(scores[2]) + this.toNumber(scores[1]) * 60 + this.toNumber(scores[0]) * 3600;
    } else {
      ivalue = -1;
    }
    return ivalue;
  }

  //判断是否为 体质指数BMI 或体脂比PBF
  IsBMIOrPMF(value: string) {
    if (value.includes('体质指数')) {
      return true;
    };
    if (value.includes('BMI')) {
      return true;
    };
    if (value.includes('体脂比')) {
      return true;
    };
    if (value.includes('PBF')) {
      return true;
    };
    return false;
  };

    //验证BMIOrPMI成绩   
    checkBMIOrPMI(score: string): any {
      const cstList: String[] = ['缺勤', '优秀', '良好', '及格', '不及格'];
      if (this.checkChinese(score)) {
        if (cstList.includes(score)) {
          return { status: true, error: '' };
        } else {
          return { status: false, error: '输入的中文只能包含[缺勤, 优秀, 良好, 及格, 不及格]' };
        }
      } else {
        return this.checkBMI(score);
      }
    }

  //验证BMI - 成绩 12 | 01:12 
  checkBMI(score: string): any {
    const cScore: string = this.globalService.ToCDB(score.toString());
    let rSorce: string = '';
    const colon = cScore.split('/').length - 1;
    if (colon >= 2) {
      return { status: false, error: '斜杠超过两个或两个以上，不符合体重（kg）/ 身高（m）格式!' };
    } else if (colon == 1) {
      rSorce = cScore.replace('/', '').replace('.', '');
    } else if (colon == 0) {
      rSorce = cScore.replace('/', '').replace('.', '');
    } else {
      return { status: false, error: '不能为空!' };
    }
    const nReg = /^[0-9]+$/;
    if (nReg.test(rSorce)) {
      return { status: true, error: '' };
    } else {
      return { status: false, error: '输入的字符只能是数字, 斜杠 / !' };
    }
  }


  //计算数值 -若一个值，则直接去BMI，若两个值不符合体重（kg）: 身高（m）格式
  calcBMI(score: string): number {
    const cScore: string = this.globalService.ToCDB(score.toString());
    let ivalue: number = 0;
    let scores: string[] = cScore.split('/');
    if (scores.length == 1) {
      ivalue = this.toNumber(scores[0]);
    } else if (scores.length == 2) { 
      ivalue = Math.round(this.toNumber(scores[0]) / (this.toNumber(scores[1]) * this.toNumber(scores[1]))*100)/100;
    } else {
      ivalue = -1;
    }
    return ivalue;
  }

    //计算BMI - 按单位和评分指标计算成绩的评价
    calcBMIComment(score: string, great: string, pass: string): string {
      const cList: string[] = ['缺勤', '优秀', '良好', '及格', '不及格'];
      let comment: string = '';
      if (cList.includes(score)) {
        comment = score;
      } else {
        const iValue = this.calcBMI(score);
        const iGreat = <number><any>great;
        const iPass = <number><any>pass;
  
        console.log('ivalue=' + iValue + '; iGreat=' + iGreat + '; iPass=' + iPass)
        if (iGreat >= iPass) {
          if (iValue<= iGreat && iValue >= iPass){
            comment = '及格';
          }else{
            comment = '不及格';   
          }
        } else if (iGreat < iPass) {
          if (iValue >= iGreat && iValue <= iPass){
            comment = '及格';
          }else{
            comment = '不及格';   
          }
        }
      }
      return comment;
    }

}
