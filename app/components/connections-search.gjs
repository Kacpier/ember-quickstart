import Component from '@glimmer/component';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';
import { setComponentTemplate } from '@ember/component';
import { hbs } from 'ember-cli-htmlbars';

class ConnectionsSearch extends Component {
  @tracked query = this.args.initialQuery ?? '';

  get placeholderText() {
    return this.args.placeholder ?? "Rechercher dans votre réseau...";
  }

  profiles = [
    {
      id: 'emma-petit',
      name: 'Emma Petit',
      title: 'Marketing Manager',
      company: 'Growth Agency',
      focus: 'Stratégie digitale · Brand content',
      avatar: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=120',
    },
    {
      id: 'thomas-martin',
      name: 'Thomas Martin',
      title: 'Développeur Full Stack',
      company: 'OpenSourceLab',
      focus: 'Node.js · React · API',
      avatar: 'https://images.unsplash.com/photo-1527980965255-d3b416303d12?w=120',
    },
    {
      id: 'marie-dubois',
      name: 'Marie Dubois',
      title: 'Designer UX/UI',
      company: 'Creative Studio',
      focus: 'Design systems · Accessibilité',
      avatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=120',
    },
  ];

  companies = [
    {
      id: 'moon-labs',
      name: 'Moon Labs',
      sector: 'Produit · SaaS',
      focus: 'Gestion de produits numériques',
      members: 128,
    },
    {
      id: 'qualityfirst',
      name: 'QualityFirst',
      sector: 'QA · Automation',
      focus: 'Tests E2E et fiabilité',
      members: 86,
    },
    {
      id: 'growth-agency',
      name: 'Growth Agency',
      sector: 'Marketing',
      focus: 'Acquisition · Brand content',
      members: 210,
    },
  ];

  interests = [
    { id: 'agile', label: 'Méthodes agiles', description: 'Scrum, Kanban, pilotage produit' },
    { id: 'cloud', label: 'Cloud & DevOps', description: 'Kubernetes, CI/CD, observabilité' },
    { id: 'design', label: 'Design systems', description: 'UI kits, tokens, accessibilité' },
  ];

  get normalizedQuery() {
    return this.query.trim().toLowerCase();
  }

  get hasQuery() {
    return this.normalizedQuery.length > 0;
  }

  get showResultsBlock() {
    return Boolean(this.args.showResults) && this.hasQuery;
  }

  filterItems(list, fields) {
    let q = this.normalizedQuery;
    if (!q) return list;

    return list.filter((item) =>
      fields.some((key) =>
        String(item[key] ?? '')
          .toLowerCase()
          .includes(q)
      )
    );
  }

  get filteredProfiles() {
    return this.filterItems(this.profiles, ['name', 'title', 'company', 'focus']);
  }

  get filteredCompanies() {
    return this.filterItems(this.companies, ['name', 'sector', 'focus']);
  }

  get filteredInterests() {
    return this.filterItems(this.interests, ['label', 'description']);
  }

  get totalResults() {
    return this.filteredProfiles.length + this.filteredCompanies.length + this.filteredInterests.length;
  }

  @action updateQuery(eventOrValue) {
    let value = typeof eventOrValue === 'string' ? eventOrValue : eventOrValue?.target?.value ?? '';
    this.query = value;

    if (typeof this.args.onQuery === 'function') {
      this.args.onQuery(value);
    }
  }

  @action clearQuery() {
    this.updateQuery('');
  }
}

export default setComponentTemplate(
  hbs`
    <div class={{if @sticky "search-section search-sticky" "search-section"}}>
      <div class="search-top">
        <div>
          <h2 class="search-title">Trouvez des profils, entreprises ou centres d'intérêt</h2>
          <p class="search-subtitle">Saisissez un mot-clé pour découvrir de nouvelles connexions</p>
        </div>
      </div>

      <div class="search-bar">
        <div class="search-input">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m21 21-4.35-4.35m0 0A7.5 7.5 0 1 0 5 5a7.5 7.5 0 0 0 11.65 11.65Z" />
          </svg>
          <input
            type="search"
            placeholder={{this.placeholderText}}
            value={{this.query}}
            {{on "input" this.updateQuery}}
          />
          {{#if this.query}}
            <button class="search-clear" type="button" {{on "click" this.clearQuery}}>Effacer</button>
          {{/if}}
        </div>

      </div>

      {{#if this.showResultsBlock}}
        <div class="search-results">
          <section class="search-group">
            <header class="search-group-head">
              <p class="search-group-title">Profils correspondants</p>
              <span class="search-group-count">{{this.filteredProfiles.length}}</span>
            </header>

            {{#if this.filteredProfiles.length}}
              <div class="search-cards">
                {{#each this.filteredProfiles as |profile|}}
                  <article class="search-card">
                    <div class="search-avatar">
                      <img src={{profile.avatar}} alt={{profile.name}} />
                    </div>
                    <div class="search-card-body">
                      <p class="search-name">{{profile.name}}</p>
                      <p class="search-meta">{{profile.title}}</p>
                    </div>
                    <div class="search-actions">
                      <button class="chip-btn" type="button">Inviter</button>
                      <button class="ghost-btn" type="button">Message</button>
                    </div>
                  </article>
                {{/each}}
              </div>
            {{else}}
              <p class="search-empty">Aucun profil pour cette recherche.</p>
            {{/if}}
          </section>

          <section class="search-group">
            <header class="search-group-head">
              <p class="search-group-title">Entreprises & pages</p>
              <span class="search-group-count">{{this.filteredCompanies.length}}</span>
            </header>

            {{#if this.filteredCompanies.length}}
              <div class="search-cards">
                {{#each this.filteredCompanies as |company|}}
                  <article class="search-card compact">
                    <div class="search-icon-box">
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 21V8l9-6 9 6v13H3Z" />
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 21v-7h6v7" />
                      </svg>
                    </div>
                    <div class="search-card-body">
                      <p class="search-name">{{company.name}}</p>
                      <p class="search-meta">{{company.sector}}</p>
                      <p class="search-desc">{{company.focus}}</p>
                    </div>
                    <div class="search-actions">
                      <button class="ghost-btn" type="button">Suivre ({{company.members}})</button>
                    </div>
                  </article>
                {{/each}}
              </div>
            {{else}}
              <p class="search-empty">Aucune entreprise trouvée.</p>
            {{/if}}
          </section>

          <section class="search-group">
            <header class="search-group-head">
              <p class="search-group-title">Centres d'intérêt</p>
              <span class="search-group-count">{{this.filteredInterests.length}}</span>
            </header>

            {{#if this.filteredInterests.length}}
              <div class="search-cards pills">
                {{#each this.filteredInterests as |interest|}}
                  <article class="search-card pill-row">
                    <div>
                      <p class="search-name">{{interest.label}}</p>
                      <p class="search-desc">{{interest.description}}</p>
                    </div>
                    <div class="search-actions">
                      <button class="chip-btn" type="button">Suivre</button>
                    </div>
                  </article>
                {{/each}}
              </div>
            {{else}}
              <p class="search-empty">Aucun centre d'intérêt correspondant.</p>
            {{/if}}
          </section>
        </div>
      {{/if}}
    </div>
  `,
  ConnectionsSearch
);
