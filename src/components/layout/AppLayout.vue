<template>
  <div class="app-layout">
    <main role="main" class="app-main">
      <router-view />
    </main>
    <app-footer />
  </div>
</template>

<script setup lang="ts">
import AppFooter from './AppFooter.vue';
</script>

<style scoped>
.app-layout {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.app-main {
  flex-grow: 1;
}
</style>
