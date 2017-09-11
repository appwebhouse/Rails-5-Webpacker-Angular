import { Injectable } from '@angular/core';
import { HttpService } from './httpService';

@Injectable()
export class UserService {
  constructor(private http: HttpService) {}

  login(params) {
    return this.http.post('api/users/sessions', { user: params });
  }

  register(params) {
    return this.http.post('api/users/registrations', { user: params });
  }

  getImages(id) {
    return this.http.get('api/users/' + id + '/images');
  }

  addImage(id, file) {
    let formData = new FormData();
    formData.append('image[file]', file);
    return this.http.post('api/users/' + id + '/images', formData);
  }
}
