import Component from '@glimmer/component';
import { concat } from '@ember/helper';

export default class ProfileContact extends Component {
  <template>
    <section class="profile-contact">
      <h2 class="profile-contact__title">{{@title}}</h2>
      <ul class="profile-contact__list">
        <li class="profile-contact__item">
          <span class="profile-contact__label">Email</span>
          <a class="profile-contact__value" href={{concat "mailto:" @email}}>{{@email}}</a>
        </li>
        <li class="profile-contact__item">
          <span class="profile-contact__label">Tel</span>
          <a class="profile-contact__value" href={{concat "tel:" @phone}}>{{@phone}}</a>
        </li>
        <li class="profile-contact__item">
          <span class="profile-contact__label">Site</span>
          <a class="profile-contact__value" href={{concat "https://" @website}} target="_blank" rel="noreferrer noopener">{{@website}}</a>
        </li>
        <li class="profile-contact__item">
          <span class="profile-contact__label">LinkedIn</span>
          <a class="profile-contact__value" href={{concat "https://" @linkedin}} target="_blank" rel="noreferrer noopener">{{@linkedin}}</a>
        </li>
      </ul>
    </section>
  </template>
}
