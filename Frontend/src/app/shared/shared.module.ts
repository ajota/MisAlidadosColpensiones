import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';

import { NgbModule } from '@ng-bootstrap/ng-bootstrap';


import { ToastComponent } from './toast/toast.component';
import { SafeHtmlPipe } from './safe-html.pipe';


@NgModule({
  declarations: [ToastComponent, SafeHtmlPipe],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    HttpClientModule,
    NgbModule
  ],
  exports: [
    ToastComponent,
    CommonModule,
    ReactiveFormsModule,
    HttpClientModule,
    SafeHtmlPipe
  ]
})
export class SharedModule { }
