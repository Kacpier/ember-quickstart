import Component from '@glimmer/component';
import { setComponentTemplate } from '@ember/component';
import { hbs } from 'ember-cli-htmlbars';
import AppSidebar from './app-sidebar';

class FeaturedPage extends Component {
  tabs = [
    'Tous',
    'Tendances',
    'Mes connexions',
    'Connexions de la semaine',
    'Groupes',
    "Offres d'emploi",
  ];

  posts = [
    {
      author: 'Sophie Laurent',
      title: 'Cheffe de projet digital • TechCorp',
      time: 'Il y a 2h',
      text:
        "Excellente conférence sur l'IA et l'avenir du travail ! Les opportunités sont immenses pour notre secteur. Qui était présent ? 🚀",
      tags: ['IA', 'Innovation', 'Futur du travail'],
      image:
        'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=1200&auto=format&fit=crop&q=80',
    },
    {
      author: 'Thomas Martin',
      title: 'Développeur Full Stack • OpenSourceLab',
      time: 'Il y a 5h',
      text: 'Nouveau projet open source ! Venez contribuer sur GitHub 🤖',
      tags: ['Open Source', 'Dev', 'Collaboration'],
      image:
        'https://images.unsplash.com/photo-1516117172878-fd2c41f4a759?w=1200&auto=format&fit=crop&q=80',
    },
  ];
}

export default setComponentTemplate(
  hbs`
    <div class="featured-page">
      <AppSidebar />

      <main class="featured-main">
        <header class="featured-hero">
          <h1>À la une</h1>
          <p>Découvrez les dernières actualités de votre réseau</p>
        </header>

        <section class="post-box">
          <div class="post-box-avatar">
            <img src="https://images.unsplash.com/photo-1629507208649-70919ca33793?w=200" alt="Sophie Laurent" />
          </div>
          <div class="post-box-body">
            <textarea placeholder="Partagez une actualité, une idée..." rows="2"></textarea>
            <div class="post-box-actions">
              <div class="post-box-types">
                <button type="button">
                  📷 Photo
                </button>
                <button type="button">
                  📄 Document
                </button>
                <button type="button">
                  📊 Sondage
                </button>
              </div>
              <button class="publish-btn" type="button">Publier</button>
            </div>
          </div>
        </section>

        <div class="tab-bar">
          {{#each this.tabs as |tab index|}}
            <button
              type="button"
              class="tab-btn"
            >
              {{tab}}
            </button>
          {{/each}}
        </div>

        <section class="feed-list">
          {{#each this.posts as |post|}}
            <article class="feed-card">
              <header class="feed-card-head">
                <div class="feed-author">
                  <img src="https://images.unsplash.com/photo-1629507208649-70919ca33793?w=100" alt="{{post.author}}" />
                  <div>
                    <p class="feed-name">{{post.author}}</p>
                    <p class="feed-role">{{post.title}}</p>
                    <p class="feed-time">{{post.time}}</p>
                  </div>
                </div>
                <button class="dots-btn" type="button">···</button>
              </header>

              <p class="feed-body">{{post.text}}</p>

              <div class="feed-tags">
                {{#each post.tags as |tag|}}
                  <span class="tag">#{{tag}}</span>
                {{/each}}
              </div>

              <div class="feed-image">
                <img src="{{post.image}}" alt="Illustration" />
              </div>
            </article>
          {{/each}}
        </section>
      </main>
    </div>
  `,
  FeaturedPage
);
