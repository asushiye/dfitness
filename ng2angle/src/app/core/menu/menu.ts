/*
 * @Author: asushiye
 * @Date: 2019-01-10 17:37:37
 * @Commit: MenuItem 
 */
export class MenuItem {
    text: string;        // menu display
    heading?: boolean;   //
    link?: string;       // internal route links
    elink?: string;      // used only for external links
    target?: string;     // anchor target="_blank|_self|_parent|_top|framename"
    icon?: string;
    alert?: string;
    label?: string;
    permission?: string;
    id?: number;
    operations?: Array<any>;
    submenu?: Array<MenuItem>;
} 
