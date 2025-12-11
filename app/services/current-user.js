import Service from '@ember/service';
import { tracked } from '@glimmer/tracking';

export default class CurrentUserService extends Service {
  @tracked name = '';
  @tracked email = '';

  setUser({ name, email }) {
    let cleanedName = (name ?? '').trim();
    let cleanedEmail = (email ?? '').trim();

    this.name = cleanedName || 'Invité';
    this.email = cleanedEmail;
  }

  clear() {
    this.name = '';
    this.email = '';
  }
}
