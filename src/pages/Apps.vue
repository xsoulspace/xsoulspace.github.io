<script setup lang="ts">
import { useSEO } from "@/composables/useSEO";
import ProjectShowcasePage from "./ProjectShowcasePage.vue";

useSEO({
  title: "Apps | xsoulspace",
  description: "Discover the applications developed by xsoulspace.",
});
</script>

<template>
  <ProjectShowcasePage category="apps" />
</template>
