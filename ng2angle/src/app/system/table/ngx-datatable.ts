//设置ngxdatatable 显示的消息

export class NgxDataTableMessage {
    'emptyMessage':string;    //记录数为空时table body显示的消息
    'totalMessage':string;    //table footer 显示的记录数消息
    'selectedMessage':string;
    constructor(){
        this.emptyMessage = '没有数据显示';
        this.totalMessage = '总记录数';
        this.selectedMessage = '已选择记录数';
    }
}

export class Filter{
    name: string;
    filterString: string;
    placeholder : string;
    constructor(){
        this.name = '';
        this.filterString = '';
        this.placeholder = '';
    }
}

export class TableFilter{
    AllFilter: Filter;
    ColumnFilters: Array<Filter>;
    constructor(){
        this.AllFilter= new Filter();
        this.AllFilter.name = 'ALL';
        this.ColumnFilters = [];
    }

    add(colFilter:Filter){
        this.ColumnFilters.push(colFilter);
    }
}


