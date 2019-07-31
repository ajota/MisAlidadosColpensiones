import { Component, OnInit, Output, Input, OnDestroy, EventEmitter } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { DatosIndependiente } from '../independientes.model';
import { RegistrarService } from './registrar.service';
import { Subscription, Subscriber, Observable } from 'rxjs';
import { Maestros } from 'src/app/shared/shared.model';
import { MaestrosService } from 'src/app/shared/maestros.service';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-registrar',
  templateUrl: './registrar.component.html',
  styleUrls: ['./registrar.component.scss']
})

export class RegistrarComponent implements OnInit, OnDestroy {

  @Input() enModal = false;
  @Output() alAdicionarIndependiente = new EventEmitter();

  independiente = new DatosIndependiente();
  registrar$: Subscription = new Subscriber();

  independientesForm = this.formBuilder.group({
    TipoDocumento:                ['', Validators.required],
    NumeroDocumento:              ['', Validators.required],
    Nombres:                      ['', Validators.required],
    Apellidos:                    ['', Validators.required],
    FechaNacimiento:              [null, Validators.required],
    Oficio:                       ['', Validators.required],
    IngresosMensualesAproximados: ['', Validators.required],
    TipoTelefono:                 ['', Validators.required],
    Telefono:                     ['', Validators.required],
    Correo:                       ['', Validators.required],
    Sexo:                         ['', Validators.required]
  });

  mostrarAviso: boolean;

  tiposDocumento$: Observable<Maestros[]>;
  sexos$: Observable<Maestros[]>;
  tiposTelefono$: Observable<Maestros[]>;

  constructor(
    private formBuilder: FormBuilder,
    private registrarService: RegistrarService,
    private maestrosService: MaestrosService,
    private date: DatePipe
  ) {}

  ngOnInit() {
    this.listasMaestras();
  }

  listasMaestras() {
    this.tiposDocumento$ = this.maestrosService.obtenerMaestros( 'TiposDocumento' );
    this.sexos$ = this.maestrosService.obtenerMaestros( 'Sexos' );
    this.tiposTelefono$ = this.maestrosService.obtenerMaestros( 'TiposTelefono' );
  }

  alGuardarIndependiente(): void {
    this.independiente = this.independientesForm.value;
    const fechaNac = this.independiente.FechaNacimiento;
    const fechaFormato = new Date(fechaNac.year, fechaNac.month, fechaNac.day ).toDateString();
    this.independiente.FechaNacimiento = this.date.transform( Date.parse( fechaFormato ), 'yyyy-MM-dd');

    this.registrar$ = this.registrarService.guardarIndependientes( this.independiente ).subscribe( resp => {
      if ( resp ) {
        this.notificarAdicionIndependiente();
        this.mostrarAviso = true;
        this.independientesForm.reset();
      }

    }, err => {
      throw console.error(err);
    });
  }


  notificarAdicionIndependiente() {
     this.alAdicionarIndependiente.emit( JSON.stringify( this.independiente ) );
  }

  ngOnDestroy() {
    this.registrar$.unsubscribe();
  }

}
