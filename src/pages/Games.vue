<script setup lang="ts">
import { useSEO } from "@/composables/useSEO";
import ProjectShowcasePage from "./ProjectShowcasePage.vue";

useSEO({
  title: "Games | xsoulspace",
  description: "Explore the games created by xsoulspace.",
});
</script>

<template>
  <ProjectShowcasePage category="games" />
</template>
