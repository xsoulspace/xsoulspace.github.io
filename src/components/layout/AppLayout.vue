<template>
  <div class="app-layout">
    <TopNavigation />
    <main role="main" class="app-main">
      <RouterView />
    </main>
    <app-footer />
  </div>
</template>

<script setup lang="ts">
import { RouterView } from "vue-router";
import TopNavigation from "../ui/TopNavigation.vue";
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
  padding-top: 90px; /* Account for fixed navigation bar */
}
</style>
