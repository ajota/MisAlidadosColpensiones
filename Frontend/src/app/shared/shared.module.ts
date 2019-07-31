import { NgModule } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';

import { NgbModule, NgbDateParserFormatter } from '@ng-bootstrap/ng-bootstrap';


import { ToastComponent } from './toast/toast.component';
import { SafeHtmlPipe } from './safe-html.pipe';
import { NgbDateCustomParserFormatter } from './datepicker-format.service';


@NgModule({
  declarations: [ToastComponent, SafeHtmlPipe],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    HttpClientModule,
    NgbModule
  ],
  exports: [
    NgbModule,
    ToastComponent,
    CommonModule,
    ReactiveFormsModule,
    HttpClientModule,
    SafeHtmlPipe
  ],
  providers: [ { provide: NgbDateParserFormatter, useClass: NgbDateCustomParserFormatter }, DatePipe ]
})
export class SharedModule { }
