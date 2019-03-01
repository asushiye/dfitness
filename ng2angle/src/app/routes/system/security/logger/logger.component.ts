import { Component, OnInit } from '@angular/core';
import { LoggerService } from '../../../../system/log/logger.service';

@Component({
  selector: 'app-logger',
  templateUrl: './logger.component.html',
  styleUrls: ['./logger.component.css']
})
export class LoggerComponent implements OnInit {

  constructor(public Logger: LoggerService) { }

  ngOnInit() {
  }

}
