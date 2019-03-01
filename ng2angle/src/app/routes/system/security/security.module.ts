import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { SharedModule } from '../../../shared/shared.module';
import { LoggerComponent } from './logger/logger.component';
import { UserService } from './user/user.service';
import { Ng2TableModule } from 'ng2-table/ng2-table';
import { AgGridModule } from 'ag-grid-angular/main';
import { NgxDatatableModule } from '@swimlane/ngx-datatable';

import { UserComponent } from './user/user.component';
import { RoleComponent } from './role/role.component';
import { PermissionComponent } from './permission/permission.component';
import { DemoComponent } from './demo/demo.component';


const routes: Routes = [
  { path: 'user', component: UserComponent },
  { path: 'role', component: RoleComponent },
  { path: 'permission', component: PermissionComponent },
  { path: 'demo', component: DemoComponent },
  { path: 'logger', component: LoggerComponent } 
]


@NgModule({
  imports: [
    Ng2TableModule,
    AgGridModule,
    NgxDatatableModule,
    SharedModule,
    RouterModule.forChild(routes)
  ],
  declarations: [
    UserComponent,
    RoleComponent,
    PermissionComponent,
    DemoComponent,
    LoggerComponent
  ],
  exports: [
    RouterModule
  ],
  providers:[UserService]
})
export class SecurityModule { }
