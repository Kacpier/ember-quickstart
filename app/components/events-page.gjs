import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { setComponentTemplate } from '@ember/component';
import { hbs } from 'ember-cli-htmlbars';
import AppSidebar from './app-sidebar';

class EventsPage extends Component {
  @tracked searchQuery = '';
  @tracked activeCategory = 'Tous';
  @tracked activeTab = 'all';

  categories = ['Tous', 'Formation', 'Networking', 'Conférence', 'Workshop', 'Meetup'];

  tabs = [
    { id: 'all', label: 'Tous les événements' },
    { id: 'mine', label: 'Mes événements' },
  ];

  events = [
    {
      id: 'workshop-react',
      title: 'Workshop React avancé - Patterns et Performance',
      description: "Découvrez les patterns avancés de React et optimisez vos applications pour des performances maximales.",
      organizer: 'Tech Academy',
      organizerTitle: 'Organisateur',
      date: '15 Nov 2025',
      time: '14:00 (3h)',
      location: 'En ligne (Zoom)',
      mode: 'En ligne',
      price: 'Gratuit',
      seats: '45/50',
      badge: 'Formation',
      status: 'Inscrit',
      category: 'Formation',
      mine: true,
      cover: 'https://images.unsplash.com/photo-1487058792275-0ad4aaf24ca7?w=900',
    },
    {
      id: 'networking-paris',
      title: 'Networking Entrepreneurs Paris',
      description: 'Soirée de networking pour entrepreneurs, startups et investisseurs. Venez échanger et créer des synergies.',
      organizer: 'Startup Hub',
      organizerTitle: 'Organisateur',
      date: '18 Nov 2025',
      time: '18:30 (2h30)',
      location: 'Station F, Paris',
      mode: 'Présentiel',
      price: '15€',
      seats: '78/100',
      badge: 'Networking',
      category: 'Networking',
      mine: true,
      cover: 'https://images.unsplash.com/photo-1531058020387-3be344556be6?w=900',
    },
    {
      id: 'conf-product',
      title: 'Conférence Produit - Roadmaps 2026',
      description: 'Retours d’expérience sur la priorisation produit et les roadmaps pilotées par l’impact.',
      organizer: 'Product Minds',
      organizerTitle: 'Conférencier',
      date: '22 Nov 2025',
      time: '09:30 (2h)',
      location: 'WeWork La Fayette, Paris',
      mode: 'Présentiel',
      price: '35€',
      seats: '62/120',
      badge: 'Conférence',
      category: 'Conférence',
      mine: false,
      cover: 'https://images.unsplash.com/photo-1505373877841-8d25f7d46678?w=900',
    },
    {
      id: 'meetup-design',
      title: 'Meetup Design Systems',
      description: 'Atelier pratique sur les tokens, la cohérence UI et la documentation des composants.',
      organizer: 'UX Collective',
      organizerTitle: 'Organisateur',
      date: '29 Nov 2025',
      time: '19:00 (2h)',
      location: 'En ligne (Zoom)',
      mode: 'En ligne',
      price: 'Gratuit',
      seats: '120/200',
      badge: 'Meetup',
      category: 'Meetup',
      mine: false,
      cover: 'https://images.unsplash.com/photo-1521737604893-d14cc237f11d?w=900',
    },
  ];

  isCategory = (category) => this.activeCategory === category;

  isTab = (tabId) => this.activeTab === tabId;

  get filteredEvents() {
    let query = this.searchQuery.trim().toLowerCase();

    return this.events
      .filter((event) => (this.activeCategory === 'Tous' ? true : event.category === this.activeCategory))
      .filter((event) => (this.activeTab === 'mine' ? event.mine : true))
      .filter((event) => {
        if (!query) return true;
        let haystack = `${event.title} ${event.description} ${event.organizer}`.toLowerCase();
        return haystack.includes(query);
      });
  }

  @action selectCategory(category) {
    this.activeCategory = category;
  }

  @action setTab(tabId) {
    this.activeTab = tabId;
  }

  @action updateSearch(event) {
    this.searchQuery = event.target.value;
  }
}

export default setComponentTemplate(
  hbs`
    <div class="events-page">
      <AppSidebar />

      <main class="events-main">
        <header class="events-hero">
          <div>
            <h1>Événements</h1>
            <p class="events-sub">Découvrez et participez aux événements de votre réseau</p>
          </div>
          <button class="new-task-btn events-create" type="button">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v14m-7-7h14" />
            </svg>
            Créer un événement
          </button>
        </header>

        <section class="events-controls">
          <div class="events-search">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m21 21-4.35-4.35m0 0A7.5 7.5 0 1 0 5 5a7.5 7.5 0 0 0 11.65 11.65Z" />
            </svg>
            <input
              type="search"
              placeholder="Rechercher un événement..."
              value={{this.searchQuery}}
              {{on "input" this.updateSearch}}
            />
          </div>

          <div class="events-chips">
            {{#each this.categories as |category|}}
              <button
                type="button"
                class={{if (this.isCategory category) "chip-btn active" "chip-btn"}}
                {{on "click" (fn this.selectCategory category)}}
              >
                {{category}}
              </button>
            {{/each}}
          </div>

          <div class="events-tabs">
            {{#each this.tabs as |tab|}}
              <button
                type="button"
                class={{if (this.isTab tab.id) "events-tab active" "events-tab"}}
                {{on "click" (fn this.setTab tab.id)}}
              >
                {{tab.label}}
              </button>
            {{/each}}
          </div>
        </section>

        <section class="events-grid">
          {{#each this.filteredEvents as |event|}}
            <article class="event-card">
              <div class="event-cover">
                <img src={{event.cover}} alt={{event.title}} />
                {{#if event.status}}
                  <span class="event-status">{{event.status}}</span>
                {{/if}}
                {{#if event.badge}}
                  <span class="event-badge">{{event.badge}}</span>
                {{/if}}
              </div>

              <div class="event-body">
                <header class="event-head">
                  <div>
                    <p class="event-title">{{event.title}}</p>
                    <p class="event-desc">{{event.description}}</p>
                  </div>
                </header>

                <div class="event-meta">
                  <div class="event-organizer">
                    <img src="https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=96" alt={{event.organizer}} />
                    <div>
                      <p class="event-host">{{event.organizer}}</p>
                      <p class="event-host-role">{{event.organizerTitle}}</p>
                    </div>
                  </div>

                  <div class="event-details">
                    <div class="event-pill">
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3M4 11h16M5 21h14a2 2 0 0 0 2-2V8H3v11a2 2 0 0 0 2 2Z" /></svg>
                      {{event.date}}
                    </div>
                    <div class="event-pill">
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 2m6-2A9 9 0 1 1 3 12a9 9 0 0 1 18 0Z" /></svg>
                      {{event.time}}
                    </div>
                    <div class="event-pill">
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10.5A2.5 2.5 0 1 1 9.5 8 2.5 2.5 0 0 1 12 10.5Z" /><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19.5 10.5C19.5 16 12 21 12 21s-7.5-5-7.5-10.5a7.5 7.5 0 1 1 15 0Z" /></svg>
                      {{event.location}}
                    </div>
                  </div>

                  <div class="event-bottom">
                    <div class="event-tags">
                      <span class="event-chip">{{event.mode}}</span>
                      <span class="event-chip">{{event.price}}</span>
                      <span class="event-chip">{{event.seats}}</span>
                    </div>
                    <div class="event-actions">
                      <button class="ghost-btn" type="button">Rappels</button>
                      <button class="chip-btn" type="button">Partager</button>
                    </div>
                  </div>
                </div>
              </div>
            </article>
          {{else}}
            <div class="events-empty">Aucun événement pour ces filtres.</div>
          {{/each}}
        </section>
      </main>
    </div>
  `,
  EventsPage
);
