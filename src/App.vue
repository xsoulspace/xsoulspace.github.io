<template>
  <AppLayout />
</template>

<script setup lang="ts">
import AppLayout from "@/components/layout/AppLayout.vue";
import { onMounted } from "vue";
import { useLocale } from "./composables/useLocale";

const { initLocale } = useLocale();

onMounted(() => {
  // Initialize locale from localStorage or browser preference
  initLocale();
});
</script>

<style>
/* Global styles are in assets/main.css */
</style>
