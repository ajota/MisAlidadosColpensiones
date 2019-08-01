import { TestBed } from '@angular/core/testing';

import { DatepickerFormatService } from './datepicker-format.service';

describe('DatepickerFormatService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: DatepickerFormatService = TestBed.get(DatepickerFormatService);
    expect(service).toBeTruthy();
  });
});
