import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Ng2TableModule } from 'ng2-table/ng2-table';
import { AgGridModule } from 'ag-grid-angular/main';
import { NgxDatatableModule } from '@swimlane/ngx-datatable';
import { SharedModule } from '../../shared/shared.module';
import { StudentComponent } from './student/student.component';
import { FilterService } from '../../system/table/filter.service';
import { StudentService } from './student/student.service';
import { ItemComponent } from './item/item.component';
import { ScoreComponent } from './score/score.component';
import { ItemService } from './item/item.service';
import { AssessComponent } from './assess/assess.component';
import { ScoreService } from './score/score.service';
import { FitnessService } from './common/fitness.service';
import { TypeCodeService } from './common/typecode.service';
import { ReportComponent } from './report/report.component';
import { ReportService } from './report/report.service';



const routes: Routes = [
  { path: 'student', component: StudentComponent },
  { path: 'item', component: ItemComponent },
  { path: 'assess', component: AssessComponent },
  { path: 'score', component: ScoreComponent },
  { path: 'report', component: ReportComponent },
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
    ItemComponent,
    ScoreComponent,
    AssessComponent,
    ReportComponent
  ],
  exports: [
    RouterModule
  ],
  providers:[StudentService, ItemService, ScoreService, 
    FitnessService, FilterService,TypeCodeService,ReportService]
})
export class FitnessModule { }
