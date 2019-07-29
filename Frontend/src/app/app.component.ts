import { Component } from '@angular/core';
import { AnotacionesRutas } from './shared/rutas.anotation';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'Mis Aliados';
  rutaRegistrar = AnotacionesRutas.independientes.name + AnotacionesRutas.independientes.registrar.uri;
}
