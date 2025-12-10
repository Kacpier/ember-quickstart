# IHM Marisela FLORES HERNANDEZ et Kacper Zabkowski

Projet d'interface (IHM) construit avec Ember.js. 
Ce fichier rassemble les liens clés et la marche à suivre pour installer, lancer, tester et livrer l'application.

## Ressources

- Dossier de conception et notes : https://docs.google.com/document/d/1nJB84oapwR5M13cQM07XF_AiiMgIgV_KvrfzG2ONYTM/edit?tab=t.0
- Maquettes Figma : https://file-narrow-31734414.figma.site/

## Prerequisites

You will need the following things properly installed on your computer.

- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/) (>= 20 avec npm)
- [Google Chrome](https://google.com/chrome/)

## Installation

```bash
git clone <repository-url>
cd emberjs-quickstart
npm install
```

La CLI Ember est installée en local via `npm install` ; inutile d'ajouter `ember-cli` globalement. Utilisez `npm exec ember <commande>` pour les générateurs ou les tests.

## Running / Development

- `npm run start`
- Visit your app at [http://localhost:4200](http://localhost:4200).
- Visit your tests at [http://localhost:4200/tests](http://localhost:4200/tests).

### Code Generators

Make use of the many generators for code, try `npm exec ember help generate` for more details.

### Running Tests

- `npm run test`

### Linting

- `npm run lint`
- `npm run lint:fix`

### Building

- `npm exec vite build --mode development` (development)
- `npm run build` (production)

### Deploying

Specify what it takes to deploy your app (environnement cible, variables, etc.).

## Further Reading / Useful Links

- [ember.js](https://emberjs.com/)
- [Vite](https://vite.dev)
- Development Browser Extensions
  - [ember inspector for chrome](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi)
  - [ember inspector for firefox](https://addons.mozilla.org/en-US/firefox/addon/ember-inspector/)
