import { LayoutComponent } from '../layout/layout.component';

import { LoginComponent } from './system/pages/login/login.component';
import { RegisterComponent } from './system/pages/register/register.component';
import { RecoverComponent } from './system/pages/recover/recover.component';
import { LockComponent } from './system/pages/lock/lock.component';
import { MaintenanceComponent } from './system/pages/maintenance/maintenance.component';
import { Error404Component } from './system/pages/error404/error404.component';
import { Error500Component } from './system/pages/error500/error500.component';
import { AuthGuard } from '../system/auth/auth.guard';


export const routes = [

    // Not lazy-loaded routes
    { path: '', redirectTo: '/login', pathMatch: 'full' },
    { path: 'login', component: LoginComponent },
    { path: 'register', component: RegisterComponent },
    { path: 'recover', component: RecoverComponent },
    { path: 'lock', component: LockComponent },
    { path: 'maintenance', component: MaintenanceComponent },
    { path: '500', component: Error500Component },
    {
        path: '',
        component: LayoutComponent,
        canActivate: [AuthGuard],
        children: [
            { path: '', redirectTo: 'home', pathMatch: 'full' },
            { path: 'home', loadChildren: './home/home.module#HomeModule' },
            { path: 'dashboard', loadChildren: './dashboard/dashboard.module#DashboardModule' },
            { path: 'widgets', loadChildren: './widgets/widgets.module#WidgetsModule' },
            { path: 'elements', loadChildren: './elements/elements.module#ElementsModule' },
            { path: 'forms', loadChildren: './forms/forms.module#FormsModule' },
            { path: 'charts', loadChildren: './charts/charts.module#ChartsModule' },
            { path: 'tables', loadChildren: './tables/tables.module#TablesModule' },
            { path: 'maps', loadChildren: './maps/maps.module#MapsModule' },
            { path: 'blog', loadChildren: './blog/blog.module#BlogModule' },
            { path: 'ecommerce', loadChildren: './ecommerce/ecommerce.module#EcommerceModule' },
            { path: 'extras', loadChildren: './extras/extras.module#ExtrasModule' },
            { path: 'security', loadChildren: './system/security/security.module#SecurityModule' },
            { path: 'demo', loadChildren: './demo/demo.module#DemoModule' },
            { path: 'fitness', loadChildren: './fitness/fitness.module#FitnessModule' }
        ]
    },

    // Not found
    { path: '**', redirectTo: '404' },
    { path: '404', component: Error404Component }

];
