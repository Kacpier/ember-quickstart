import Component from '@glimmer/component';
import { setComponentTemplate } from '@ember/component';
import { action } from '@ember/object';
import { service } from '@ember/service';
import { hbs } from 'ember-cli-htmlbars';
import { LinkTo } from '@ember/routing';

class AppSidebar extends Component {
  @service router;

  @action
  logout() {
    this.router.transitionTo('index');
  }
}

export default setComponentTemplate(
  hbs`
    <aside class="sidebar" ...attributes>
      <div class="sidebar-header">
        <div class="login-icon">
          WM
        </div>
        <div class="sidebar-title-box">
          <h2 class="sidebar-app-title">WebMeets</h2>
          <p class="sidebar-app-subtitle">Réseau & Organisation</p>
        </div>
      </div>

      <div class="sidebar-profile">
        <img src="https://images.unsplash.com/photo-1629507208649-70919ca33793?w=200" class="sidebar-avatar" alt="Sophie Laurent" />
        <div>
          <div class="sidebar-profile-name">Sophie Laurent</div>
          <div class="sidebar-profile-role">Cheffe de projet digital</div>
        </div>
      </div>

      <nav class="sidebar-nav">
        <ul>
          <li>
            <LinkTo @route="dashboard" class="item" @activeClass="active">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M3 12l9-9 9 9M4 10v10h6V14h4v6h6V10" />
              </svg>
              Tableau de bord
            </LinkTo>
          </li>
          <li>
            <LinkTo @route="featured" class="item" @activeClass="active">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M4 4a16 16 0 0116 16M4 4a8 8 0 018 8M4 12a4 4 0 014 4" />
              </svg>
              À la une
            </LinkTo>
          </li>
          <li>
            <LinkTo @route="profiles" class="item" @activeClass="active">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M5.121 17.804A9 9 0 0112 15a9 9 0 016.879 2.804M12 12a4 4 0 100-8 4 4 0 000 8z" />
              </svg>
              Mon Profil
            </LinkTo>
          </li>
          <li class="item">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M17 20h5v-2a4 4 0 00-4-4h-1M7 20H2v-2a4 4 0 014-4h1m8-6a4 4 0 11-8 0 4 4 0 018 0z" />
            </svg>
            Réseau
          </li>
          <li class="item">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M8 7V3m8 4V3M3 11h18M5 21h14a2 2 0 002-2V7H3v12a2 2 0 002 2z" />
            </svg>
            Événements
          </li>
          <li>
            <LinkTo @route="tasks" class="item" @activeClass="active">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M9 5h6M9 3h6a2 2 0 012 2v14a2 2 0 01-2 2H9a2 2 0 01-2-2V5a2 2 0 012-2zM9 14h.01M9 11h.01" />
              </svg>
              Tâches
            </LinkTo>
          </li>
          <li class="item">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M3 10h18M3 6h18M5 14h2M9 14h2M13 14h2M17 14h2M5 18h2M9 18h2M13 18h2M17 18h2" />
            </svg>
            Calendrier
          </li>
          <li>
            <LinkTo @route="messages" class="item" @activeClass="active">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M7 8h10M7 12h6m5 9v-3a5 5 0 00-5-5H7a5 5 0 00-5 5v3" />
              </svg>
              Messages
            </LinkTo>
          </li>
        </ul>
      </nav>

      <button class="sidebar-logout" type="button" {{on "click" this.logout}}>
        <svg xmlns="http://www.w3.org/2000/svg" class="logout-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
            d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 013-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
        </svg>
        Déconnexion
      </button>
    </aside>
  `,
  AppSidebar
);
