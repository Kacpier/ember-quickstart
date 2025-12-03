<template>
  <div class="login-page">
    <div class="login-page__brand">
      <div class="login-page__hero"></div>
    </div>
    <div class="login-page__card">
      <h1 class="login-page__title">Connexion</h1>
      <p class="login-page__subtitle">Accédez à votre réseau WebMeets.</p>
      <form class="login-form">
        <label class="login-form__field">
          <span class="login-form__label">Adresse e-mail</span>
          <input class="login-form__input" type="email" name="email" placeholder="prenom.nom@email.com" />
        </label>
        <label class="login-form__field">
          <span class="login-form__label">Mot de passe</span>
          <input class="login-form__input" type="password" name="password" placeholder="••••••••" />
        </label>
        <div class="login-form__meta">
          <label class="login-form__remember">
            <input type="checkbox" name="remember" />
            <span>Se souvenir de moi</span>
          </label>
          <a class="login-form__link" href="#">Mot de passe oublié ?</a>
        </div>
        <button class="login-form__submit" type="button">Se connecter</button>
      </form>
      <div class="login-page__footer">
        <span>Nouvel utilisateur ?</span>
        <a class="login-form__link" href="#">Rejoindre WebMeets</a>
      </div>
    </div>
  </div>
</template>
