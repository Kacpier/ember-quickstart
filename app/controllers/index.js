import Controller from '@ember/controller';
import { action } from '@ember/object';
import { service } from '@ember/service';
import { tracked } from '@glimmer/tracking';

export default class IndexController extends Controller {
  @service router;
  @service currentUser;

  @tracked fullName = '';
  @tracked email = '';
  @tracked errorMessage = '';

  get disableSubmit() {
    return this.fullName.trim().length === 0 || this.email.trim().length === 0;
  }

  @action
  updateName(event) {
    this.fullName = event.target.value;
    this.errorMessage = '';
  }

  @action
  updateEmail(event) {
    this.email = event.target.value;
    this.errorMessage = '';
  }

  @action
  handleKeyDown(event) {
    if (event.key === 'Enter') {
      this.submit(event);
    }
  }

  @action
  submit(event) {
    event?.preventDefault?.();
    event?.stopPropagation?.();

    if (this.disableSubmit) {
      this.errorMessage = 'Veuillez remplir tous les champs.';
    }

    this.currentUser.setUser({
      name: this.fullName,
      email: this.email,
    });

    this.errorMessage = '';
    this.router.transitionTo('dashboard');
  }
}
