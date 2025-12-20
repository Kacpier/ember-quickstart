import Component from '@glimmer/component';
import { setComponentTemplate } from '@ember/component';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';
import { hbs } from 'ember-cli-htmlbars';
import { connections as networkConnections } from '../data/connections';
import AppSidebar from './app-sidebar';

const CREATOR_AVATAR = 'https://images.unsplash.com/photo-1550525811-e5869dd03032?w=80';

const EMPTY_FORM = {
  title: '',
  desc: '',
  column: 'À faire',
  priority: 'Moyenne',
  date: "Aujourd'hui",
  assignees: [],
  assigneeInput: '',
};

const DEFAULT_TASKS = {
  'À faire': [
    {
      priority: 'Haute',
      priorityClass: 'haute',
      title: 'Conception UI du dashboard',
      desc: 'Créer les maquettes pour le nouveau tableau de bord',
      date: '15 Nov',
      comments: 3,
      files: 2,
      assignees: [networkConnections[0]],
    },
    {
      priority: 'Moyenne',
      priorityClass: 'moyenne',
      title: 'Rédiger documentation API',
      desc: 'Documenter les nouveaux endpoints REST',
      date: '18 Nov',
      comments: 0,
      files: 1,
      assignees: [networkConnections[1]],
    },
  ],
  'En cours': [
    {
      priority: 'Haute',
      priorityClass: 'haute',
      title: 'Développement composant React',
      desc: 'Créer le composant de notification réutilisable',
      date: '14 Nov',
      comments: 5,
      files: 1,
      assignees: [networkConnections[2]],
    },
    {
      priority: 'Moyenne',
      priorityClass: 'moyenne',
      title: 'Tests unitaires backend',
      desc: 'Augmenter la couverture de tests à 80%',
      date: '16 Nov',
      comments: 2,
      files: 0,
      assignees: [],
    },
    {
      priority: 'Basse',
      priorityClass: 'basse',
      title: 'Optimisation performances',
      desc: 'Améliorer le temps de chargement des pages',
      date: '19 Nov',
      comments: 1,
      files: 0,
      assignees: [networkConnections[3]],
    },
  ],
  'En révision': [
    {
      priority: 'Haute',
      priorityClass: 'haute',
      title: 'Code review auth',
      desc: "Revoir l'implémentation des règles d'authentification",
      date: '17 Nov',
      comments: 4,
      files: 1,
      assignees: [],
    },
    {
      priority: 'Moyenne',
      priorityClass: 'moyenne',
      title: 'Contenus onboarding',
      desc: "Valider les textes d'onboarding utilisateur",
      date: '18 Nov',
      comments: 1,
      files: 0,
      assignees: [networkConnections[4]],
    },
  ],
  'Terminées': [
    {
      priority: 'Basse',
      priorityClass: 'basse',
      title: 'Nettoyage backlog',
      desc: 'Archiver les anciens tickets résolus',
      date: '12 Nov',
      comments: 0,
      files: 0,
      assignees: [],
    },
  ],
};

class TasksBoard extends Component {
  @tracked showModal = false;
  @tracked assigneeQuery = '';
  @tracked showAssigneeSuggestions = false;

  @tracked form = { ...EMPTY_FORM };

  @tracked tasks = DEFAULT_TASKS;

  creatorAvatar = CREATOR_AVATAR;

  get filteredAssignees() {
    let query = this.assigneeQuery.trim();
    let pool = networkConnections.filter((contact) => !this.form.assignees.some((a) => a.id === contact.id));
    if (!query) return pool;

    let lower = query.toLowerCase();
    return pool.filter((contact) => {
      let haystack = `${contact.name} ${contact.title}`.toLowerCase();
      return haystack.includes(lower);
    });
  }

  get columns() {
    return [
      { title: 'À faire', count: this.tasks['À faire']?.length || 0, tint: 'col-grey' },
      { title: 'En cours', count: this.tasks['En cours']?.length || 0, tint: 'col-blue' },
      { title: 'En révision', count: this.tasks['En révision']?.length || 0, tint: 'col-yellow' },
      { title: 'Terminées', count: this.tasks['Terminées']?.length || 0, tint: 'col-green' },
    ];
  }

  @action openModal() {
    this.form = { ...EMPTY_FORM };
    this.assigneeQuery = '';
    this.showAssigneeSuggestions = false;
    this.showModal = true;
  }

  @action closeModal() {
    this.showModal = false;
    this.showAssigneeSuggestions = false;
  }

  @action stopPropagation(event) {
    event.stopPropagation();
  }

  @action updateField(field, event) {
    this.form = { ...this.form, [field]: event.target.value };
  }

  @action handleAssigneeInput(event) {
    let value = event.target.value || '';
    let atIndex = value.indexOf('@');
    let query = atIndex >= 0 ? value.slice(atIndex + 1).trim() : '';

    let nextForm = { ...this.form, assigneeInput: value };

    if (!value.includes('@')) {
      nextForm.assignees = [...this.form.assignees];
      this.assigneeQuery = '';
      this.showAssigneeSuggestions = false;
    } else {
      this.assigneeQuery = query.toLowerCase();
      this.showAssigneeSuggestions = true;
    }

    this.form = nextForm;
  }

  @action selectAssignee(contact) {
    let already = this.form.assignees.some((a) => a.id === contact.id);
    let nextAssignees = already ? this.form.assignees : [...this.form.assignees, contact];

    this.form = { ...this.form, assignees: nextAssignees, assigneeInput: '' };
    this.assigneeQuery = '';
    this.showAssigneeSuggestions = false;
  }

  @action submitTask(event) {
    event.preventDefault();

    const title = this.form.title?.trim();
    if (!title) {
      return;
    }

    const priorityMap = {
      Haute: 'haute',
      Moyenne: 'moyenne',
      Basse: 'basse',
    };

    const column = this.form.column;
    const nextTask = {
      priority: this.form.priority,
      priorityClass: priorityMap[this.form.priority] || 'moyenne',
      title,
      desc: this.form.desc || 'À définir',
      date: this.form.date || "Aujourd'hui",
      comments: 0,
      files: 0,
      assignees: this.form.assignees,
    };

    const updatedColumnTasks = [...(this.tasks[column] || []), nextTask];
    this.tasks = { ...this.tasks, [column]: updatedColumnTasks };
    this.showModal = false;
  }
}

export default setComponentTemplate(
  hbs`
    <div class="tasks-page">
      <AppSidebar />

      <main class="tasks-main">
        <header class="tasks-hero">
          <div>
            <h1>Gestion des tâches</h1>
            <p>Organisez votre travail avec le Kanban</p>
          </div>
          <button class="new-task-btn" type="button" {{on "click" this.openModal}}>＋ Nouvelle tâche</button>
        </header>

        <section class="kanban-grid">
          {{#each this.columns as |col|}}
            <article class="kanban-col {{col.tint}}">
              <header class="kanban-head">
                <div class="kanban-title">
                  <p>{{col.title}}</p>
                  <span class="badge">{{col.count}}</span>
                </div>
                <button type="button" class="icon-btn">＋</button>
              </header>

              <div class="kanban-cards">
                {{#each (get this.tasks col.title) as |task|}}
                  <div class="task-card">
                    <div class="task-card-top">
                      <span class="pill {{task.priorityClass}}">{{task.priority}}</span>
                      <button class="icon-btn" type="button">⋮</button>
                    </div>
                    <h3 class="task-title">{{task.title}}</h3>
                    <p class="task-desc">{{task.desc}}</p>
                    <div class="task-meta">
                      <div class="meta-left">
                        <div class="assignee-avatars">
                          {{#if task.assignees.length}}
                            {{#each task.assignees as |person|}}
                              <img src={{person.avatar}} alt={{person.name}} />
                            {{/each}}
                          {{else}}
                            <img src={{this.creatorAvatar}} alt="Créateur" />
                          {{/if}}
                        </div>
                        <span class="meta-date">
                          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3M3 11h18M5 21h14a2 2 0 002-2V7H3v12a2 2 0 002 2z"/></svg>
                          {{task.date}}
                        </span>
                      </div>
                      <div class="meta-right">
                        <span class="meta-icon">
                          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M4 5h16a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8l-4 3V6a1 1 0 0 1 1-1z" />
                          </svg>
                          {{task.comments}}
                        </span>
                        <span class="meta-icon">
                          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828L18 9.828V7h-2.828z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 5l3 3"/></svg>
                          {{task.files}}
                        </span>
                      </div>
                    </div>
                  </div>
                {{/each}}
              </div>
            </article>
          {{/each}}
        </section>

        {{#if this.showModal}}
          <div class="modal-backdrop" role="presentation" {{on "click" this.closeModal}}>
            <div class="modal-window" role="dialog" aria-modal="true" {{on "click" this.stopPropagation}}>
              <header class="modal-header">
                <div>
                  <p class="modal-label">Nouvelle tâche</p>
                  <h2>Ajouter une carte</h2>
                  <p class="modal-subtitle">Titre obligatoire, le reste est optionnel.</p>
                </div>
                <button class="modal-close" type="button" aria-label="Fermer" {{on "click" this.closeModal}}>×</button>
              </header>

              <form {{on "submit" this.submitTask}}>
                <div class="modal-field">
                  <label for="task-title">Titre</label>
                  <input id="task-title" required value={{this.form.title}} {{on "input" (fn this.updateField "title")}} placeholder="Résumé de la tâche" />
                </div>

                <div class="modal-field">
                  <label for="task-desc">Description</label>
                  <textarea id="task-desc" rows="3" value={{this.form.desc}} {{on "input" (fn this.updateField "desc")}} placeholder="Détails rapides"></textarea>
                </div>

                <div class="modal-field assignee-field">
                  <label for="task-assignee">Assigner à</label>
                  <div class="assignee-input">
                    {{#if this.form.assignees.length}}
                      <div class="assignee-selected">
                        {{#each this.form.assignees as |person|}}
                          <span class="assignee-chip">{{person.name}}</span>
                        {{/each}}
                      </div>
                    {{/if}}
                    <input
                      id="task-assignee"
                      autocomplete="off"
                      placeholder="Tapez @ pour chercher un contact"
                      value={{this.form.assigneeInput}}
                      {{on "input" this.handleAssigneeInput}}
                    />

                    {{#if this.showAssigneeSuggestions}}
                      {{#if this.filteredAssignees.length}}
                        <ul class="assignee-list">
                          {{#each this.filteredAssignees as |contact|}}
                            <li class="assignee-item" {{on "click" (fn this.selectAssignee contact)}}>
                              <img src={{contact.avatar}} alt={{contact.name}} />
                              <div>
                                <p class="assignee-name">{{contact.name}}</p>
                                <p class="assignee-meta">{{contact.title}}</p>
                              </div>
                            </li>
                          {{/each}}
                        </ul>
                      {{else}}
                        <div class="assignee-empty">Aucun contact trouvé</div>
                      {{/if}}
                    {{/if}}
                  </div>
                </div>

                <div class="modal-grid">
                  <div class="modal-field">
                    <label for="task-column">Colonne</label>
                    <select id="task-column" value={{this.form.column}} {{on "change" (fn this.updateField "column")}}>
                      <option>À faire</option>
                      <option>En cours</option>
                      <option>En révision</option>
                      <option>Terminées</option>
                    </select>
                  </div>

                  <div class="modal-field">
                    <label for="task-priority">Priorité</label>
                    <select id="task-priority" value={{this.form.priority}} {{on "change" (fn this.updateField "priority")}}>
                      <option>Haute</option>
                      <option>Moyenne</option>
                      <option>Basse</option>
                    </select>
                  </div>

                  <div class="modal-field">
                    <label for="task-date">Date</label>
                    <input id="task-date" value={{this.form.date}} {{on "input" (fn this.updateField "date")}} placeholder="12 Nov" />
                  </div>
                </div>

                <div class="modal-actions">
                  <button class="btn-secondary" type="button" {{on "click" this.closeModal}}>Annuler</button>
                  <button class="btn-primary" type="submit">Créer</button>
                </div>
              </form>
            </div>
          </div>
        {{/if}}
      </main>
    </div>
  `,
  TasksBoard
);
