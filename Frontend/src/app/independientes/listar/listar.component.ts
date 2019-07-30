import { Component, OnInit, ViewChild, OnDestroy } from '@angular/core';
import { AnotacionesRutas } from '../../shared/rutas.anotation';
import { DatosIndependiente } from '../independientes.model';
import { ListarService } from './listar.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Subscription, Subscriber, Observable } from 'rxjs';
import { MaestrosService } from 'src/app/shared/maestros.service';
import { Maestros } from 'src/app/shared/shared.model';

@Component({
  selector: 'app-listar',
  templateUrl: './listar.component.html',
  styleUrls: ['./listar.component.scss']
})
export class ListarComponent implements OnInit, OnDestroy {

  guardarEnModal = false;
  mostrarAviso = false;
  registrarRuta = AnotacionesRutas.independientes.uri + AnotacionesRutas.independientes.listar.uri;
  independientes: DatosIndependiente[];

  listaIndependientes$: Subscription = new Subscriber();
  aprobacion$: Subscription = new Subscriber();
  tiposDocumento$: Observable<Maestros[]>;
  sexos$: Observable<Maestros[]>;
  tiposTelefono$: Observable<Maestros[]>;

  constructor( private listarService: ListarService, private maestrosService: MaestrosService, private modalService: NgbModal ) { }

  ngOnInit() {
    this.listarIndependientes();
    this.listasMaestras();
  }

  agregarIndependiente( content ): void {
    this.modalService.open( content, {ariaLabelledBy: 'modal-basic-title'})
  }

  adicionarIndependienteATabla( event: Event, data: string): void {
    const nuevoIndependiente = JSON.parse(data);
    this.independientes.push(nuevoIndependiente);
  }

  listasMaestras() {
    this.tiposDocumento$ = this.maestrosService.obtenerMaestros( 'TipodDocumento' );
    this.sexos$ = this.maestrosService.obtenerMaestros( 'TiposTelefono' );
    this.tiposTelefono$ = this.maestrosService.obtenerMaestros( 'Sexos' );
  }

  listarIndependientes(): void {
    this.listaIndependientes$ = this.listarService.obtenerIndependientes().subscribe( resp => {
      this.independientes = resp;
    }, err => {
      throw console.error(err);
    });
  }

  gestionarSolicitud( idIndependiente: number, aprobar: boolean ) {
    this.aprobacion$ = this.listarService.guardarEstadoSolicitud(idIndependiente, aprobar).subscribe( resp => {
      if ( resp ) {
        this.mostrarAviso = true;
        this.actualizarLista( idIndependiente );
      }
    }, err => {
      throw console.error( err );
    });
  }

  actualizarLista( idIndependiente: number ) {
    const indexIndependiente = this.independientes.findIndex( item => item.IdIndependiente === idIndependiente );
    this.independientes[indexIndependiente].Aprobado = true;
  }

  ngOnDestroy() {
    this.listaIndependientes$.unsubscribe();
    this.aprobacion$.unsubscribe();
  }
}
