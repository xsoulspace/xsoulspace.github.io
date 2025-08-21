<template>
  <div class="app-layout">
    <LocaleSwitcher />
    <main role="main" class="app-main">
      <RouterView />
    </main>
    <app-footer />
  </div>
</template>

<script setup lang="ts">
import { RouterView } from "vue-router";
import LocaleSwitcher from "../ui/LocaleSwitcher.vue";
import AppFooter from "./AppFooter.vue";
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
