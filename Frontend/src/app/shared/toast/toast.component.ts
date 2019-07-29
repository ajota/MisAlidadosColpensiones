import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-toast',
  templateUrl: './toast.component.html',
  styleUrls: ['./toast.component.scss']
})
export class ToastComponent implements OnInit {

  @Input() mostrar = false;
  @Input() tipo = 'exito'; // [exito, error, advetencia]
  @Input() autoOcultar = true;
  @Input() mensaje = 'Operacion exitosa.';
  @Input() tiempoActivo = 5000; // Milisegundos

  toastTipo = this.defineTipo( this.tipo );

  constructor() { }

  ngOnInit() { }

  defineTipo( nombreTipo: string ): { [ key: string]: string } {
    let tipo  = {};
    switch ( nombreTipo ) {
      case 'exito':
        tipo = {'bg-success': true, 'text-light': true};
        break;
      case 'error':
        tipo = {'bg-danger': true, 'text-light': true };
        break;
      case 'advertencia':
        tipo = {'bg-warning': true};
        break;
    }
    return tipo;
  }
}
