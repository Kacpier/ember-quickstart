import Component from '@glimmer/component';
import { action } from '@ember/object';
import { service } from '@ember/service';
import { setComponentTemplate } from '@ember/component';
import { hbs } from 'ember-cli-htmlbars';
import AppSidebar from './app-sidebar';
import ConnectionsSearch from './connections-search';

class DashboardPage extends Component {
  @service router;
  @service currentUser;

  statConnections = 247;
  statTasks = 3;
  statEvents = 5;
  statMessages = 8;

  @action goToFeatured() {
    this.router.transitionTo('featured');
  }

  @action goToConnections() {
    this.router.transitionTo('profiles');
  }

  @action goToMessages() {
    this.router.transitionTo('messages');
  }

  // Pas de page calendrier pour l'instant, on reste sur le tableau de bord
  @action goToCalendar() {
    this.router.transitionTo('dashboard');
  }

  @action goToTasks() {
    this.router.transitionTo('tasks');
  }

  featuredPosts = [
    {
      author: 'Emma Petit',
      time: 'Il y a 2h',
      text: "Excellente conférence sur l'IA et l'avenir du travail ! Les opportunités sont immenses pour...",
      likes: 24,
    },
    {
      author: 'Thomas Martin',
      time: 'Il y a 5h',
      text: "Nouveau projet open source ! N'hésitez pas à contribuer sur GitHub 💻",
      likes: 42,
    },
  ];

  newConnections = [
    { name: 'Marie Dubois', role: 'Designer UX/UI' },
    { name: 'Thomas Martin', role: 'Développeur Full Stack' },
    { name: 'Emma Petit', role: 'Product Manager' },
  ];

  upcomingEvents = [
    { title: 'Meetup UX Paris', date: 'Jeudi · 18:00' },
    { title: 'Workshop React', date: 'Samedi · 10:00' },
    { title: 'Afterwork Tech', date: 'Lundi · 19:30' },
  ];

  recentTasks = [
    { title: 'Refonte landing page', status: 'En cours' },
    { title: 'Préparer démo client', status: 'Planifiée' },
    { title: 'Tests QA sprint 12', status: 'En cours' },
  ];

  get greetingName() {
    return this.currentUser.name || 'Sophie';
  }
}

export default setComponentTemplate(
  hbs`
    <div class="dashboard-page">
      <AppSidebar />

      <main class="dashboard-main">
        <ConnectionsSearch
          @placeholder="Rechercher une connexion, une entreprise ou un centre d'intérêt"
          @showResults={{true}}
        />

        <header class="dash-hero">
          <div>
            <p class="dash-hello">Bonjour, {{this.greetingName}} 👋</p>
            <p class="dash-sub">Voici un aperçu de votre activité</p>
          </div>
        </header>

        <section class="dash-stats">
          <article class="stat-card">
            <div class="stat-row">
              <p class="stat-label">Connexions</p>
              <span class="stat-icon tint-blue">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2" />
                  <circle cx="9" cy="7" r="4" stroke-width="2" />
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M22 21v-2a4 4 0 0 0-3-3.87" />
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 3.13a4 4 0 0 1 0 7.75" />
                </svg>
              </span>
            </div>
            <p class="stat-value">{{this.statConnections}}</p>
          </article>

          <article class="stat-card">
            <div class="stat-row">
              <p class="stat-label">Tâches actives</p>
              <span class="stat-icon tint-green">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/></svg>
              </span>
            </div>
            <p class="stat-value">{{this.statTasks}}</p>
          </article>

          <article class="stat-card">
            <div class="stat-row">
              <p class="stat-label">Événements</p>
              <span class="stat-icon tint-purple">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3M3 11h18M5 21h14a2 2 0 002-2V7H3v12a2 2 0 002 2z"/></svg>
              </span>
            </div>
            <p class="stat-value">{{this.statEvents}}</p>
          </article>

          <article class="stat-card">
            <div class="stat-row">
              <p class="stat-label">Messages</p>
              <span class="stat-icon tint-orange">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z"/>
                </svg>
              </span>
            </div>
            <p class="stat-value">{{this.statMessages}}</p>
          </article>
        </section>

        <section class="dash-grid">
          <article class="dash-card">
            <header class="dash-card-header">
              <p class="dash-card-title">À la une</p>
              <div class="dash-card-actions">
                <button class="link-btn" type="button" {{on "click" this.goToFeatured}}>Voir tout</button>
              </div>
            </header>
            <div class="feed">
              {{#each this.featuredPosts as |post|}}
                <div class="feed-item">
                  <div class="feed-author">
                    <img src="https://images.unsplash.com/photo-1629507208649-70919ca33793?w=80" alt="{{post.author}}" class="feed-avatar" />
                    <div>
                      <p class="feed-name">{{post.author}}</p>
                      <p class="feed-time">{{post.time}}</p>
                    </div>
                  </div>
                  <p class="feed-text">{{post.text}}</p>
                  <p class="feed-meta">♡ {{post.likes}} J'aime</p>
                </div>
              {{/each}}
            </div>
          </article>

          <article class="dash-card">
            <header class="dash-card-header">
              <p class="dash-card-title">Nouvelles connexions</p>
              <div class="dash-card-actions">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a4 4 0 00-4-4h-1M7 20H2v-2a4 4 0 014-4h1m8-6a4 4 0 11-8 0 4 4 0 018 0z"/>
                <button class="link-btn" type="button" {{on "click" this.goToConnections}}>Voir tout</button>
              </div>
            </header>
            <div class="connections-list">
              {{#each this.newConnections as |person|}}
                <div class="connection-row">
                  <div class="connection-user">
                    <img src="https://images.unsplash.com/photo-1629507208649-70919ca33793?w=80" alt="{{person.name}}" class="feed-avatar" />
                    <div>
                      <p class="feed-name">{{person.name}}</p>
                      <p class="feed-time">{{person.role}}</p>
                    </div>
                  </div>
                  <button class="chip-btn" type="button" {{on "click" this.goToMessages}}>Message</button>
                </div>
              {{/each}}
            </div>
          </article>

          <article class="dash-card">
            <header class="dash-card-header">
              <p class="dash-card-title">Événements à venir</p>
              <button class="link-btn" type="button" {{on "click" this.goToCalendar}}>Calendrier</button>
            </header>
            <ul class="list-simple">
              {{#each this.upcomingEvents as |event|}}
                <li>
                  <div>
                    <p class="feed-name">{{event.title}}</p>
                    <p class="feed-time">{{event.date}}</p>
                  </div>
                </li>
              {{/each}}
            </ul>
          </article>

          <article class="dash-card">
            <header class="dash-card-header">
              <p class="dash-card-title">Tâches récentes</p>
              <button class="link-btn" type="button" {{on "click" this.goToTasks}}>Voir toutes</button>
            </header>
            <ul class="list-simple">
              {{#each this.recentTasks as |task|}}
                <li>
                  <div>
                    <p class="feed-name">{{task.title}}</p>
                    <p class="feed-time">{{task.status}}</p>
                  </div>
                </li>
              {{/each}}
            </ul>
          </article>
        </section>
      </main>
    </div>
  `,
  DashboardPage
);
