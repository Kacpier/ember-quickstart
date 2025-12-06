import EmberRouter from '@embroider/router';
import config from 'emberjs-webmeets/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  this.route('dashboard');
  this.route('featured');
  this.route('tasks');
  this.route('messages');
  this.route('profiles', function() {
    this.route('profile', { path: '/:profile_id' });
  });
});
