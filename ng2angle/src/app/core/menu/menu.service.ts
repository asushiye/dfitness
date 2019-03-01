import { Injectable } from '@angular/core';
import { AuthMenu } from '../../system/auth/auth';
import { MenuItem } from './menu';
import { MenuMock } from './menu-mock'; 
import { MenuFitness } from './menu-fitness';

@Injectable()
export class MenuService {

    menuItems: Array<any>;

    constructor() {
        this.menuItems = [];
    }

    addMenu(items: Array<{
        text: string,
        heading?: boolean,
        link?: string,     // internal route links
        elink?: string,    // used only for external links
        target?: string,   // anchor target="_blank|_self|_parent|_top|framename"
        icon?: string,
        alert?: string,
        label?:string,
        permission?:string,
        id?:number,
        operations?: Array<any>,
        submenu?: Array<any>
    }>) {
        items.forEach((item) => {
            this.menuItems.push(item);
        });
    }

        
    /**
     * @description: 加载示例的菜单数据 
     */
    loadMenuMock(){
        this.addMenu(MenuMock);
    }
   /**
     * @description: 加载示例的菜单数据 
     */
    loadMenuFitness(){
        this.addMenu(MenuFitness);
    }

    /**
     * @description: 将后端的菜单数据转换为前端菜单 
     */
    convertMenus(loginMenus: AuthMenu, menus: MenuItem){
        menus.text= loginMenus.text;
        menus.heading= loginMenus.heading;
        menus.link= loginMenus.link;
        menus.elink=loginMenus.elink;
        menus.target= loginMenus.target;
        menus.icon= loginMenus.icon;
        menus.alert= loginMenus.alert;
        menus.label= loginMenus.label;
        menus.permission= loginMenus.permission;
        menus.id= loginMenus.id;
        menus.operations= loginMenus.operations;  
        
        if ((loginMenus.children != null) && (loginMenus.children.length >=1)) {
            const submenus: MenuItem[]=[];
            loginMenus.children.forEach((item)=>{
                const menuItem= new MenuItem();
                this.convertMenus(item, menuItem);
                submenus.push(menuItem);
            })
            menus.submenu = submenus;
        }
    }

    /**
     * @description: 按用户加载服务端菜单 
     */
    loadMenuServer(loginMenus: AuthMenu[]=[]) {
        loginMenus.forEach((item)=>{
            let menu= new MenuItem();
            
            this.convertMenus(item, menu)
            this.menuItems.push(menu);
        });
    }

    getMenu() {
        return this.menuItems;
    }

    clearMenu() {
        return this.menuItems = [];
    }
}
