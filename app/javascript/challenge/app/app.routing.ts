import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AppComponent } from './app.component';
import { LoginComponent } from '../pages/login/login';
import { RegisterComponent } from '../pages/register/register';
import { ImagesIndexComponent } from '../pages/images/index';

const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'images', component: ImagesIndexComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule { }

export const routingComponents = [
  LoginComponent,
  RegisterComponent,
  ImagesIndexComponent
];