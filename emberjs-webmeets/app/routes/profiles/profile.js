import Route from '@ember/routing/route';

export default class ProfilesProfileRoute extends Route {
  model(params) {
    // Obtenemos la lista de perfiles de la ruta 'profiles'
    const profiles = this.modelFor('profiles');

    // Buscamos el que coincide con el id de la URL
    return profiles.find((profile) => profile.id === params.profile_id);
  }
}
