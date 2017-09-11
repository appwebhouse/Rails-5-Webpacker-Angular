import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';
import { User } from '../../models/user';
import { UserService } from '../../services/user';
import { LocalStorageService } from 'angular-2-local-storage';
import { HttpClientService } from '../../services/update_header';

@Component({
  selector: 'page-login',
  template: require('./login.html'),
  providers: [UserService, HttpClientService]
})
export class LoginComponent {
  user = new User();
  loading = false;
  error = '';

  data = {
    email: '',
    password: '',
  };

  constructor(
    private router: Router,
    public userService: UserService,
    public httpClientService: HttpClientService,
    private localStorageService: LocalStorageService
  ) {}

  login() {
    this.loading = true;
    this.userService.login(this.data).map(res => res.json()).subscribe(
      data => {
        this.loading = false;
        this.user = data;
        this.localStorageService.set('user', JSON.stringify(this.user));
        this.httpClientService.addHeader('USER_TOKEN', this.user.auth_token);
        window.location.replace('/');
      },
      err => {
        this.error = JSON.parse(err._body);
        this.loading = false;
      }
    );
  };
}
