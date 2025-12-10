import { LinkTo } from '@ember/routing';

<template>
  <article>
    <h2>{{@model.name}}</h2>
    <h3>{{@model.headline}}</h3>
    <p>{{@model.location}}</p>

    <h4>Acerca de</h4>
    <p>{{@model.about}}</p>

    <p>
      <LinkTo @route="profiles">
      ← Volver a la lista de perfiles
      </LinkTo>
    </p>
  </article>
</template>
