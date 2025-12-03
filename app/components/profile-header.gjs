import Component from '@glimmer/component';
import { concat } from '@ember/helper';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';
import { on } from '@ember/modifier';

export default class ProfileHeader extends Component {
  @tracked isEditing = false;
  @tracked name = this.args.name ?? '';
  @tracked role = this.args.role ?? '';
  @tracked status = this.args.status ?? '';
  @tracked location = this.args.location ?? '';
  @tracked connections = this.args.connections ?? '';
  @tracked about = this.args.about ?? '';
  @tracked experienceTitle = this.args.experienceTitle ?? '';
  @tracked experienceCompany = this.args.experienceCompany ?? '';
  @tracked experiencePeriod = this.args.experiencePeriod ?? '';
  @tracked experienceDetails = this.args.experienceDetails ?? '';
  @tracked email = this.args.email ?? '';
  @tracked phone = this.args.phone ?? '';
  @tracked website = this.args.website ?? '';
  @tracked linkedin = this.args.linkedin ?? '';
  @tracked skillsString = this.args.skillsString ?? '';

  @action startEditing() {
    this.isEditing = true;
  }

  @action cancelEditing() {
    this.isEditing = false;
    this.name = this.args.name ?? '';
    this.role = this.args.role ?? '';
    this.status = this.args.status ?? '';
    this.location = this.args.location ?? '';
    this.connections = this.args.connections ?? '';
    this.about = this.args.about ?? '';
    this.experienceTitle = this.args.experienceTitle ?? '';
    this.experienceCompany = this.args.experienceCompany ?? '';
    this.experiencePeriod = this.args.experiencePeriod ?? '';
    this.experienceDetails = this.args.experienceDetails ?? '';
    this.email = this.args.email ?? '';
    this.phone = this.args.phone ?? '';
    this.website = this.args.website ?? '';
    this.linkedin = this.args.linkedin ?? '';
    this.skillsString = this.args.skillsString ?? '';
  }

  @action saveEditing(event) {
    event?.preventDefault();
    this.args.onSave?.({
      name: this.name,
      role: this.role,
      status: this.status,
      location: this.location,
      connections: this.connections,
      about: this.about,
      experienceTitle: this.experienceTitle,
      experienceCompany: this.experienceCompany,
      experiencePeriod: this.experiencePeriod,
      experienceDetails: this.experienceDetails,
      email: this.email,
      phone: this.phone,
      website: this.website,
      linkedin: this.linkedin,
      skillsString: this.skillsString,
    });
    this.isEditing = false;
  }

  @action updateName(event) {
    this.name = event.target.value;
  }

  @action updateRole(event) {
    this.role = event.target.value;
  }

  @action updateStatus(event) {
    this.status = event.target.value;
  }

  @action updateLocation(event) {
    this.location = event.target.value;
  }

  @action updateConnections(event) {
    this.connections = event.target.value;
  }

  @action updateAbout(event) {
    this.about = event.target.value;
  }

  @action updateExperienceTitle(event) {
    this.experienceTitle = event.target.value;
  }

  @action updateExperienceCompany(event) {
    this.experienceCompany = event.target.value;
  }

  @action updateExperiencePeriod(event) {
    this.experiencePeriod = event.target.value;
  }

  @action updateExperienceDetails(event) {
    this.experienceDetails = event.target.value;
  }

  @action updateEmail(event) {
    this.email = event.target.value;
  }

  @action updatePhone(event) {
    this.phone = event.target.value;
  }

  @action updateWebsite(event) {
    this.website = event.target.value;
  }

  @action updateLinkedin(event) {
    this.linkedin = event.target.value;
  }

  @action updateSkills(event) {
    this.skillsString = event.target.value;
  }

  @action toggleEditing() {
    this.isEditing = !this.isEditing;
  }

  @action stopPropagation(event) {
    event.stopPropagation();
  }

  <template>
    <section class="profile-header">
      <div class="profile-header__cover">
        <img src={{@coverUrl}} alt={{concat "Couverture de " this.name}} class="profile-header__cover-image" />
      </div>
      <div class="profile-header__body">
        <div class="profile-header__avatar-wrapper">
          <img src={{@avatarUrl}} alt={{this.name}} class="profile-header__avatar" />
        </div>
        <div class="profile-header__details">
          <h1 class="profile-header__name">{{this.name}}</h1>
          <div class="profile-header__role">{{this.role}}</div>
          <div class="profile-header__meta">
            <span class="profile-header__badge profile-header__badge--status">{{this.status}}</span>
            <span class="profile-header__badge profile-header__badge--location">{{this.location}}</span>
            <span class="profile-header__badge profile-header__badge--connections">{{this.connections}} connexions</span>
          </div>
        </div>
        <div class="profile-header__actions">
          <button class="profile-header__action profile-header__action--cover">{{@coverActionLabel}}</button>
          <button
            class="profile-header__action profile-header__action--profile"
            type="button"
            {{on "click" this.startEditing}}
          >
            {{@profileActionLabel}}
          </button>
        </div>
      </div>

      {{#if this.isEditing}}
        <div class="profile-header__overlay" {{on "click" this.cancelEditing}}>
          <form class="profile-header__editor" {{on "click" this.stopPropagation}} {{on "submit" this.saveEditing}}>
            <div class="profile-header__editor-header">
              <h3>Modifier le résumé</h3>
              <button type="button" class="profile-header__editor-close" {{on "click" this.cancelEditing}}>×</button>
            </div>
            <div class="profile-header__editor-section">
              <div class="profile-header__editor-section-title">Informations de base</div>
              <div class="profile-header__editor-grid">
                <label class="profile-header__editor-field">
                  <span>Nom <strong>*</strong></span>
                  <div class="profile-header__input-wrap">
                    <input type="text" value={{this.name}} maxlength="50" {{on "input" this.updateName}} />
                    <span class="profile-header__counter">{{this.name.length}}/50</span>
                  </div>
                </label>
                <label class="profile-header__editor-field">
                  <span>Rôle <strong>*</strong></span>
                  <div class="profile-header__input-wrap">
                    <input type="text" value={{this.role}} maxlength="60" {{on "input" this.updateRole}} />
                    <span class="profile-header__counter">{{this.role.length}}/60</span>
                  </div>
                </label>
                <label class="profile-header__editor-field">
                  <span>Ville / Localisation</span>
                  <div class="profile-header__input-wrap">
                    <input type="text" value={{this.location}} maxlength="60" {{on "input" this.updateLocation}} />
                    <span class="profile-header__counter">{{this.location.length}}/60</span>
                  </div>
                </label>
                <label class="profile-header__editor-field">
                  <span>Statut</span>
                  <div class="profile-header__input-wrap">
                    <input type="text" value={{this.status}} maxlength="60" {{on "input" this.updateStatus}} />
                    <span class="profile-header__counter">{{this.status.length}}/60</span>
                  </div>
                </label>
                <label class="profile-header__editor-field profile-header__editor-field--full">
                  <span>À propos</span>
                  <div class="profile-header__input-wrap profile-header__input-wrap--textarea">
                    <textarea rows="4" maxlength="220" {{on "input" this.updateAbout}}>{{this.about}}</textarea>
                    <span class="profile-header__counter">{{this.about.length}}/220</span>
                  </div>
                  <small class="profile-header__hint">Présentez-vous en quelques phrases claires.</small>
                </label>
              </div>
            </div>
            <div class="profile-header__editor-section">
              <div class="profile-header__editor-section-title">Expérience professionnelle</div>
              <div class="profile-header__editor-grid">
                <label class="profile-header__editor-field">
                  <span>Intitulé du poste</span>
                  <div class="profile-header__input-wrap">
                    <input type="text" value={{this.experienceTitle}} maxlength="80" {{on "input" this.updateExperienceTitle}} />
                    <span class="profile-header__counter">{{this.experienceTitle.length}}/80</span>
                  </div>
                </label>
                <label class="profile-header__editor-field">
                  <span>Entreprise</span>
                  <div class="profile-header__input-wrap">
                    <input type="text" value={{this.experienceCompany}} maxlength="80" {{on "input" this.updateExperienceCompany}} />
                    <span class="profile-header__counter">{{this.experienceCompany.length}}/80</span>
                  </div>
                </label>
                <label class="profile-header__editor-field">
                  <span>Période</span>
                  <div class="profile-header__input-wrap">
                    <input type="text" value={{this.experiencePeriod}} maxlength="60" {{on "input" this.updateExperiencePeriod}} />
                    <span class="profile-header__counter">{{this.experiencePeriod.length}}/60</span>
                  </div>
                </label>
                <label class="profile-header__editor-field profile-header__editor-field--full">
                  <span>Détails</span>
                  <div class="profile-header__input-wrap profile-header__input-wrap--textarea">
                    <textarea rows="3" maxlength="260" {{on "input" this.updateExperienceDetails}}>{{this.experienceDetails}}</textarea>
                    <span class="profile-header__counter">{{this.experienceDetails.length}}/260</span>
                  </div>
                </label>
              </div>
            </div>
            <div class="profile-header__editor-section">
              <div class="profile-header__editor-section-title">Informations de contact</div>
              <div class="profile-header__editor-grid">
                <label class="profile-header__editor-field">
                  <span>Email</span>
                  <input type="email" value={{this.email}} {{on "input" this.updateEmail}} />
                </label>
                <label class="profile-header__editor-field">
                  <span>Tel</span>
                  <input type="text" value={{this.phone}} {{on "input" this.updatePhone}} />
                </label>
                <label class="profile-header__editor-field">
                  <span>Site</span>
                  <input type="text" value={{this.website}} {{on "input" this.updateWebsite}} />
                </label>
                <label class="profile-header__editor-field">
                  <span>LinkedIn</span>
                  <input type="text" value={{this.linkedin}} {{on "input" this.updateLinkedin}} />
                </label>
              </div>
            </div>
            <div class="profile-header__editor-section">
              <div class="profile-header__editor-section-title">Compétences</div>
              <label class="profile-header__editor-field profile-header__editor-field--full">
                <span>Liste (séparée par des virgules)</span>
                <div class="profile-header__input-wrap profile-header__input-wrap--textarea">
                  <textarea rows="3" maxlength="320" {{on "input" this.updateSkills}}>{{this.skillsString}}</textarea>
                  <span class="profile-header__counter">{{this.skillsString.length}}/320</span>
                </div>
                <small class="profile-header__hint">Exemple : React, TypeScript, Node.js, PostgreSQL</small>
              </label>
            </div>
            <div class="profile-header__editor-actions">
              <button type="button" class="profile-header__action profile-header__action--cover" {{on "click" this.cancelEditing}}>
                Annuler
              </button>
              <button type="submit" class="profile-header__action profile-header__action--profile">
                Enregistrer
              </button>
            </div>
          </form>
        </div>
      {{/if}}
    </section>
  </template>
}
