import Component from '@glimmer/component';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';
import { setComponentTemplate } from '@ember/component';
import { hbs } from 'ember-cli-htmlbars';
import AppSidebar from './app-sidebar';

const DEFAULT_POSTS = [
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

class FeaturedPage extends Component {
  tabs = [
    'Tous',
    'Tendances',
    'Mes connexions',
    'Connexions de la semaine',
    'Groupes',
    "Offres d'emploi",
  ];

  @tracked selectedTab = 'Tous';
  @tracked composerType = 'post'; // 'post' | 'poll'
  @tracked composerAttachment = 'text'; // 'text' | 'photo' | 'document'
  @tracked newPostText = '';
  @tracked pollQuestion = '';
  @tracked pollOptions = ['', ''];
  @tracked posts = DEFAULT_POSTS.map((post) => ({ ...post }));

  get isPoll() {
    return this.composerType === 'poll';
  }

  get isPublishDisabled() {
    if (this.isPoll) {
      let hasQuestion = this.pollQuestion.trim().length > 0;
      let optionsCount = this.pollOptions.filter((opt) => opt.trim().length > 0).length;
      return !hasQuestion || optionsCount < 2;
    }

    return this.newPostText.trim().length === 0;
  }

  isTabActive = (tab) => this.selectedTab === tab;

  isTypeActive = (type) => {
    if (type === 'poll') {
      return this.isPoll;
    }

    return !this.isPoll && this.composerAttachment === type;
  };

  @action selectTab(tab) {
    this.selectedTab = tab;
  }

  @action selectType(type) {
    if (type === 'poll') {
      this.composerType = 'poll';
      this.newPostText = '';
      return;
    }

    this.composerType = 'post';
    this.composerAttachment = type;
    this.pollQuestion = '';
    this.pollOptions = ['', ''];
  }

  @action updatePostText(event) {
    this.newPostText = event.target.value;
  }

  @action updatePollQuestion(event) {
    this.pollQuestion = event.target.value;
  }

  @action updatePollOption(index, event) {
    let next = this.pollOptions.map((opt, i) => (i === index ? event.target.value : opt));
    this.pollOptions = next;
  }

  @action handlePollOptionInput(event) {
    let index = Number(event.target.dataset.index);
    if (Number.isNaN(index)) return;
    this.updatePollOption(index, event);
  }

  @action addPollOption() {
    this.pollOptions = [...this.pollOptions, ''];
  }

  @action publishContent() {
    if (this.isPoll) {
      let question = this.pollQuestion.trim();
      let options = this.pollOptions.map((opt) => opt.trim()).filter(Boolean);

      if (!question || options.length < 2) {
        return;
      }

      let newPost = {
        author: 'Sophie Laurent',
        title: 'Cheffe de projet digital • WebMeets',
        time: 'À l’instant',
        text: '',
        tags: ['Sondage'],
        isPoll: true,
        poll: {
          question,
          options,
        },
      };

      this.posts = [newPost, ...this.posts];
      this.resetComposer();
      return;
    }

    let text = this.newPostText.trim();
    if (!text) return;

    let newPost = {
      author: 'Sophie Laurent',
      title: 'Cheffe de projet digital • WebMeets',
      time: 'À l’instant',
      text,
      tags: ['Nouveau'],
      image: null,
    };

    this.posts = [newPost, ...this.posts];
    this.resetComposer();
  }

  resetComposer() {
    this.newPostText = '';
    this.pollQuestion = '';
    this.pollOptions = ['', ''];
    this.composerType = 'post';
    this.composerAttachment = 'text';
  }
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
            {{#if this.isPoll}}
              <input
                type="text"
                class="poll-question"
                placeholder="Titre du sondage..."
                value={{this.pollQuestion}}
                {{on "input" this.updatePollQuestion}}
              />
              <div class="poll-options">
                {{#each this.pollOptions as |opt index|}}
                  <input
                    type="text"
                    placeholder="Option"
                    data-index={{index}}
                    value={{opt}}
                    {{on "input" this.handlePollOptionInput}}
                  />
                {{/each}}
                <button type="button" class="link-btn" {{on "click" this.addPollOption}}>+ Ajouter une option</button>
              </div>
            {{else}}
              <textarea
                placeholder="Partagez une actualité, une idée..."
                rows="2"
                value={{this.newPostText}}
                {{on "input" this.updatePostText}}
              ></textarea>
            {{/if}}
            <div class="post-box-actions">
              <div class="post-box-types">
                <button type="button" class={{if (this.isTypeActive "photo") "active"}} {{on "click" (fn this.selectType "photo")}}>
                  📷 Photo
                </button>
                <button type="button" class={{if (this.isTypeActive "document") "active"}} {{on "click" (fn this.selectType "document")}}>
                  📄 Document
                </button>
                <button type="button" class={{if (this.isTypeActive "poll") "active"}} {{on "click" (fn this.selectType "poll")}}>
                  📊 Sondage
                </button>
              </div>
              <button class="publish-btn" type="button" disabled={{this.isPublishDisabled}} {{on "click" this.publishContent}}>
                Publier
              </button>
            </div>
          </div>
        </section>

        <div class="tab-bar">
          {{#each this.tabs as |tab index|}}
            <button
              type="button"
              class={{if (this.isTabActive tab) "tab-btn active" "tab-btn"}}
              {{on "click" (fn this.selectTab tab)}}
            >
              {{tab}}
            </button>
          {{/each}}
        </div>

        <section class="feed-list">
          {{#if this.posts.length}}
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

              {{#if post.isPoll}}
                <div class="poll-block">
                  <p class="feed-body">{{post.poll.question}}</p>
                  <div class="poll-options-list">
                    {{#each post.poll.options as |opt|}}
                      <div class="poll-option">
                        <span>{{opt}}</span>
                        <button type="button" class="chip-btn">Voter</button>
                      </div>
                    {{/each}}
                  </div>
                </div>
              {{else}}
                <p class="feed-body">{{post.text}}</p>
              {{/if}}

              {{#if post.tags}}
                <div class="feed-tags">
                  {{#each post.tags as |tag|}}
                    <span class="tag">#{{tag}}</span>
                  {{/each}}
                </div>
              {{/if}}

              {{#if post.image}}
                <div class="feed-image">
                  <img src="{{post.image}}" alt="Illustration" />
                </div>
              {{/if}}
            </article>
            {{/each}}
          {{else}}
            <p class="empty-state">Aucune publication pour le moment.</p>
          {{/if}}
        </section>
      </main>
    </div>
  `,
  FeaturedPage
);
