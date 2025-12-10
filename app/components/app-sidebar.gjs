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
                  d="M3 12.5 12 4l9 8.5V20a1 1 0 0 1-1 1h-5a1 1 0 0 1-1-1v-5H10v5a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1z" />
              </svg>
              Tableau de bord
            </LinkTo>
          </li>
          <li>
            <LinkTo @route="featured" class="item" @activeClass="active">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M3 11l14-5v12l-14-5v3a2 2 0 0 0 2 2h2m8-11v12" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 9v6" />
              </svg>
              À la une
            </LinkTo>
          </li>
          <li>
            <LinkTo @route="profiles" class="item" @activeClass="active">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M12 12a4 4 0 1 0-4-4 4 4 0 0 0 4 4Zm-7 7a7 7 0 0 1 14 0" />
              </svg>
              Mon Profil
            </LinkTo>
          </li>
          <li class="item">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <circle cx="7" cy="8" r="3" stroke-width="2" />
              <circle cx="17" cy="8" r="3" stroke-width="2" />
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 8h4" />
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M4 19v-.5A4.5 4.5 0 0 1 8.5 14h7A4.5 4.5 0 0 1 20 18.5V19" />
            </svg>
            Réseau
          </li>
          <li class="item">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M8 3v2m8-2v2M5 7h14a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2Zm11 5.5-2 2-1-1" />
            </svg>
            Événements
          </li>
          <li>
            <LinkTo @route="tasks" class="item" @activeClass="active">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M9 4h6a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H9a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2Zm-1 5h8m-8 4h8m-8 4h4" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.5 9.5 9 11l-1-.75" />
              </svg>
              Tâches
            </LinkTo>
          </li>
          <li class="item">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M7 3v2m10-2v2M5 7h14a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2Zm2 4h3m4 0h3m-10 4h3m4 0h3" />
            </svg>
            Calendrier
          </li>
          <li>
            <LinkTo @route="messages" class="item" @activeClass="active">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M5 5h14a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2H8l-4 3v-3H5a2 2 0 0 1-2-2V7a2 2 0 0 1 2-2Zm3 6h8m-8-3h10" />
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
