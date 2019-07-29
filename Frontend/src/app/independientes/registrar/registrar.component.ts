import { Component, OnInit, Output, Input, OnDestroy } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { DatosIndependiente } from '../independientes.model';
import { RegistrarService } from './registrar.service';
import { EventEmitter } from 'events';
import { stringify } from 'querystring';
import { Subscription, Subscriber } from 'rxjs';

@Component({
  selector: 'app-registrar',
  templateUrl: './registrar.component.html',
  styleUrls: ['./registrar.component.scss']
})

export class RegistrarComponent implements OnInit, OnDestroy {

  @Input() enModal = false;

  @Output() alAdicionarIndepeniente = new EventEmitter();

  independiente = new DatosIndependiente();
  registrar$: Subscription = new Subscriber();

  independientesForm = this.formBuilder.group({
    TipoDocumento:                [ 0, Validators.required],
    NumeroDocumento:              ['', Validators.required],
    Nombres:                      ['', Validators.required],
    Apellidos:                    ['', Validators.required],
    FechaNacimiento:              ['', Validators.required],
    Oficio:                       ['', Validators.required],
    IngresosMensualesAproximados: ['', Validators.required],
    TipoTelefono:                 [ 0, Validators.required],
    Telefono:                     ['', Validators.required],
    Correo:                       ['', Validators.required],
    Sexo:                         [ 0, Validators.required]
  });

  mostrarAviso: boolean;


  constructor( private formBuilder: FormBuilder, private registrarService: RegistrarService ) {
  }

  ngOnInit() {
  }

  alGuardarIndependiente(): void {
    this.independiente = this.independientesForm.value;
    this.registrar$ = this.registrarService.guardarIndependientes(this.independiente).subscribe( resp => {

      if ( resp && this.notificarAdicionIndependiente() ) {
        this.mostrarAviso = true;
        this.independientesForm.reset();
      }

    }, err => {
      throw console.error(err);
    });
  }


  notificarAdicionIndependiente(): boolean {
    return this.alAdicionarIndepeniente.emit(stringify(this.independiente));
  }

  ngOnDestroy() {
    this.registrar$.unsubscribe();
  }

}
