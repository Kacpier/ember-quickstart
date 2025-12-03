import Component from '@glimmer/component';

export default class ProfileSkills extends Component {
  <template>
    <section class="profile-skills">
      <h2 class="profile-skills__title">{{@title}}</h2>
      <div class="profile-skills__list">
        {{#each @skills as |skill|}}
          <span class="profile-skills__pill">{{skill}}</span>
        {{/each}}
      </div>
    </section>
  </template>
}
