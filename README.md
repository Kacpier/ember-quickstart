# Projet IHM WebMeets FLORES-ZABKOWSKI 

WebMeets est un **prototype d’Interface Homme–Machine (IHM)** développé avec **Ember.js**.
Le projet consiste en une **application web de réseau social professionnel**, conçue dans un objectif pédagogique afin d’explorer la conception d’interfaces, l’ergonomie et la structuration d’une application front-end moderne.

Ce dépôt contient l’ensemble du code nécessaire pour installer, lancer et explorer le prototype.

## Ressources de conception

- **Dossier de conception et notes** 
  https://docs.google.com/document/d/1nJB84oapwR5M13cQM07XF_AiiMgIgV_KvrfzG2ONYTM/edit?tab=t.0

- **Maquettes Figma** 
  -  Maquette de basse fidélité
    https://www.figma.com/design/PCDGzQCSOjyZLxV6b3XQtB/WebMeets?node-id=1-1283&p=f&t=7MHE4zlyHcaswFOa-0
  - Maquette de moyenne fidélité
    https://file-narrow-31734414.figma.site/

## Fonctionnalites

WebMeets propose plusieurs pages représentatives d’un réseau professionnel :

| Section | Fonctionnalités principales |
|---|---|
| Connexion | Saisie du nom et de l’email<br>Enregistrement de l’utilisateur courant côté front<br>Accès au tableau de bord après validation |
| Tableau de bord | Vue synthétique des connexions, tâches, événements et messages<br>Organisation par cartes et sections |
| Profil utilisateur | Modification de la bio<br>Gestion des expériences, formations, langues, compétences et centres d’intérêt<br>Synchronisation du nom et de l’email avec la connexion |
| À la une | Publications et sondages<br>Réactions et commentaires |
| Réseau | Liste de connexions, invitations et suggestions<br>Recherche et filtrage des profils |
| Messagerie | Liste des conversations<br>Interface de discussion avec envoi de messages |
| Gestion des tâches | Tableau Kanban multi-colonnes (à faire, en cours, en révision, terminées)<br>Ajout de nouvelles tâches via une modale<br>Attribution de tâches à des connexions existantes |
| Navigation | Navigation latérale persistante (sidebar)<br>Accès rapide aux différentes sections<br>Déconnexion |


## Limites du prototype

- Pas de backend.
- Pas d’authentification réelle.
- Pas de persistance des données.
- Données simulées (mock data).
- Application principalement conçue pour un usage desktop.

## Prerequisites

- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/) (>= 20 avec npm)
- [Google Chrome](https://google.com/chrome/) (recomande)

## Installation

```bash
git clone <repository-url>
cd emberjs-quickstart
npm install
```

La CLI Ember est installée en local via `npm install` ; inutile d'ajouter `ember-cli` globalement.

## Lancer le projet

- Dev server : 
- `npm run start`
- Visit your app at [http://localhost:4200](http://localhost:4200).

## Acces a l'application

- Option 1 : utiliser le profil de base pour la connexion rapide.
 
  "Sophie Laurent" 
  sophie.laurent@example.com

- Option 2 : saisir n'importe quel nom et email ; cela suffit pour passer l'ecran de connexion et voir ces valeurs reflétées sur le tableau de bord. Le reste des contenus est du mock data.

## Architecture du projet

- app/router.js : declaration des routes (dashboard, featured, events, messages, profiles, reseau, tasks).
- app/components/ : composants GJS (sidebar, dashboard-page, featured-page, events-page, login-screen, messages-page, profile-page, reseau-page, tasks-board, edit-profile-modal, connections-search).
- app/routes/ et app/controllers/ : logiques par page (index, profiles).
- app/templates/ : templates GJS pour application, index, dashboard, featured, events, messages, profiles (+ profil detail), reseau, tasks.
- app/services/current-user.js : service pour conserver l'utilisateur courant.
- app/data/connections.js : mock data des connexions/profils.
- app/styles/app.css : styles globaux.
- public/logo.svg : asset statique principal.

## Astuces

- [ember.js](https://emberjs.com/)
- [Vite](https://vite.dev)
- Development Browser Extensions
  - [ember inspector for chrome](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi)
  - [ember inspector for firefox](https://addons.mozilla.org/en-US/firefox/addon/ember-inspector/)

[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com) 
