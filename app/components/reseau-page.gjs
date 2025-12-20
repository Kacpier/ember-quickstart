import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { setComponentTemplate } from '@ember/component';
import { hbs } from 'ember-cli-htmlbars';
import { service } from '@ember/service';
import { connections as networkConnections, invitations as networkInvitations, suggestions as networkSuggestions } from '../data/connections';
import AppSidebar from './app-sidebar';

class ReseauPage extends Component {
  @service router;

  segments = ['Connexions', 'Invitations', 'Suggestions'];

  @tracked selectedTab = 'Connexions';
  @tracked searchQuery = '';

  connections = networkConnections;
  invitations = networkInvitations;
  suggestions = networkSuggestions;

  get summaryCards() {
    return [
      { label: 'Connexions', value: this.connections.length, icon: 'users' },
      { label: 'Invitations en attente', value: this.invitations.length, icon: 'invites' },
      { label: 'Suggestions', value: this.suggestions.length, icon: 'suggestions' },
    ];
  }

  get currentList() {
    return this.listForTab(this.selectedTab);
  }

  get filteredConnections() {
    let query = this.searchQuery.trim().toLowerCase();
    if (!query) return this.connections;

    return this.connections.filter((conn) => {
      let haystack = `${conn.name} ${conn.title} ${conn.company}`.toLowerCase();
      return haystack.includes(query);
    });
  }

  get filteredSuggestions() {
    let query = this.searchQuery.trim().toLowerCase();
    if (!query) return this.suggestions;

    return this.suggestions.filter((conn) => {
      let haystack = `${conn.name} ${conn.title} ${conn.company}`.toLowerCase();
      return haystack.includes(query);
    });
  }

  get filteredInvitations() {
    let query = this.searchQuery.trim().toLowerCase();
    if (!query) return this.invitations;

    return this.invitations.filter((conn) => {
      let haystack = `${conn.name} ${conn.title} ${conn.company}`.toLowerCase();
      return haystack.includes(query);
    });
  }

  listForTab(tab) {
    switch (tab) {
      case 'Suggestions':
        return this.filteredSuggestions;
      case 'Invitations':
        return this.filteredInvitations;
      default:
        return this.filteredConnections;
    }
  }

  isSelected = (segment) => this.selectedTab === segment;

  isUsers = (icon) => icon === 'users';

  isInvites = (icon) => icon === 'invites';

  @action selectTab(tab) {
    this.selectedTab = tab;
  }

  @action updateSearch(event) {
    this.searchQuery = event.target.value;
  }

  @action message() {
    this.router.transitionTo('messages');
  }

  @action openProfile(id) {
    this.router.transitionTo('profiles.profile', id);
  }
}

export default setComponentTemplate(
  hbs`
    <div class="reseau-page">
      <AppSidebar />

      <main class="reseau-main">
        <header class="reseau-hero">
          <div>
            <h1>Mon Réseau</h1>
            <p class="reseau-sub">Gérez vos connexions professionnelles</p>
          </div>
        </header>

        <section class="reseau-stats">
          {{#each this.summaryCards as |card|}}
            <article class="reseau-stat-card">
              <div class="stat-icon-box">
                {{#if (this.isUsers card.icon)}}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2" /><circle cx="9" cy="7" r="4" stroke-width="2" /><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M22 21v-2a4 4 0 0 0-3-3.87" /><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 3.13a4 4 0 0 1 0 7.75" /></svg>
                {{else if (this.isInvites card.icon)}}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8h2a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-7a2 2 0 0 1 2-2h2" /><rect x="7" y="3" width="10" height="5" rx="1" ry="1" stroke-width="2" /><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m12 11 3 3-3 3m-3-3h6" /></svg>
                {{else}}
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6l4 2" /><circle cx="12" cy="12" r="9" stroke-width="2" /></svg>
                {{/if}}
              </div>
              <div>
                <p class="stat-label">{{card.label}}</p>
                <p class="stat-value-lg">{{card.value}}</p>
              </div>
            </article>
          {{/each}}
        </section>

        <section class="reseau-filters">
          <div class="reseau-search">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m21 21-4.35-4.35m0 0A7.5 7.5 0 1 0 5 5a7.5 7.5 0 0 0 11.65 11.65Z" /></svg>
            <input
              type="text"
              placeholder="Rechercher dans votre réseau..."
              value={{this.searchQuery}}
              {{on "input" this.updateSearch}}
            />
          </div>

          <div class="reseau-tabs">
            {{#each this.segments as |segment|}}
              <button
                type="button"
                class={{if (this.isSelected segment) "reseau-tab active" "reseau-tab"}}
                {{on "click" (fn this.selectTab segment)}}
              >
                {{segment}}
              </button>
            {{/each}}
          </div>
        </section>

        <section class="reseau-list">
          <header class="reseau-list-head">
            <p class="list-title">Vos {{this.selectedTab}}</p>
            <p class="list-count">{{this.currentList.length}} résultats</p>
          </header>

          <div class="reseau-cards">
            {{#each this.currentList as |conn|}}
              <article class="reseau-card">
                <div class="reseau-left">
                  <img src={{conn.avatar}} alt={{conn.name}} />
                  <div>
                    <p class="conn-name">{{conn.name}}</p>
                    <p class="conn-role">{{conn.title}}</p>
                    <p class="conn-meta">{{conn.company}}</p>
                    <p class="conn-stats">{{conn.connections}} connexions</p>
                  </div>
                </div>

                <div class="reseau-right">
                  <button type="button" class="ghost-btn" {{on "click" this.message}}>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 15a2 2 0 0 1-2 2H8l-5 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2Z" /></svg>
                    Message
                  </button>
                  <button type="button" class="chip-btn">Profil</button>
                </div>
              </article>
            {{else}}
              <div class="reseau-empty">Aucun résultat pour cette vue.</div>
            {{/each}}
          </div>
        </section>
      </main>
    </div>
  `,
  ReseauPage
);
