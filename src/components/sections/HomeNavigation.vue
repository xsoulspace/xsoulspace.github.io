<template>
  <nav class="home-nav">
    <router-link to="/apps" class="nav-row apps-games">
      <span>{{ t('nav.apps') }}</span>
      <span>|</span>
      <span>{{ t('nav.games') }}</span>
    </router-link>
    <router-link to="/utilities" class="nav-row utilities">
      <span>{{ t('nav.utilities') }}</span>
    </router-link>
    <router-link to="/foundation" class="nav-row foundation">
      <span>{{ t('nav.foundation') }}</span>
    </router-link>
    <router-link to="/ethics" class_="nav-row ethics">
      <span>{{ t('nav.ethics') }}</span>
    </router-link>
  </nav>
</template>

<script setup lang="ts">
import { useLocale } from '../../locales';

const { t } = useLocale();
</script>

<style scoped>
.home-nav {
  display: flex;
  flex-direction: column;
  width: 100%;
  height: calc(100vh - 150px); /* Full height minus footer */
}

.nav-row {
  flex-grow: 1;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  text-decoration: none;
  color: var(--color-text);
  font-size: 4rem;
  font-weight: 600;
  transition: background-color 0.3s ease, color 0.3s ease;
  border-bottom: 1px solid var(--color-border);
}

.nav-row:last-child {
  border-bottom: none;
}

.apps-games { background-color: var(--color-surface); }
.utilities { background-color: var(--color-background); }
.foundation { background-color: var(--color-surface); }
.ethics { background-color: var(--color-background); }

.nav-row:hover,
.nav-row:focus-visible {
  background-color: var(--color-primary);
  color: white;
  outline: none;
}

.apps-games span {
  padding: 0 var(--spacing-md);
}

@media (max-width: 768px) {
  .nav-row {
    font-size: 2.5rem;
  }
}
</style>
