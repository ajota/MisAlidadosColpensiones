import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RegistrarComponent } from './registrar/registrar.component';
import { ListarComponent } from './listar/listar.component';



@NgModule({
  declarations: [RegistrarComponent, ListarComponent],
  imports: [
    CommonModule
  ]
})
export class IndependientesModule { }
