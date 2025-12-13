import { LinkTo } from '@ember/routing';

<template>
  {{#if this.showHeader}}
    <header class="main-header">
      <h1 class="logo">WebMeets</h1>
      <nav class="nav-links">
        <LinkTo @route="dashboard">Tableau de bord</LinkTo>
        <LinkTo @route="featured">À la une</LinkTo>
        <LinkTo @route="profiles">Perfiles</LinkTo>
        <LinkTo @route="index">Deconnexion</LinkTo>
      </nav>
    </header>
  {{/if}}


  <div class="app-root">
    {{outlet}}
  </div>
</template>
