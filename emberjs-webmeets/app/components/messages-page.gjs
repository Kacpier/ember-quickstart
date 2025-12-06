import Component from '@glimmer/component';
import { setComponentTemplate } from '@ember/component';
import { hbs } from 'ember-cli-htmlbars';
import AppSidebar from './app-sidebar';

class MessagesPage extends Component {
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
              <input type="text" placeholder="Rechercher une conversation..." />
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
              </div>
              <input type="text" placeholder="Tapez votre message..." />
              <button type="button" class="send-btn" aria-label="Envoyer le message">
                <svg xmlns="http://www.w3.org/2000/svg" class="chat-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M4 4l16 8-16 8 4.5-8L4 4Zm4.5 8H20" />
                </svg>
              </button>
            </footer>
          </div>
        </section>
      </main>
    </div>
  `,
  MessagesPage
);
