import Component from '@glimmer/component';
import { setComponentTemplate } from '@ember/component';
import { hbs } from 'ember-cli-htmlbars';
import { LinkTo } from '@ember/routing';

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
      <aside class="sidebar messages-sidebar">
        <div class="sidebar-header">
          <div class="sidebar-logo-box gradient">
            <svg xmlns="http://www.w3.org/2000/svg" class="sidebar-logo-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M9 6V4.5A1.5 1.5 0 0110.5 3h3A1.5 1.5 0 0115 4.5V6m-6 0h6m-6 0H6.5A1.5 1.5 0 005 7.5v9A1.5 1.5 0 006.5 18h11a1.5 1.5 0 001.5-1.5v-9A1.5 1.5 0 0017.5 6H9z" />
            </svg>
          </div>
          <div class="sidebar-title-box">
            <h2 class="sidebar-app-title">WebMeets</h2>
            <p class="sidebar-app-subtitle">Réseau & Organisation</p>
          </div>
        </div>

        <div class="sidebar-profile">
          <img src="https://images.unsplash.com/photo-1629507208649-70919ca33793?w=200" class="sidebar-avatar" alt="Sophie Laurent" />
          <div>
            <div class="sidebar-profile-name">Sophie Laurent</div>
            <div class="sidebar-profile-role">Cheffe de projet digital</div>
          </div>
        </div>

        <nav class="sidebar-nav">
          <ul>
            <li>
              <LinkTo @route="dashboard" class="item" @activeClass="active">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M3 12l9-9 9 9M4 10v10h6V14h4v6h6V10" />
                </svg>
                Tableau de bord
              </LinkTo>
            </li>
            <li>
              <LinkTo @route="featured" class="item" @activeClass="active">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M4 4a16 16 0 0116 16M4 4a8 8 0 018 8M4 12a4 4 0 014 4" />
                </svg>
                À la une
              </LinkTo>
            </li>
            <li>
              <LinkTo @route="profiles" class="item" @activeClass="active">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M5.121 17.804A9 9 0 0112 15a9 9 0 016.879 2.804M12 12a4 4 0 100-8 4 4 0 000 8z" />
                </svg>
                Mon Profil
              </LinkTo>
            </li>
            <li>
              <LinkTo @route="tasks" class="item" @activeClass="active">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M9 5h6M9 3h6a2 2 0 012 2v14a2 2 0 01-2 2H9a2 2 0 01-2-2V5a2 2 0 012-2zM9 14h.01M9 11h.01" />
                </svg>
                Tâches
              </LinkTo>
            </li>
            <li>
              <LinkTo @route="messages" class="item" @activeClass="active">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M7 8h10M7 12h6m5 9v-3a5 5 0 00-5-5H7a5 5 0 00-5 5v3" />
                </svg>
                Messages
              </LinkTo>
            </li>
          </ul>
        </nav>

        <button class="sidebar-logout" type="button">
          <svg xmlns="http://www.w3.org/2000/svg" class="logout-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
              d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 013-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
          </svg>
          Déconnexion
        </button>
      </aside>

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
                <button type="button">📎</button>
              </div>
              <input type="text" placeholder="Tapez votre message..." />
              <button type="button" class="send-btn">📨</button>
            </footer>
          </div>
        </section>
      </main>
    </div>
  `,
  MessagesPage
);
