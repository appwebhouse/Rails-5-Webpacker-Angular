import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { LocalStorageService } from 'angular-2-local-storage';
import { UserService } from '../services/user';
import { HttpClientService } from '../services/update_header';
import { User } from '../models/user';

@Component({
  selector: 'challenge-app',
  template: require('./app.html'),
  providers: [UserService, HttpClientService]
})
export class AppComponent {
  user = new User();
  constructor(
    private router: Router,
    public userService: UserService,
    public httpClientService: HttpClientService,
    private localStorageService: LocalStorageService
  ) {
    this.user = JSON.parse(this.localStorageService.get('user'));
    if(!this.user) {
      this.router.navigate(['login']);
    } else {
      this.httpClientService.addHeader('USER_TOKEN', this.user.auth_token);
      this.router.navigate(['images']);
    }
  }

  logout() {
    this.localStorageService.remove('user');
    window.location.replace('/');
  }
}
