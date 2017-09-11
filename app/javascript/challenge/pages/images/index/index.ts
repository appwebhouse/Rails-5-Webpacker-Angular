import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';
import { Image } from '../../../models/image';
import { User } from '../../../models/user';
import { UserService } from '../../../services/user';
import { LocalStorageService } from 'angular-2-local-storage';

@Component({
  selector: 'page-images-index',
  template: require('./index.html'),
  providers: [UserService]
})
export class ImagesIndexComponent {
  images: Image[] = [];
  image = new Image();
  user = new User();
  loading = false;
  error = '';
  file: File;

  constructor(
    private localStorageService: LocalStorageService,
    public userService: UserService,
    private router: Router
  ) {
    this.user = JSON.parse(this.localStorageService.get('user'));
    this.initializeImages();
  }

  initializeImages() {
    this.loading = true;
    this.userService.getImages(this.user.id).subscribe(
      data => {
        this.images = JSON.parse(data._body);
        this.loading = false;
      },
      err => {
        console.log(JSON.parse(err._body));
        this.loading = false;
      }
    );
  }

  onChange(event: EventTarget) {
    let eventObj: MSInputMethodContext = <MSInputMethodContext> event;
    let target: HTMLInputElement = <HTMLInputElement> eventObj.target;
    let files: FileList = target.files;
    this.file = files[0];
  }

  uploadImage() {
    this.loading = true;
    this.userService.addImage(this.user.id, this.file).map(res => res.json()).subscribe(
      data => {
        this.images.push(data);
        this.loading = false;
      },
      err => {
        this.error = JSON.parse(err._body);
        this.loading = false;
      }
    );
  };
}
