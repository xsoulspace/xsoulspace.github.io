<template>
  <AppLayout />
</template>

<script setup lang="ts">
import AppLayout from "@/components/layout/AppLayout.vue";
import { onMounted } from "vue";
import { useLocale } from "./composables/useLocale";

const { locale } = useLocale();

onMounted(() => {
  // Initialize locale from localStorage or browser preference
  if (typeof window !== "undefined") {
    const savedLocale = localStorage.getItem("locale");
    if (savedLocale && ["en", "ru"].includes(savedLocale)) {
      locale.value = savedLocale;
    } else {
      const browserLang = navigator.language.split("-")[0];
      if (browserLang === "ru") {
        locale.value = "ru";
      } else {
        locale.value = "en";
      }
    }
  }
});
</script>

<style>
/* Global styles are in assets/main.css */
</style>
