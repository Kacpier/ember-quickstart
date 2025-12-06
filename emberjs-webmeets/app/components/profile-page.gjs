import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { setComponentTemplate } from '@ember/component';
import { hbs } from 'ember-cli-htmlbars';
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
  @tracked profile = { ...DEFAULT_PROFILE };
  @tracked editDraft = { ...DEFAULT_PROFILE };
  @tracked isEditing = false;

  @action startEdit() {
    this.editDraft = { ...this.profile };
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
    this.isEditing = false;
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
              <img src="https://images.unsplash.com/photo-1629507208649-70919ca33793?w=200" class="avatar-big" alt="Sophie Laurent" />
            </div>

            <div class="profile-info">
              <h2 class="name">{{this.profile.name}}</h2>
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
            <section class="card">
              <h3>À propos</h3>
              <p>{{this.profile.about}}</p>
            </section>

            <section class="card">
              <h3>Informations de contact</h3>
              <ul class="contact-list">
                <li>{{this.profile.email}}</li>
                <li>{{this.profile.phone}}</li>
                <li>{{this.profile.website}}</li>
                <li>{{this.profile.linkedin}}</li>
              </ul>
            </section>

            <section class="card">
              <h3>Expérience professionnelle</h3>
              <div class="exp-item">
                <h4>Développeur Full Stack Senior</h4>
                <p class="company">Tech Innovators · 2019 - Aujourd'hui</p>
                <p>
                  Conception et développement d'applications web complexes,
                  gestion d'une équipe de développeurs et mise en place de bonnes
                  pratiques d'architecture.
                </p>
              </div>

              <div class="exp-item">
                <h4>Développeur Frontend</h4>
                <p class="company">Digital Solutions · 2019 - 2021</p>
                <p>
                  Création d’interfaces utilisateur modernes et réactives.
                </p>
              </div>
            </section>

            <section class="card">
              <h3>Compétences</h3>
              <div class="tags">
                <span class="tag">React</span>
                <span class="tag">TypeScript</span>
                <span class="tag">Node.js</span>
                <span class="tag">PostgreSQL</span>
                <span class="tag">AWS</span>
                <span class="tag">Docker</span>
                <span class="tag">GraphQL</span>
                <span class="tag">Tailwind CSS</span>
              </div>
            </section>
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
