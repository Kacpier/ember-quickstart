import Component from '@glimmer/component';

export default class SideBar extends Component {
  <template>
    <aside class="side-bar">
      <div class="side-bar__top">
        <button class="side-bar__user-button">
          <img src={{@avatarUrl}} alt={{@userName}} class="side-bar__user-avatar" />
        </button>
      </div>
      <nav class="side-bar__nav">
        {{#each @menuItems as |item|}}
          <button class={{if item.active "side-bar__nav-item is-active" "side-bar__nav-item"}}>
            <span class="side-bar__nav-label">{{item.label}}</span>
          </button>
        {{/each}}
      </nav>
      <div class="side-bar__footer">
        <button class="side-bar__logout">{{@logoutLabel}}</button>
      </div>
    </aside>
  </template>
}
