import Component from '@glimmer/component';
import { setComponentTemplate } from '@ember/component';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';
import { hbs } from 'ember-cli-htmlbars';
import AppSidebar from './app-sidebar';

class MessagesPage extends Component {
  @tracked isOptionsOpen = false;

  conversations = [
    { name: 'Marie Dubois', preview: 'Super, merci pour ton aide !', time: '10:32', unread: 2, avatar: 'https://images.unsplash.com/photo-1629507208649-70919ca33793?w=80', active: true },
    { name: 'Thomas Martin', preview: 'On se fait une réunion demain ?', time: '09:15', unread: 1, avatar: 'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?w=80' },
    { name: 'Sophie Laurent', preview: "J'ai envoyé les documents", time: 'Hier', unread: 0, avatar: 'https://images.unsplash.com/photo-1550525811-e5869dd03032?w=80' },
    { name: 'Lucas Bernard', preview: 'Parfait, à plus tard !', time: 'Hier', unread: 0, avatar: 'https://images.unsplash.com/photo-1527980965255-d3b416303d12?w=80' },
    { name: 'Emma Petit', preview: 'Tu es disponible pour un call ?', time: 'Lun', unread: 1, avatar: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=80' },
  ];

  messages = [
    { author: 'Marie Dubois', time: '10:15', text: "Salut ! Tu as eu le temps de regarder le projet ?", side: 'left' },
    { author: 'Moi', time: '10:18', text: "Oui, j'ai jeté un œil. C'est vraiment bien fait !", side: 'right' },
    { author: 'Moi', time: '10:18', text: "J'ai quelques suggestions pour améliorer les performances", side: 'right' },
    { author: 'Marie Dubois', time: '10:20', text: 'Génial ! Je suis tout ouïe 👂', side: 'left' },
    { author: 'Moi', time: '10:22', text: "On pourrait optimiser les requêtes et ajouter du cache", side: 'right' },
    { author: 'Marie Dubois', time: '10:32', text: 'Super, merci pour ton aide !', side: 'left' },
  ];

  @action openConversationOptions() {
    this.isOptionsOpen = true;
  }

  @action closeConversationOptions() {
    this.isOptionsOpen = false;
  }

  @action stopModalClick(event) {
    event.stopPropagation();
  }
}

export default setComponentTemplate(
  hbs`
    <div class="messages-page">
      <AppSidebar class="messages-sidebar" />

      <main class="messages-main">
        <header class="messages-hero">
          <h1>Messages</h1>
        </header>

        <section class="messages-body">
          <div class="conv-list">
            <div class="conv-search">
              <div class="search-field">
                <svg xmlns="http://www.w3.org/2000/svg" class="search-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="m21 21-4.35-4.35m0 0A7.5 7.5 0 1 0 5 5a7.5 7.5 0 0 0 11.65 11.65Z" />
                </svg>
                <input type="text" placeholder="Rechercher une conversation..." />
              </div>
            </div>
            <ul>
              {{#each this.conversations as |conv|}}
                <li class="{{if conv.active "conv-item active" "conv-item"}}">
                  <div class="conv-left">
                    <img src="{{conv.avatar}}" alt="{{conv.name}}" />
                    <div>
                      <p class="conv-name">{{conv.name}}</p>
                      <p class="conv-preview">{{conv.preview}}</p>
                    </div>
                  </div>
                  <div class="conv-meta">
                    <p class="conv-time">{{conv.time}}</p>
                    {{#if conv.unread}}
                      <span class="unread-dot">{{conv.unread}}</span>
                    {{/if}}
                  </div>
                </li>
              {{/each}}
            </ul>
          </div>

          <div class="chat-panel">
            <header class="chat-header">
              <div class="chat-user">
                <img src="https://images.unsplash.com/photo-1629507208649-70919ca33793?w=80" alt="Marie Dubois" />
                <div>
                  <p class="chat-name">Marie Dubois</p>
                  <p class="chat-status">En ligne</p>
                </div>
              </div>
              <div class="chat-header-actions">
                <button type="button" class="chat-header-btn" aria-label="Appeler">
                  <svg xmlns="http://www.w3.org/2000/svg" class="chat-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M22 16.92v3a2 2 0 0 1-2.18 2 19.86 19.86 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.86 19.86 0 0 1-3.07-8.63A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.9 12.9 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.9 12.9 0 0 0 2.81.7A2 2 0 0 1 22 16.92Z" />
                  </svg>
                </button>
                <button type="button" class="chat-header-btn" aria-label="Appel vidéo">
                  <svg xmlns="http://www.w3.org/2000/svg" class="chat-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                    <rect x="3" y="5" width="15" height="14" rx="2" ry="2" stroke-width="2" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m18 10 3-2v8l-3-2" />
                  </svg>
                </button>
                <button type="button" class="chat-header-btn" aria-label="Plus d'options" {{on "click" this.openConversationOptions}}>
                  <svg xmlns="http://www.w3.org/2000/svg" class="chat-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                    <circle cx="12" cy="5" r="1.5" fill="currentColor" stroke="currentColor" stroke-width="1.5" />
                    <circle cx="12" cy="12" r="1.5" fill="currentColor" stroke="currentColor" stroke-width="1.5" />
                    <circle cx="12" cy="19" r="1.5" fill="currentColor" stroke="currentColor" stroke-width="1.5" />
                  </svg>
                </button>
              </div>
            </header>

            <div class="chat-thread">
              {{#each this.messages as |msg|}}
                <div class="chat-row {{msg.side}}">
                  <div class="bubble">
                    <p>{{msg.text}}</p>
                  </div>
                  <span class="bubble-time">{{msg.time}}</span>
                </div>
              {{/each}}
            </div>

            <footer class="chat-input">
              <div class="chat-actions">
                <button type="button" class="chat-icon-btn" aria-label="Joindre un fichier">
                  <svg xmlns="http://www.w3.org/2000/svg" class="chat-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M8 12.5 15.5 5a3 3 0 1 1 4 4l-9 9a5 5 0 0 1-7-7l8-8" />
                  </svg>
                </button>
                <button type="button" class="chat-icon-btn" aria-label="Envoyer un emoji">
                  <svg xmlns="http://www.w3.org/2000/svg" class="chat-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                    <circle cx="12" cy="12" r="9" stroke-width="2" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 10h.01M15 10h.01" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.5 14s1.25 1.5 3.5 1.5 3.5-1.5 3.5-1.5" />
                  </svg>
                </button>
              </div>
              <input type="text" placeholder="Tapez votre message..." />
              <button type="button" class="send-btn" aria-label="Envoyer le message">
                <svg xmlns="http://www.w3.org/2000/svg" class="chat-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                  <path stroke-linecap="round" stroke-linejoin="round"
                    d="M4 4l16 8-16 8 4.5-8L4 4Zm4.5 8H20" />
                </svg>
              </button>
            </footer>
          </div>
        </section>
      </main>

      {{#if this.isOptionsOpen}}
        <div
          class="modal-backdrop conversation-backdrop"
          role="dialog"
          aria-label="Options de conversation"
          aria-modal="true"
          {{on "click" this.closeConversationOptions}}
        >
          <div class="modal-window conversation-modal" {{on "click" this.stopModalClick}}>
            <header class="modal-header conversation-modal-header">
              <h2>Options de conversation</h2>
              <button
                type="button"
                class="modal-close"
                aria-label="Fermer"
                {{on "click" this.closeConversationOptions}}
              >
                ×
              </button>
            </header>

            <div class="conversation-actions">
              <button type="button" class="conversation-option soft" {{on "click" this.closeConversationOptions}}>
                <span class="option-icon info">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                    <circle cx="12" cy="12" r="9" stroke-width="2" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8h.01M11 12h1v4h1" />
                  </svg>
                </span>
                <span class="option-label">Marquer comme lu</span>
              </button>

              <button type="button" class="conversation-option" {{on "click" this.closeConversationOptions}}>
                <span class="option-icon">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 9h16M7 9V6a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v3m-2 0v9a2 2 0 0 1-2 2h-6a2 2 0 0 1-2-2V9Z" />
                  </svg>
                </span>
                <span class="option-label">Archiver la conversation</span>
              </button>

              <button type="button" class="conversation-option danger" {{on "click" this.closeConversationOptions}}>
                <span class="option-icon danger">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 4h6m-7 4h8l-.6 10.8a2 2 0 0 1-2 1.9h-2.8a2 2 0 0 1-2-1.9L7 8Zm2 0V5.6a1.6 1.6 0 0 1 1.6-1.6h.8a1.6 1.6 0 0 1 1.6 1.6V8m-3 3.5v4m3-4v4" />
                  </svg>
                </span>
                <span class="option-label">Supprimer la conversation</span>
              </button>
            </div>
          </div>
        </div>
      {{/if}}
    </div>
  `,
  MessagesPage
);
