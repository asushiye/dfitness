export class Result<T> {
    status: boolean;
    code: number;
    msg:string;
    data: T;
}

export class GlobalError {
    status:boolean;
    code:number;
    message: string;
}