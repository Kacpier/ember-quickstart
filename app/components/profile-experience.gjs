import Component from '@glimmer/component';

export default class ProfileExperience extends Component {
  <template>
    <section class="profile-experience">
      <h2 class="profile-experience__title">{{@title}}</h2>
      <div class="profile-experience__list">
        {{#each @experiences as |experience|}}
          <article class="profile-experience__card">
            <div class="profile-experience__header">
              <h3 class="profile-experience__position">{{experience.title}}</h3>
              <span class="profile-experience__period">{{experience.period}}</span>
            </div>
            <div class="profile-experience__company">{{experience.company}}</div>
            <p class="profile-experience__details">{{experience.details}}</p>
          </article>
        {{/each}}
      </div>
    </section>
  </template>
}
