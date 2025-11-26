import { LinkTo } from '@ember/routing';
import Jumbo from 'ember-quickstart/components/jumbo';
import Rental from 'ember-quickstart/components/rental';


//NOTE mélange tableau de bord/à la une ???
<template>
  <Jumbo>
    <h2>WebMeets</h2>
    <LinkTo @route="about" class="button">About Us</LinkTo>
  </Jumbo>

  <div class="rentals">
    <ul class="results">
      {{#each @model as |rental|}}
        <li><Rental @rental={{rental}} /></li>
      {{/each}}
    </ul>
  </div>
</template>
