import { Pipe, PipeTransform } from '@angular/core';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';

@Pipe({
  name: 'safeHtml'
})
export class SafeHtmlPipe implements PipeTransform {

  constructor(private sanitizer: DomSanitizer){}

  transform( valor: string ): SafeHtml {

    return this.sanitizer.bypassSecurityTrustHtml(valor);
  }

}
