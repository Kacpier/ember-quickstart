import { LinkTo } from '@ember/routing';

<template>
  <nav class="menu">
    <LinkTo @route="index" class="menu-index">
      <h1>WebMeets</h1>
    </LinkTo>
    <div class="links">
      <LinkTo @route="monProfil" class="menu-about">
        Mon profil
      </LinkTo>
      <LinkTo @route="contact" class="menu-contact">
        Connections
      </LinkTo>
      <LinkTo @route="contact" class="menu-contact">
        Tableau de bord
      </LinkTo>
      <LinkTo @route="contact" class="menu-contact">
        Messages
      </LinkTo>
      <LinkTo @route="contact" class="menu-contact">
        Evenements
      </LinkTo>
    </div>
  </nav>
</template>
