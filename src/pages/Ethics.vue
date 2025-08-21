<script setup lang="ts">
import BentoGrid from "@/components/ui/BentoGrid.vue";
import { useSEO } from "@/composables/useSEO";
import { getProjects } from "@/services/projectService";
import type { Project } from "@/types/project";
import M_ from "markdown-it";
import { onMounted, ref } from "vue";
import { useI18n } from "vue-i18n";

useSEO({
  title: "Ethics | xsoulspace",
  description: "The core principles and values that guide xsoulspace.",
});

const { locale } = useI18n();
const principles = ref<Project[]>([]);
const letterHtml = ref("");

onMounted(async () => {
  principles.value = await getProjects("ethics", locale.value);

  // Fetch and render the markdown letter
  const letterModule = await import("../../../ethics_letter.md?raw");
  const md = new M_();
  letterHtml.value = md.render(letterModule.default);
});
</script>

<template>
  <div class="ethics-page">
    <BentoGrid :items="principles" />
    <div class="letter" v-html="letterHtml"></div>
  </div>
</template>

<style scoped>
.ethics-page {
  padding: var(--spacing-xl);
}

.bento-grid {
  display: grid;
  gap: var(--spacing-lg);
  margin-bottom: var(--spacing-xl);
}

.letter {
  max-width: 800px;
  margin: 0 auto;
}
</style>
