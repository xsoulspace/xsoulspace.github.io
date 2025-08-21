<template>
  <HomeNavigation />
</template>

<script setup lang="ts">
import HomeNavigation from "../components/sections/HomeNavigation.vue";
import { useSEO } from "../composables/useSEO";

useSEO({
  title: "xsoulspace | Indie Studio",
  description:
    "Welcome to xsoulspace, an indie studio creating excellent products through quality, iteration, and open-source principles.",
});
</script>
