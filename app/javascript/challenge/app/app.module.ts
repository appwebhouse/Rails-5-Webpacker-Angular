import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HttpModule, XHRBackend, RequestOptions } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { LocalStorageModule } from 'angular-2-local-storage';
import { AppComponent } from './app.component';
import { AppRoutingModule, routingComponents } from './app.routing';
import { HttpService } from '../services/httpService';

export function httpFactory(backend: XHRBackend, defaultOptions: RequestOptions) {
  return new HttpService(backend, defaultOptions);
}

@NgModule({
  declarations: [
    AppComponent,
    routingComponents
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    AppRoutingModule,
    LocalStorageModule.withConfig({
      prefix: 'challenge',
      storageType: 'localStorage'
    })
  ],
  providers: [
    { provide: HttpService, useFactory: httpFactory, deps: [XHRBackend, RequestOptions] }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
