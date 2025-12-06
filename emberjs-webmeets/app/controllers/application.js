import Controller from '@ember/controller';
import { inject as service } from '@ember/service';

export default class ApplicationController extends Controller {
  @service router;

  // Mostrar sidebar y header solo cuando NO estamos en / (index)
  get showHeader() {
    return this.router.currentRouteName !== 'index';
  }
}
