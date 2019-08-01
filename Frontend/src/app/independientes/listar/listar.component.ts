import { Component, OnInit, OnDestroy } from '@angular/core';
import { AnotacionesRutas } from '../../shared/rutas.anotation';
import { DatosIndependiente } from '../independientes.model';
import { ListarService } from './listar.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Subscription, Subscriber } from 'rxjs';

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

  constructor( private listarService: ListarService, private modalService: NgbModal ) { }

  ngOnInit() {
    this.listarIndependientes();
  }

  agregarIndependiente( content ): void {
    this.modalService.open( content, {ariaLabelledBy: 'modal-basic-title'});
  }

  adicionarIndependienteATabla( data: string ): void {
    this.listarIndependientes();
    this.modalService.dismissAll();
  }

  listarIndependientes(): void {
    this.listaIndependientes$.unsubscribe();
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
        this.actualizarLista( idIndependiente, aprobar );
      }
    }, err => {
      throw console.error( err );
    });
  }

  actualizarLista( idIndependiente: number, estado: boolean ) {
    const indexIndependiente = this.independientes.findIndex( item => item.IdIndependientes === idIndependiente );
    this.independientes[indexIndependiente].Aprobado = estado;
  }

  ngOnDestroy() {
    this.listaIndependientes$.unsubscribe();
    this.aprobacion$.unsubscribe();
  }
}
