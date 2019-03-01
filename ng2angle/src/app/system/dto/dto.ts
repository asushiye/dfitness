export class BodyDto<T>{
    body?: T;
}

export class BodyPageDto<T,K> extends BodyDto<T>{
    page?: K;
}

export class ParamBodyPageDto<J, T, K> extends BodyPageDto<T, K>{
    param?: J;
}

