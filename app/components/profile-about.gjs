import Component from '@glimmer/component';

export default class ProfileAbout extends Component {
  <template>
    <section class="profile-about">
      <h2 class="profile-about__title">{{@title}}</h2>
      <p class="profile-about__description">
        {{@description}}
      </p>
    </section>
  </template>
}
