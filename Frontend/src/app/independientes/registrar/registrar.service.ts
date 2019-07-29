import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { DatosIndependiente } from '../independientes.model';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({providedIn: 'root'})
export class RegistrarService {
  host = environment.apiBaseUrl;
  uriResources = environment.apiUris;

  constructor(private httpClient: HttpClient) { }

  guardarIndependientes( independiente: DatosIndependiente ): Observable<boolean> {
    const apiResource = this.host + this.uriResources.guardarIndependientes;
    return this.httpClient.post<boolean>(apiResource, independiente);
  }

}
