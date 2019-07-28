import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { DatosIndependiente } from '../independientes.model';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';

@Injectable({providedIn: 'root'})
export class ListarService {
  host = environment.apiBaseUrl;
  uriResources = environment.apiUris;

  constructor(private httpClient: HttpClient) { }

  obtenerIndependientes() {
    const apiResource = this.host + this.uriResources.obtenerIndependientes;
    return this.httpClient.get<Observable<DatosIndependiente[]>>(apiResource);
  }

}
