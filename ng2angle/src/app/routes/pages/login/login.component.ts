import { Component, OnInit } from '@angular/core';
import { Router, NavigationExtras } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

import { SettingsService } from '../../../core/settings/settings.service';
import { AuthService } from '../../../system/auth/auth.service';
import { GlobalError } from '../../../system/result/result';
import { MenuService } from '../../../core/menu/menu.service';

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

    valForm: FormGroup;
    
    public globalError= new GlobalError();

    constructor(public settings: SettingsService,
        private authService: AuthService,
        private router: Router,
        private menuService: MenuService,
        fb: FormBuilder) {

        this.valForm = fb.group({
            'username': [null, Validators.required],
            'password': [null, Validators.required]
        });

    }

    submitForm($ev, value: any) {
        console.log("begin login");

        $ev.preventDefault();
        for (let c in this.valForm.controls) {
            this.valForm.controls[c].markAsTouched();
        }
        if (this.valForm.valid) {
            console.log('Valid!');
            console.log(value);
        }
        const username = this.valForm.get('username').value;
        const password = this.valForm.get('password').value;
   
        
        this.authService.isAuthenticate = true;
        this.menuService.loadMenuMock();
    }

    ngOnInit() {

    }

    // login() {

    //     this.authService.login().subscribe(() => {
    //         if (this.authService.isAuthenticate) {
    //             // Get the redirect URL from our auth service
    //             // If no redirect has been set, use the default
    //             let redirect = this.authService.redirectUrl ? this.authService.redirectUrl : '/home';

    //             // Set our navigation extras object
    //             // that passes on our global query params and fragment
    //             let navigationExtras: NavigationExtras = {
    //                 queryParamsHandling: 'preserve',
    //                 preserveFragment: true
    //             };

    //             // Redirect the user
    //             this.router.navigate([redirect], navigationExtras);
    //         }
    //     });
    // }

    logout() {
        this.authService.logout();
    }

}