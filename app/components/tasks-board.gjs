import Component from '@glimmer/component';
import { setComponentTemplate } from '@ember/component';
import { hbs } from 'ember-cli-htmlbars';
import AppSidebar from './app-sidebar';

class TasksBoard extends Component {
  columns = [
    { title: 'À faire', count: 2, tint: 'col-grey' },
    { title: 'En cours', count: 3, tint: 'col-blue' },
    { title: 'En révision', count: 2, tint: 'col-yellow' },
    { title: 'Terminées', count: 1, tint: 'col-green' },
  ];

  tasks = {
    'À faire': [
      {
        priority: 'Haute',
        priorityClass: 'haute',
        title: 'Conception UI du dashboard',
        desc: 'Créer les maquettes pour le nouveau tableau de bord',
        date: '15 Nov',
        comments: 3,
        files: 2,
      },
      {
        priority: 'Moyenne',
        priorityClass: 'moyenne',
        title: 'Rédiger documentation API',
        desc: 'Documenter les nouveaux endpoints REST',
        date: '18 Nov',
        comments: 0,
        files: 1,
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
      },
      {
        priority: 'Moyenne',
        priorityClass: 'moyenne',
        title: 'Tests unitaires backend',
        desc: 'Augmenter la couverture de tests à 80%',
        date: '16 Nov',
        comments: 2,
        files: 0,
      },
      {
        priority: 'Basse',
        priorityClass: 'basse',
        title: 'Optimisation performances',
        desc: 'Améliorer le temps de chargement des pages',
        date: '19 Nov',
        comments: 1,
        files: 0,
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
      },
      {
        priority: 'Moyenne',
        priorityClass: 'moyenne',
        title: 'Contenus onboarding',
        desc: "Valider les textes d'onboarding utilisateur",
        date: '18 Nov',
        comments: 1,
        files: 0,
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
      },
    ],
  };
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
          <button class="new-task-btn" type="button">＋ Nouvelle tâche</button>
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
                        <img src="https://images.unsplash.com/photo-1629507208649-70919ca33793?w=80" alt="avatar" />
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
      </main>
    </div>
  `,
  TasksBoard
);
