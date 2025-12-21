import Component from '@glimmer/component';
import { setComponentTemplate } from '@ember/component';
import { action } from '@ember/object';
import { service } from '@ember/service';
import { hbs } from 'ember-cli-htmlbars';
import { LinkTo } from '@ember/routing';

class AppSidebar extends Component {
  @service router;
  @service currentUser;

  get displayName() {
    return this.currentUser.name || 'Sophie Laurent';
  }

  get displaySubtitle() {
    return this.currentUser.email || 'Cheffe de projet digital';
  }

  @action
  logout() {
    this.currentUser.clear();
    this.router.transitionTo('index');
  }
}

export default setComponentTemplate(
  hbs`
    <aside class="sidebar" ...attributes>
      <div class="sidebar-header">
        <div class="login-icon">
          <img src="/logo.svg" alt="Logo WebMeets" class="sidebar-logo-img" />
        </div>
        <div class="sidebar-title-box">
          <h2 class="sidebar-app-title">WebMeets</h2>
          <p class="sidebar-app-subtitle">Réseau & Organisation</p>
        </div>
      </div>

      <LinkTo @route="profiles" class="sidebar-profile" aria-label="Aller au profil">
        <img src="https://images.unsplash.com/photo-1550525811-e5869dd03032?w=80" class="sidebar-avatar" alt={{this.displayName}} />
        <div>
          <div class="sidebar-profile-name">{{this.displayName}}</div>
          <div class="sidebar-profile-role">{{this.displaySubtitle}}</div>
        </div>
      </LinkTo>

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
          <li>
            <LinkTo @route="reseau" class="item" @activeClass="active">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2" />
                <circle cx="9" cy="7" r="4" stroke-width="2" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M22 21v-2a4 4 0 0 0-3-3.87" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 3.13a4 4 0 0 1 0 7.75" />
              </svg>
              Réseau
            </LinkTo>
          </li>
          <li>
            <LinkTo @route="events" class="item" @activeClass="active">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M8 3v2m8-2v2M5 7h14a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2Zm11 5.5-2 2-1-1" />
              </svg>
              Événements
            </LinkTo>
          </li>
          <li>
            <LinkTo @route="tasks" class="item" @activeClass="active">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path d="M12 8.6H18" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                <path d="M6 8.6L7 9.62988L9.38 7.37988" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                <path d="M12 15.6H18" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                <path d="M6 15.6L7 16.6299L9.38 14.3799" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                <path d="M8 22H15C20 22 22 20 22 15V9C22 4 20 2 15 2H9C4 2 2 4 2 9V15C2 20 4 22 9 22Z" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
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
