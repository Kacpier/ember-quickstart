import Component from '@glimmer/component';
import { action } from '@ember/object';
import { service } from '@ember/service';
import { tracked } from '@glimmer/tracking';
import { on } from '@ember/modifier';
import { setComponentTemplate } from '@ember/component';
import { hbs } from 'ember-cli-htmlbars';

class LoginScreen extends Component {
  @service router;
  @service currentUser;

  @tracked fullName = '';
  @tracked email = '';
  @tracked errorMessage = '';

  get disableSubmit() {
    return this.fullName.trim().length === 0 || this.email.trim().length === 0;
  }

  @action updateName(event) {
    this.fullName = event.target.value;
    this.errorMessage = '';
  }

  @action updateEmail(event) {
    this.email = event.target.value;
    this.errorMessage = '';
  }

  @action handleKeyDown(event) {
    if (event.key === 'Enter') {
      this.submit(event);
    }
  }

  @action submit(event) {
    event?.preventDefault?.();
    event?.stopPropagation?.();

    if (this.disableSubmit) {
      this.errorMessage = 'Ingresa tu nombre y email para continuar.';
      return;
    }

    this.currentUser.setUser({
      name: this.fullName,
      email: this.email,
    });

    this.errorMessage = '';
    this.router.transitionTo('dashboard');
  }
}

export default setComponentTemplate(
  hbs`
    <div class="landing">
      <div class="login-card">
        <div class="login-icon">
           <img src="/logo.svg" alt="Logo WebMeets" class="sidebar-logo-img" />
        </div>

        <h1 class="app-title">WebMeets</h1>
        <p class="app-subtitle">
          Votre réseau professionnel intelligent
        </p>

        <form class="login-form" novalidate {{on "submit" this.submit}}>
          <label for="fullName">Nom complet</label>
          <input
            id="fullName"
            type="text"
            placeholder="Entrez votre nom"
            value={{this.fullName}}
            {{on "input" this.updateName}}
            {{on "keydown" this.handleKeyDown}}
            required
          />

          <label for="email">Email professionnel</label>
          <input
            id="email"
            type="email"
            placeholder="vous@example.com"
            value={{this.email}}
            {{on "input" this.updateEmail}}
            {{on "keydown" this.handleKeyDown}}
            required
          />

          <button
            type="submit"
            class="primary-button"
            disabled={{this.disableSubmit}}
          >
            Se connecter
          </button>

          {{#if this.errorMessage}}
            <p class="form-error">{{this.errorMessage}}</p>
          {{/if}}

          <p class="demo-note">
            Demo – Entrez n'importe quel nom et email
          </p>
        </form>
      </div>
    </div>
  `,
  LoginScreen
);
