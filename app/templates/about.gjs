import { LinkTo } from '@ember/routing';
import Jumbo from 'ember-quickstart/components/jumbo';

<template>
  <Jumbo>
    <h2>About</h2>
    <p>
      Bienvenue à la page About, tu peux cliquer sur ce bouton aussi.
    </p>
    <LinkTo @route="contact" class="button">Contact Us</LinkTo>
    <LinkTo @route="index" class="button">Homepage</LinkTo>
  </Jumbo>
</template>
