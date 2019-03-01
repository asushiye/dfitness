import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Ng2TableModule } from 'ng2-table/ng2-table';
import { AgGridModule } from 'ag-grid-angular/main';
import { NgxDatatableModule } from '@swimlane/ngx-datatable';
import { SharedModule } from '../../shared/shared.module';
import { StudentComponent } from './ng2table/student.component';
import { StudentService } from './ng2table/student.service';
import { Ng2TableService } from '../../system/table/ng2Table.service';
import { NgxtableComponent } from './ngxtable/ngxtable.component';
import { NgxtableService } from './ngxtable/ngxtable.service';
import { FilterService } from '../../system/table/filter.service';


const routes: Routes = [
  { path: 'ng2table', component: StudentComponent },
  { path: 'ngxtable', component: NgxtableComponent }
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
    StudentComponent,
    NgxtableComponent
  ],
  exports: [
    RouterModule
  ],
  providers:[StudentService, Ng2TableService, NgxtableService,FilterService]
})
export class DemoModule { }
