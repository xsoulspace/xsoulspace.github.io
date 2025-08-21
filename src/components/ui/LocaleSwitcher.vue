<script setup lang="ts">
import { useLocale } from "@/composables/useLocale";

const { setLocale, locale } = useLocale();
</script>

<template>
  <div class="locale-switcher">
    <button @click="setLocale('en')" :class="{ active: locale === 'en' }">
      EN
    </button>
    <button @click="setLocale('ru')" :class="{ active: locale === 'ru' }">
      RU
    </button>
  </div>
</template>

<style scoped>
.locale-switcher {
  position: fixed;
  left: var(--spacing-lg);
  top: 50%;
  transform: translateY(-50%);
  display: flex;
  flex-direction: column;
  gap: var(--spacing-sm);
  background-color: var(--color-surface);
  padding: var(--spacing-sm);
  border-radius: var(--border-radius-md);
  border: 1px solid var(--color-border);
  z-index: 1000;
}

button {
  background: none;
  border: none;
  padding: var(--spacing-sm) var(--spacing-md);
  cursor: pointer;
  font-weight: bold;
  color: var(--color-text);
  border-radius: var(--border-radius-sm);
  transition: background-color 0.2s ease, color 0.2s ease;
}

button:hover {
  background-color: var(--color-surface-hover);
}

button.active {
  background-color: var(--color-primary);
  color: var(--color-on-primary);
}
</style>
