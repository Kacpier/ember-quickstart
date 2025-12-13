import { LinkTo } from '@ember/routing';

<template>
  <article>
    <h2>{{@model.name}}</h2>
    <h3>{{@model.headline}}</h3>
    <p>{{@model.location}}</p>

    <h4>About</h4>
    <p>{{@model.about}}</p>

    <p>
      <LinkTo @route="profiles">
      ← Retourner a la list de profiles
      </LinkTo>
    </p>
  </article>
</template>
