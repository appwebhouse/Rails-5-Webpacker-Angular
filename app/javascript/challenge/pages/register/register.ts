import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';
import { User } from '../../models/user';
import { UserService } from '../../services/user';

@Component({
  selector: 'page-register',
  template: require('./register.html'),
  providers: [UserService]
})
export class RegisterComponent {
  user = new User();
  loading = false;
  errors = '';

  data = {
    email: '',
    password: '',
  };

  constructor(
    public userService: UserService,
    private router: Router
  ) {}

  register() {
    this.loading = true;
    this.userService.register(this.data).map(res => res.json()).subscribe(
      data => {
        this.loading = false;
        this.user = data;
        this.router.navigate(['login']);
      },
      err => {
        this.errors = JSON.parse(err._body);
        this.loading = false;
      }
    );
  };
}
