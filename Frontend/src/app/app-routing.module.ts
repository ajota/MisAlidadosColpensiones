import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ListarComponent } from './independientes/listar/listar.component';
import { AnotacionesRutas } from './shared/rutas.anotation';

const routes: Routes = [
  {path: '', redirectTo: AnotacionesRutas.independientes.uri , pathMatch: 'full'},
  {path: AnotacionesRutas.independientes.name, component: ListarComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
