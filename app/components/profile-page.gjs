import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { setComponentTemplate } from '@ember/component';
import { hbs } from 'ember-cli-htmlbars';
import { service } from '@ember/service';
import AppSidebar from './app-sidebar';
import EditProfileModal from './edit-profile-modal';

const DEFAULT_PROFILE = {
  name: 'Sophie Laurent',
  headline: 'Cheffe de projet digital',
  status: 'Micro-entrepreneure',
  location: 'Paris, France',
  about:
    "Passionnée par le développement web et les technologies innovantes. Spécialisée en React, Node.js et architecture cloud. Toujours à la recherche de nouveaux défis et collaborations.",
  email: 'sophie.laurent@example.com',
  phone: '+33 6 12 34 56 78',
  website: 'www.monsite.dev',
  linkedin: 'linkedin.com/in/monprofil',
  connections: 247,
};

class ProfilePage extends Component {
  @service currentUser;

  @tracked profile = { ...DEFAULT_PROFILE };
  @tracked editDraft = { ...DEFAULT_PROFILE };
  @tracked isEditing = false;
  @tracked experiences = [
    {
      title: 'Développeur Full Stack Senior',
      company: 'Tech Innovators',
      period: "2019 - Aujourd'hui",
      description:
        "Conception et développement d'applications web complexes, gestion d'une équipe de développeurs et mise en place de bonnes pratiques d'architecture.",
    },
    {
      title: 'Développeur Frontend',
      company: 'Digital Solutions',
      period: '2019 - 2021',
      description: 'Création d’interfaces utilisateur modernes et réactives.',
    },
  ];
  @tracked formations = [
    { title: 'MSc Informatique', school: 'Université de Lyon', period: '2017 - 2019' },
    { title: 'Licence Informatique', school: 'Université de Lyon', period: '2014 - 2017' },
  ];
  @tracked languages = [
    { name: 'Français', level: 'Natif' },
    { name: 'Anglais', level: 'Courant' },
    { name: 'Espagnol', level: 'Intermédiaire' },
  ];
  @tracked skills = ['React', 'TypeScript', 'Node.js', 'PostgreSQL', 'AWS', 'Docker', 'GraphQL', 'Tailwind CSS'];
  @tracked interests = ['UI/UX design', 'Blockchain', 'Voyages', 'Photographie'];
  @tracked editingSection = null;
  @tracked sectionDraft = null;

  @action startEdit() {
    this.editDraft = {
      ...this.profile,
      name: this.displayName,
      email: this.displayEmail,
    };
    this.isEditing = true;
  }

  @action cancelEdit() {
    this.isEditing = false;
  }

  @action updateDraft(field, event) {
    this.editDraft = { ...this.editDraft, [field]: event.target.value };
  }

  @action saveProfile() {
    this.profile = { ...this.profile, ...this.editDraft };
    this.currentUser.setUser({
      name: this.profile.name,
      email: this.profile.email,
    });
    this.isEditing = false;
  }

  get displayName() {
    return this.currentUser.name || this.profile.name;
  }

  get displayEmail() {
    return this.currentUser.email || this.profile.email;
  }

  get isExperienceEditing() {
    return this.editingSection === 'experience';
  }

  get isFormationEditing() {
    return this.editingSection === 'formation';
  }

  get isLanguageEditing() {
    return this.editingSection === 'languages';
  }

  get isInterestEditing() {
    return this.editingSection === 'interests';
  }

  get isSkillEditing() {
    return this.editingSection === 'skills';
  }

  cloneSection(section) {
    let data = [];

    switch (section) {
      case 'experience':
        data = this.experiences;
        break;
      case 'formation':
        data = this.formations;
        break;
      case 'languages':
        data = this.languages;
        break;
      case 'skills':
        data = this.skills;
        break;
      case 'interests':
        data = this.interests;
        break;
      default:
        data = [];
    }

    return JSON.parse(JSON.stringify(data));
  }

  defaultForSection(section) {
    switch (section) {
      case 'experience':
        return {
          title: 'Nouveau poste',
          company: 'Entreprise',
          period: 'Année - Année',
          description: 'Décrivez vos missions principales.',
        };
      case 'formation':
        return { title: 'Nouvelle formation', school: 'Établissement', period: 'Année - Année' };
      case 'languages':
        return { name: 'Langue', level: 'Niveau' };
      case 'skills':
        return 'Nouvelle compétence';
      case 'interests':
        return 'Nouvel intérêt';
      default:
        return {};
    }
  }

  @action startSectionEdit(section) {
    if (this.editingSection === section && this.sectionDraft) {
      return;
    }

    this.sectionDraft = { section, items: this.cloneSection(section) };
    this.editingSection = section;
  }

  @action cancelSectionEdit() {
    this.sectionDraft = null;
    this.editingSection = null;
  }

  @action addDraftItem(section) {
    let baseItems =
      this.sectionDraft?.section === section ? [...this.sectionDraft.items] : this.cloneSection(section);

    baseItems.push(this.defaultForSection(section));
    this.sectionDraft = { section, items: baseItems };
    this.editingSection = section;
  }

  @action updateDraftItem(section, index, field, event) {
    if (this.sectionDraft?.section !== section) {
      return;
    }

    let items = this.sectionDraft.items.map((item, i) => {
      if (i !== index) return item;

      if (section === 'interests' || section === 'skills') {
        return event.target.value;
      }

      return { ...item, [field]: event.target.value };
    });

    this.sectionDraft = { section, items };
  }

  @action removeDraftItem(section, index) {
    if (this.sectionDraft?.section !== section) {
      return;
    }

    let items = this.sectionDraft.items.filter((_, i) => i !== index);
    this.sectionDraft = { section, items };
  }

  @action saveSection(section) {
    if (this.sectionDraft?.section !== section) {
      return;
    }

    switch (section) {
      case 'experience':
        this.experiences = [...this.sectionDraft.items];
        break;
      case 'formation':
        this.formations = [...this.sectionDraft.items];
        break;
      case 'languages':
        this.languages = [...this.sectionDraft.items];
        break;
      case 'skills':
        this.skills = [...this.sectionDraft.items];
        break;
      case 'interests':
        this.interests = [...this.sectionDraft.items];
        break;
    }

    this.sectionDraft = null;
    this.editingSection = null;
  }
}

export default setComponentTemplate(
  hbs`
    <div class="profile-page">
      <div class="profile-layout">

        <AppSidebar />

        <section class="profile-main">

          <div class="profile-cover">
            <button class="cover-btn" type="button">Modifier la couverture</button>
          </div>

          <div class="profile-card">
            <div class="avatar-container">
              <img src="https://images.unsplash.com/photo-1629507208649-70919ca33793?w=200" class="avatar-big" alt={{this.displayName}} />
            </div>

            <div class="profile-info">
              <h2 class="name">{{this.displayName}}</h2>
              <p class="role">{{this.profile.headline}}</p>
              <p class="meta">{{this.profile.status}} · {{this.profile.location}}</p>
              <button class="edit-btn" type="button" {{on "click" this.startEdit}}>Modifier le profil</button>
            </div>

            <div class="connections-box">
              <div class="connections-number">{{this.profile.connections}}</div>
              <div class="connections-label">connexions</div>
            </div>
          </div>

          <div class="profile-grid">
            <div class="profile-column">
              <section class="card">
                <div class="card-header">
                  <h3 class="card-title">À propos</h3>
                </div>
                <p>{{this.profile.about}}</p>
              </section>

              <section class="card">
                <div class="card-header">
                  <h3 class="card-title">Expérience professionnelle</h3>
                  <div class="section-actions">
                    <button class="icon-action" type="button" aria-label="Ajouter une expérience" {{on "click" (fn this.addDraftItem "experience")}}>+</button>
                    <button class="icon-action" type="button" aria-label="Modifier les expériences" {{on "click" (fn this.startSectionEdit "experience")}}>✎</button>
                  </div>
                </div>

                {{#if this.isExperienceEditing}}
                  <div class="edit-list">
                  {{#each this.sectionDraft.items key="@index" as |exp index|}}
                    <div class="edit-row">
                      <div class="row-actions">
                        <button class="icon-action danger" type="button" aria-label="Supprimer cette expérience" {{on "click" (fn this.removeDraftItem "experience" index)}}>✕</button>
                      </div>
                        <input
                          class="edit-input"
                          type="text"
                          value={{exp.title}}
                          placeholder="Intitulé du poste"
                          {{on "input" (fn this.updateDraftItem "experience" index "title")}}
                        />
                        <input
                          class="edit-input"
                          type="text"
                          value={{exp.company}}
                          placeholder="Entreprise"
                          {{on "input" (fn this.updateDraftItem "experience" index "company")}}
                        />
                        <input
                          class="edit-input"
                          type="text"
                          value={{exp.period}}
                          placeholder="Période"
                          {{on "input" (fn this.updateDraftItem "experience" index "period")}}
                        />
                        <textarea
                          class="edit-textarea"
                          rows="3"
                          placeholder="Description"
                          {{on "input" (fn this.updateDraftItem "experience" index "description")}}
                        >{{exp.description}}</textarea>
                      </div>
                    {{/each}}

                    <div class="edit-actions">
                      <button class="chip-btn" type="button" {{on "click" (fn this.addDraftItem "experience")}}>+ Ajouter une expérience</button>
                      <div class="edit-actions-right">
                        <button class="ghost-btn" type="button" {{on "click" this.cancelSectionEdit}}>Annuler</button>
                        <button class="save-btn" type="button" {{on "click" (fn this.saveSection "experience")}}>Enregistrer</button>
                      </div>
                    </div>
                  </div>
                {{else}}
                  {{#each this.experiences as |exp|}}
                    <div class="exp-item">
                      <h4>{{exp.title}}</h4>
                      <p class="company">{{exp.company}} · {{exp.period}}</p>
                      <p>{{exp.description}}</p>
                    </div>
                  {{/each}}
                {{/if}}
              </section>

              <section class="card">
                <div class="card-header">
                  <h3 class="card-title">Formation</h3>
                  <div class="section-actions">
                    <button class="icon-action" type="button" aria-label="Ajouter une formation" {{on "click" (fn this.addDraftItem "formation")}}>+</button>
                    <button class="icon-action" type="button" aria-label="Modifier les formations" {{on "click" (fn this.startSectionEdit "formation")}}>✎</button>
                  </div>
                </div>

                {{#if this.isFormationEditing}}
                  <div class="edit-list">
                    {{#each this.sectionDraft.items key="@index" as |formation index|}}
                      <div class="edit-row">
                        <div class="row-actions">
                          <button class="icon-action danger" type="button" aria-label="Supprimer cette formation" {{on "click" (fn this.removeDraftItem "formation" index)}}>✕</button>
                        </div>
                        <input
                          class="edit-input"
                          type="text"
                          value={{formation.title}}
                          placeholder="Diplôme ou formation"
                          {{on "input" (fn this.updateDraftItem "formation" index "title")}}
                        />
                        <input
                          class="edit-input"
                          type="text"
                          value={{formation.school}}
                          placeholder="Établissement"
                          {{on "input" (fn this.updateDraftItem "formation" index "school")}}
                        />
                        <input
                          class="edit-input"
                          type="text"
                          value={{formation.period}}
                          placeholder="Période"
                          {{on "input" (fn this.updateDraftItem "formation" index "period")}}
                        />
                      </div>
                  {{/each}}

                    <div class="edit-actions">
                      <button class="chip-btn" type="button" {{on "click" (fn this.addDraftItem "formation")}}>+ Ajouter une formation</button>
                      <div class="edit-actions-right">
                        <button class="ghost-btn" type="button" {{on "click" this.cancelSectionEdit}}>Annuler</button>
                        <button class="save-btn" type="button" {{on "click" (fn this.saveSection "formation")}}>Enregistrer</button>
                      </div>
                    </div>
                  </div>
                {{else}}
                  {{#each this.formations as |formation|}}
                    <div class="exp-item">
                      <h4>{{formation.title}}</h4>
                      <p class="company">{{formation.school}} · {{formation.period}}</p>
                    </div>
                  {{/each}}
                {{/if}}
              </section>
            </div>

            <div class="profile-column">
              <section class="card">
                <div class="card-header">
                  <h3 class="card-title">Informations de contact</h3>
                </div>
                <ul class="contact-list">
                  <li>{{this.displayEmail}}</li>
                  <li>{{this.profile.phone}}</li>
                  <li>{{this.profile.website}}</li>
                  <li>{{this.profile.linkedin}}</li>
                </ul>
              </section>

              <section class="card">
                <div class="card-header">
                  <h3 class="card-title">Langues</h3>
                  <div class="section-actions">
                    <button class="icon-action" type="button" aria-label="Ajouter une langue" {{on "click" (fn this.addDraftItem "languages")}}>+</button>
                    <button class="icon-action" type="button" aria-label="Modifier les langues" {{on "click" (fn this.startSectionEdit "languages")}}>✎</button>
                  </div>
                </div>

                {{#if this.isLanguageEditing}}
                  <div class="edit-list">
                    {{#each this.sectionDraft.items key="@index" as |lang index|}}
                      <div class="edit-row inline">
                        <div class="row-actions">
                          <button class="icon-action danger" type="button" aria-label="Supprimer cette langue" {{on "click" (fn this.removeDraftItem "languages" index)}}>✕</button>
                        </div>
                        <input
                          class="edit-input"
                          type="text"
                          value={{lang.name}}
                          placeholder="Langue"
                          {{on "input" (fn this.updateDraftItem "languages" index "name")}}
                        />
                        <input
                          class="edit-input"
                          type="text"
                          value={{lang.level}}
                          placeholder="Niveau"
                          {{on "input" (fn this.updateDraftItem "languages" index "level")}}
                        />
                      </div>
                    {{/each}}

                    <div class="edit-actions">
                      <button class="chip-btn" type="button" {{on "click" (fn this.addDraftItem "languages")}}>+ Ajouter une langue</button>
                      <div class="edit-actions-right">
                        <button class="ghost-btn" type="button" {{on "click" this.cancelSectionEdit}}>Annuler</button>
                        <button class="save-btn" type="button" {{on "click" (fn this.saveSection "languages")}}>Enregistrer</button>
                      </div>
                    </div>
                  </div>
                {{else}}
                  <ul class="contact-list">
                    {{#each this.languages as |lang|}}
                      <li><strong>{{lang.name}}</strong> · {{lang.level}}</li>
                    {{/each}}
                  </ul>
                {{/if}}
              </section>

              <section class="card">
                <div class="card-header">
                  <h3 class="card-title">Compétences</h3>
                  <div class="section-actions">
                    <button class="icon-action" type="button" aria-label="Ajouter une compétence" {{on "click" (fn this.addDraftItem "skills")}}>+</button>
                    <button class="icon-action" type="button" aria-label="Modifier les compétences" {{on "click" (fn this.startSectionEdit "skills")}}>✎</button>
                  </div>
                </div>

                {{#if this.isSkillEditing}}
                  <div class="edit-list">
                    {{#each this.sectionDraft.items key="@index" as |skill index|}}
                      <div class="edit-row inline">
                        <div class="row-actions">
                          <button class="icon-action danger" type="button" aria-label="Supprimer cette compétence" {{on "click" (fn this.removeDraftItem "skills" index)}}>✕</button>
                        </div>
                        <input
                          class="edit-input"
                          type="text"
                          value={{skill}}
                          placeholder="Compétence"
                          {{on "input" (fn this.updateDraftItem "skills" index "label")}}
                        />
                      </div>
                    {{/each}}

                    <div class="edit-actions">
                      <button class="chip-btn" type="button" {{on "click" (fn this.addDraftItem "skills")}}>+ Ajouter une compétence</button>
                      <div class="edit-actions-right">
                        <button class="ghost-btn" type="button" {{on "click" this.cancelSectionEdit}}>Annuler</button>
                        <button class="save-btn" type="button" {{on "click" (fn this.saveSection "skills")}}>Enregistrer</button>
                      </div>
                    </div>
                  </div>
                {{else}}
                  <div class="tags">
                    {{#each this.skills as |skill|}}
                      <span class="tag">{{skill}}</span>
                    {{/each}}
                  </div>
                {{/if}}
              </section>

              <section class="card">
                <div class="card-header">
                  <h3 class="card-title">Centres d’intérêt</h3>
                  <div class="section-actions">
                    <button class="icon-action" type="button" aria-label="Ajouter un centre d’intérêt" {{on "click" (fn this.addDraftItem "interests")}}>+</button>
                    <button class="icon-action" type="button" aria-label="Modifier les centres d’intérêt" {{on "click" (fn this.startSectionEdit "interests")}}>✎</button>
                  </div>
                </div>

                {{#if this.isInterestEditing}}
                  <div class="edit-list">
                    {{#each this.sectionDraft.items key="@index" as |interest index|}}
                      <div class="edit-row inline">
                        <div class="row-actions">
                          <button class="icon-action danger" type="button" aria-label="Supprimer ce centre d’intérêt" {{on "click" (fn this.removeDraftItem "interests" index)}}>✕</button>
                        </div>
                        <input
                          class="edit-input"
                          type="text"
                          value={{interest}}
                          placeholder="Centre d’intérêt"
                          {{on "input" (fn this.updateDraftItem "interests" index "label")}}
                        />
                      </div>
                    {{/each}}

                    <div class="edit-actions">
                      <button class="chip-btn" type="button" {{on "click" (fn this.addDraftItem "interests")}}>+ Ajouter un centre</button>
                      <div class="edit-actions-right">
                        <button class="ghost-btn" type="button" {{on "click" this.cancelSectionEdit}}>Annuler</button>
                        <button class="save-btn" type="button" {{on "click" (fn this.saveSection "interests")}}>Enregistrer</button>
                      </div>
                    </div>
                  </div>
                {{else}}
                  <div class="pill-list">
                    {{#each this.interests as |interest|}}
                      <span class="pill">{{interest}}</span>
                    {{/each}}
                  </div>
                {{/if}}
              </section>
            </div>
          </div>

          {{#if this.isEditing}}
            <EditProfileModal
              @draft={{this.editDraft}}
              @onFieldChange={{this.updateDraft}}
              @onClose={{this.cancelEdit}}
              @onSave={{this.saveProfile}}
            />
          {{/if}}
        </section>
      </div>
    </div>
  `,
  ProfilePage
);
