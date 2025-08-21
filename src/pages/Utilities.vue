<template>
  <ProjectShowcasePage category="utilities" />
</template>

<script setup lang="ts">
import { useSEO } from "@/composables/useSEO";
import ProjectShowcasePage from "./ProjectShowcasePage.vue";

useSEO({
  title: "Utilities | xsoulspace",
  description: "Handy utilities and tools from xsoulspace.",
});
</script>
