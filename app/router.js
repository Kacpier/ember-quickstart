import EmberRouter from '@embroider/router';
import config from 'ember-quickstart/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  this.route('contact', { path: '/getting-in-touch' });
  this.route('about');
  this.route('monProfil');
  this.route('connexion');
  this.route('events');
});
