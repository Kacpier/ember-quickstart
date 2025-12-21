# Projet IHM WebMeets FLORES-ZABKOWSKI 

WebMeets est un **prototype d’Interface Homme–Machine (IHM)** développé avec **Ember.js**.
Le projet consiste en une **application web de réseau social professionnel**, conçue dans un objectif pédagogique afin d’explorer la conception d’interfaces, l’ergonomie et la structuration d’une application front-end moderne.

Ce dépôt contient l’ensemble du code nécessaire pour installer, lancer et explorer le prototype.

## Ressources de conception

- **Dossier de conception et notes** 
  https://docs.google.com/document/d/1nJB84oapwR5M13cQM07XF_AiiMgIgV_KvrfzG2ONYTM/edit?tab=t.0
  
  Voir aussi le fichier PDF (rapport final.pdf), la version finale du rapport.

- **Maquettes Figma** 
PROTOTYPE:
  https://www.figma.com/proto/PCDGzQCSOjyZLxV6b3XQtB/WebMeets?node-id=60-721&p=f&t=8M0OHCFlifKjpmfR-1&scaling=contain&content-scaling=fixed&page-id=1%3A1283
DESIGN:
https://www.figma.com/design/PCDGzQCSOjyZLxV6b3XQtB/WebMeets?node-id=1-1283&t=vA8iICxQ32hbz5eA-1

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
- [Node.js](https://nodejs.org/)

## Installation

```bash
git clone <repository-url>
cd ember-quickstart
npm install
```

La CLI Ember est installée en local via `npm install` ; inutile d'ajouter `ember-cli` globalement.

## Lancer le projet

- Dev server : 
- `npm run start`
- Une fois lancé, se rendre à l'url: [http://localhost:4200](http://localhost:4200).
- P.S. : Si l'application ne se lance pas (erreur avec module), relancez la commande 

## Structure rapide

- app/ : code Ember (routes, composants GJS, services, styles, templates).
- config/ : configuration Ember/Vite/targets.
- public/ : assets statiques.

## Astuces

- [ember.js](https://emberjs.com/)
- Development Browser Extensions
  - [ember inspector for chrome](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi)
  - [ember inspector for firefox](https://addons.mozilla.org/en-US/firefox/addon/ember-inspector/)
