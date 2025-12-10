import Component from '@glimmer/component';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';
import { setComponentTemplate } from '@ember/component';
import { hbs } from 'ember-cli-htmlbars';
import AppSidebar from './app-sidebar';

const DEFAULT_POSTS = [
  {
    author: 'Emma Petit',
    title: 'Marketing Manager • Growth Agency',
    time: 'Il y a 1 j',
    text:
      'Nouvelle stratégie de contenu pour 2024 ! Focus sur l’authenticité et l’engagement communautaire. Quelles sont vos meilleures pratiques ? 📢',
    tags: ['Marketing', 'Stratégie', 'Contenu'],
    likes: 35,
    commentsCount: 12,
    shares: 8,
    liked: false,
  },
  {
    author: 'Paul Rousseau',
    title: 'DevOps Engineer • Cloud Systems',
    time: 'Il y a 4 j',
    text:
      'Migration réussie vers Kubernetes ! Le déploiement est maintenant 3x plus rapide. Voici les leçons apprises… 🚀',
    tags: ['DevOps', 'Kubernetes', 'Cloud'],
    likes: 28,
    commentsCount: 9,
    shares: 6,
    liked: false,
  },
  {
    author: 'Julie Moreau',
    title: 'UX Researcher',
    time: 'Il y a 12 j',
    text:
      'Webinaire gratuit sur la recherche utilisateur ! Inscrivez-vous maintenant pour les dernières places disponibles. 🎯',
    tags: ['UX', 'Formation', 'Webinaire', 'Événement'],
    likes: 45,
    commentsCount: 18,
    shares: 15,
    liked: false,
  },
  {
    author: 'Marie Dubois',
    title: 'Responsable RH • Innovate Inc',
    time: 'Il y a 14 j',
    text:
      'Nous recherchons un UX Designer passionné(e) pour rejoindre notre équipe ! CDI, remote possible. Expérience en design thinking requise. Postulez dès maintenant ! 👋',
    tags: ['Recrutement', 'UX Design', 'Remote', "Offre d'emploi"],
    likes: 18,
    commentsCount: 6,
    shares: 22,
    liked: false,
  },
  {
    author: 'Lucas Bernard',
    title: 'Product Manager',
    time: 'Il y a 16 j',
    text: '',
    tags: ['Agilité', 'Management', 'Productivité'],
    isPoll: true,
    poll: {
      question: 'Quelle méthodologie agile préférez-vous pour gérer vos projets ?',
      options: ['Scrum', 'Kanban', 'Lean', 'Autre'],
    },
    likes: 12,
    commentsCount: 23,
    shares: 2,
    liked: false,
  },
  {
    author: 'Sophie Laurent',
    title: 'Cheffe de projet digital • TechCorp',
    time: 'Il y a 2h',
    text:
      "Excellente conférence sur l'IA et l'avenir du travail ! Les opportunités sont immenses pour notre secteur. Qui était présent ? 🚀",
    tags: ['IA', 'Innovation', 'Futur du travail'],
    image:
      'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=1200&auto=format&fit=crop&q=80',
    likes: 24,
    commentsCount: 8,
    comments: [
      { author: 'Thomas', text: 'J’y étais, super keynote !', time: 'Il y a 1h' },
      { author: 'Marie', text: 'Les démos étaient incroyables.', time: 'Il y a 30min' },
    ],
    shares: 3,
    liked: false,
  },
  {
    author: 'Thomas Martin',
    title: 'Développeur Full Stack • OpenSourceLab',
    time: 'Il y a 5h',
    text: 'Nouveau projet open source ! Venez contribuer sur GitHub 🤖',
    tags: ['Open Source', 'Dev', 'Collaboration'],
    image:
      'https://images.unsplash.com/photo-1516117172878-fd2c41f4a759?w=1200&auto=format&fit=crop&q=80',
    likes: 12,
    commentsCount: 2,
    comments: [
      { author: 'Sophie', text: 'Hâte de contribuer !', time: 'Il y a 3h' },
    ],
    shares: 1,
    liked: false,
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

  postIdCounter = DEFAULT_POSTS.length;

  @tracked selectedTab = 'Tous';
  @tracked composerType = 'post'; // 'post' | 'poll'
  @tracked composerAttachment = 'text'; // 'text' | 'photo' | 'document'
  @tracked newPostText = '';
  @tracked pollQuestion = '';
  @tracked pollOptions = ['', ''];
  @tracked posts = DEFAULT_POSTS.map((post, index) => this.normalizePost(post, index));

  normalizePost(post, index) {
    let isPoll = Boolean(post.isPoll);
    let pollOptionsCount = isPoll ? post.poll?.options?.length ?? 0 : 0;
    let pollVotes = isPoll
      ? Array.from({ length: pollOptionsCount }, (_, i) => post.pollVotes?.[i] ?? 0)
      : [];

    return {
      ...post,
      id: post.id ?? `default-post-${index}`,
      comments: post.comments ?? [],
      draftComment: post.draftComment ?? '',
      isCommenting: post.isCommenting ?? false,
      pollVotes,
      hasVoted: post.hasVoted ?? false,
      votedOption: typeof post.votedOption === 'number' ? post.votedOption : null,
    };
  }

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

      let newPost = this.normalizePost(
        {
          id: `post-${this.postIdCounter++}`,
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
          likes: 0,
          commentsCount: 0,
          shares: 0,
          liked: false,
        },
        this.postIdCounter
      );

      this.posts = [newPost, ...this.posts];
      this.resetComposer();
      return;
    }

    let text = this.newPostText.trim();
    if (!text) return;

    let newPost = this.normalizePost(
      {
        id: `post-${this.postIdCounter++}`,
        author: 'Sophie Laurent',
        title: 'Cheffe de projet digital • WebMeets',
        time: 'À l’instant',
        text,
        tags: ['Nouveau'],
        image: null,
        likes: 0,
        commentsCount: 0,
        shares: 0,
        liked: false,
      },
      this.postIdCounter
    );

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

  commentCount(post) {
    let listCount = Array.isArray(post.comments) ? post.comments.length : 0;
    return listCount || post.commentsCount || 0;
  }

  isOptionSelected(post, optionIndex) {
    return post?.votedOption === optionIndex;
  }

  @action toggleLike(index) {
    let next = this.posts.map((post, i) => {
      if (i !== index) return post;
      let liked = !post.liked;
      let likes = liked ? post.likes + 1 : Math.max(0, post.likes - 1);
      return { ...post, liked, likes };
    });
    this.posts = next;
  }

  @action toggleCommenting(index) {
    this.posts = this.posts.map((post, i) =>
      i === index ? { ...post, isCommenting: !post.isCommenting } : post
    );
  }

  @action updateCommentDraft(index, event) {
    let value = event.target.value;
    this.posts = this.posts.map((post, i) => (i === index ? { ...post, draftComment: value } : post));
  }

  commentPublishDisabled(post) {
    return !(post?.draftComment ?? '').trim().length;
  }

  @action submitComment(index) {
    this.posts = this.posts.map((post, i) => {
      if (i !== index) return post;

      let text = (post.draftComment ?? '').trim();
      if (!text) return post;

      let newComment = { author: 'Vous', text, time: 'À l’instant' };
      let comments = [...(post.comments ?? []), newComment];
      let commentsCount = comments.length;

      return { ...post, comments, commentsCount, draftComment: '', isCommenting: true };
    });
  }

  @action cancelComment(index) {
    this.posts = this.posts.map((post, i) =>
      i === index ? { ...post, draftComment: '', isCommenting: false } : post
    );
  }

  @action votePoll(postIndex, optionIndex) {
    this.posts = this.posts.map((post, i) => {
      if (i !== postIndex || !post.isPoll || post.hasVoted) return post;

      let pollVotes = Array.from(post.pollVotes ?? []);
      pollVotes[optionIndex] = (pollVotes[optionIndex] ?? 0) + 1;

      return { ...post, pollVotes, hasVoted: true, votedOption: optionIndex };
    });
  }

  @action addShare(index) {
    this.posts = this.posts.map((post, i) => (i === index ? { ...post, shares: post.shares + 1 } : post));
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
            {{#each this.posts key="id" as |post index|}}
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
                    {{#each post.poll.options as |opt optIndex|}}
                      <div class="poll-option">
                        <span>{{opt}}</span>
                        <button
                          type="button"
                          class={{if (this.isOptionSelected post optIndex) "chip-btn voted" "chip-btn"}}
                          disabled={{post.hasVoted}}
                          {{on "click" (fn this.votePoll index optIndex)}}
                        >
                          {{if (this.isOptionSelected post optIndex) "Voté" "Voter"}}
                        </button>
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

              <div class="post-stats">
                <span>{{post.likes}} J'aime</span>
                <span>{{this.commentCount post}} Commentaires</span>
                <span>{{post.shares}} Partages</span>
              </div>

              <div class="reaction-bar">
                <button type="button" class={{if post.liked "reaction-pill liked" "reaction-pill"}} {{on "click" (fn this.toggleLike index)}}>
                  <span class="icon-heart">♡</span> J'aime
                </button>
                <button
                  type="button"
                  class={{if post.isCommenting "reaction-pill active" "reaction-pill"}}
                  {{on "click" (fn this.toggleCommenting index)}}
                >
                  Commenter
                </button>
                <button type="button" class="reaction-pill" {{on "click" (fn this.addShare index)}}>
                  ↗ Partager
                </button>
              </div>

              {{#if post.isCommenting}}
                <div class="comment-composer">
                  <div class="comment-avatar"></div>
                  <div class="comment-composer-body">
                    <textarea
                      rows="2"
                      placeholder="Ajoutez un commentaire…"
                      value={{post.draftComment}}
                      {{on "input" (fn this.updateCommentDraft index)}}
                    ></textarea>
                    <div class="comment-composer-actions">
                      <button type="button" class="chip-btn ghost" {{on "click" (fn this.cancelComment index)}}>
                        Annuler
                      </button>
                      <button
                        type="button"
                        class="publish-btn small"
                        disabled={{this.commentPublishDisabled post}}
                        {{on "click" (fn this.submitComment index)}}
                      >
                        Publier
                      </button>
                    </div>
                  </div>
                </div>
              {{/if}}

              {{#if post.comments}}
                <div class="comment-thread">
                  {{#each post.comments as |comment|}}
                    <div class="comment-row">
                      <div class="comment-avatar"></div>
                      <div class="comment-body">
                        <p class="comment-author">{{comment.author}} · <span class="comment-time">{{comment.time}}</span></p>
                        <p class="comment-text">{{comment.text}}</p>
                      </div>
                    </div>
                  {{/each}}
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
