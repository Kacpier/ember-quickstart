<template>
  <div class="landing">
    <div class="login-card">
      <div class="login-icon">
        WM
      </div>

      <h1 class="app-title">WebMeets</h1>
      <p class="app-subtitle">
        Votre réseau professionnel intelligent
      </p>

      <form class="login-form">
        <label for="fullName">Nom complet</label>
        <input
          id="fullName"
          type="text"
          placeholder="Entrez votre nom"
        />

        <label for="email">Email professionnel</label>
        <input
          id="email"
          type="email"
          placeholder="vous@example.com"
        />

        <button type="button" class="primary-button">
          Se connecter
        </button>

        <p class="demo-note">
          Demo – Entrez n'importe quel nom et email
        </p>
      </form>

      <section class="demo-accounts">
        <h2>Comptes de démonstration :</h2>

        <ul>
          <li>
            <strong>Sophie Laurent</strong><br />
            <span>Cheffe de projet digital</span>
          </li>
          <li>
            <strong>Thomas Martin</strong><br />
            <span>Développeur Full Stack</span>
          </li>
          <li>
            <strong>Marie Dubois</strong><br />
            <span>Designer UX/UI</span>
          </li>
        </ul>
      </section>
    </div>
  </div>
</template>
