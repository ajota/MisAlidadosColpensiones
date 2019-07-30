import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Maestros } from './shared.model';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MaestrosService {
  host = environment.apiBaseUrl;
  uriResources = environment.apiUris;

  constructor( private httpClient: HttpClient ) { }

  obtenerMaestros( nombreMaestro: string ): Observable<Maestros[]> {
    const apiResource = this.host + this.uriResources[ 'obtenerMaestro' + nombreMaestro];
    return this.httpClient.get<Maestros[]>(apiResource);
  }
}
