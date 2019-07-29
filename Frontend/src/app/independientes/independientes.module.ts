import { NgModule } from '@angular/core';

import { RegistrarComponent } from './registrar/registrar.component';
import { ListarComponent } from './listar/listar.component';
import { SharedModule } from '../shared/shared.module';



@NgModule({
  declarations: [RegistrarComponent, ListarComponent],
  imports: [
    SharedModule
  ],
  exports: [ RegistrarComponent ]
})
export class IndependientesModule { }
