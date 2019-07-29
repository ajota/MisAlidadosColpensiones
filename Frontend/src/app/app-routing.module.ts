import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ListarComponent } from './independientes/listar/listar.component';
import { AnotacionesRutas } from './shared/rutas.anotation';
import { RegistrarComponent } from './independientes/registrar/registrar.component';

const routes: Routes = [
  {path: '', redirectTo: AnotacionesRutas.independientes.uri, pathMatch: 'full'},
  {path: AnotacionesRutas.independientes.name, component: ListarComponent},
  {path: AnotacionesRutas.independientes.name + AnotacionesRutas.independientes.listar.uri , component: ListarComponent },
  {path: AnotacionesRutas.independientes.name + AnotacionesRutas.independientes.registrar.uri, component: RegistrarComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
