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
  
  obtenerIndependientes(): Observable<DatosIndependiente[]> {
    const apiResource = this.host + this.uriResources.obtenerIndependientes;
    return this.httpClient.get<DatosIndependiente[]>(apiResource);
  }

  guardarEstadoSolicitud( id: number, estado: boolean ) {
    const apiResource = this.host + this.uriResources.gestionarSolicitud;
    const peticion =  {idIndependiente: id, aprobacion: estado};

    return this.httpClient.post<boolean>(apiResource, peticion);
  }

}
