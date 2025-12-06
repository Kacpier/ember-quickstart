import { fn } from '@ember/helper';
import { on } from '@ember/modifier';

<template>
  <div class="modal-backdrop" role="dialog" aria-modal="true">
    <div class="modal-window">
      <header class="modal-header">
        <div>
          <p class="modal-label">Visibilité LinkedIn</p>
          <h2>Modifier le profil</h2>
          <p class="modal-subtitle">
            Mettez à jour vos infos visibles par vos contacts
          </p>
        </div>
        <button
          type="button"
          class="modal-close"
          aria-label="Fermer"
          {{on "click" @onClose}}
        >
          ×
        </button>
      </header>

      <div class="modal-grid">
        <div class="modal-field">
          <label for="edit-name">Nom complet</label>
          <input
            id="edit-name"
            value={{@draft.name}}
            {{on "input" (fn @onFieldChange "name")}}
          />
        </div>
        <div class="modal-field">
          <label for="edit-headline">Titre / Headline</label>
          <input
            id="edit-headline"
            value={{@draft.headline}}
            {{on "input" (fn @onFieldChange "headline")}}
          />
        </div>
        <div class="modal-field">
          <label for="edit-status">Statut</label>
          <input
            id="edit-status"
            value={{@draft.status}}
            {{on "input" (fn @onFieldChange "status")}}
          />
        </div>
        <div class="modal-field">
          <label for="edit-location">Localisation</label>
          <input
            id="edit-location"
            value={{@draft.location}}
            {{on "input" (fn @onFieldChange "location")}}
          />
        </div>
      </div>

      <div class="modal-field">
        <label for="edit-about">Résumé / À propos</label>
        <textarea
          id="edit-about"
          rows="3"
          value={{@draft.about}}
          {{on "input" (fn @onFieldChange "about")}}
        ></textarea>
      </div>

      <div class="modal-grid">
        <div class="modal-field">
          <label for="edit-email">Email</label>
          <input
            id="edit-email"
            type="email"
            value={{@draft.email}}
            {{on "input" (fn @onFieldChange "email")}}
          />
        </div>
        <div class="modal-field">
          <label for="edit-phone">Téléphone</label>
          <input
            id="edit-phone"
            value={{@draft.phone}}
            {{on "input" (fn @onFieldChange "phone")}}
          />
        </div>
      </div>

      <div class="modal-grid">
        <div class="modal-field">
          <label for="edit-website">Site web</label>
          <input
            id="edit-website"
            value={{@draft.website}}
            {{on "input" (fn @onFieldChange "website")}}
          />
        </div>
        <div class="modal-field">
          <label for="edit-linkedin">LinkedIn</label>
          <input
            id="edit-linkedin"
            value={{@draft.linkedin}}
            {{on "input" (fn @onFieldChange "linkedin")}}
          />
        </div>
      </div>

      <div class="modal-actions">
        <button class="btn-secondary" type="button" {{on "click" @onClose}}>
          Annuler
        </button>
        <button class="btn-primary" type="button" {{on "click" @onSave}}>
          Enregistrer
        </button>
      </div>
    </div>
  </div>
</template>
