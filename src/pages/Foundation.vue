<script setup lang="ts">
import { useSEO } from "@/composables/useSEO";
import { getProjects } from "@/services/projectService";
import type { Project } from "@/types/project";
import { computed, onMounted, ref } from "vue";
import { useI18n } from "vue-i18n";

useSEO({
  title: "Foundation | xsoulspace",
  description: "Core libraries and packages developed by xsoulspace.",
});

const { locale } = useI18n();
const projects = ref<Project[]>([]);
const selectedProjectId = ref<string | null>(null);

const selectedProject = computed(() => {
  if (!selectedProjectId.value) return null;
  return projects.value.find((p) => p.id === selectedProjectId.value);
});

onMounted(async () => {
  projects.value = await getProjects("foundation", locale.value);
  if (projects.value.length > 0) {
    selectedProjectId.value = projects.value[0].id;
  }
});
</script>

<template>
  <div class="foundation-page">
    <div class="packages-list">
      <ul>
        <li
          v-for="project in projects"
          :key="project.id"
          :class="{ active: selectedProjectId === project.id }"
          @click="selectedProjectId = project.id"
        >
          {{ project.title }}
        </li>
      </ul>
    </div>
    <div class="code-view">
      <div v-if="selectedProject" class="project-details">
        <h2>{{ selectedProject.title }}</h2>
        <p v-if="selectedProject.subtitle">{{ selectedProject.subtitle }}</p>
        <p>{{ selectedProject.description }}</p>
        <a
          v-if="selectedProject.repository"
          :href="selectedProject.repository"
          target="_blank"
          >View on GitHub</a
        >
        <div v-if="selectedProject.codeSample" class="code-sample">
          <h4>Example ({{ selectedProject.codeSample.language }}):</h4>
          <pre><code>{{ selectedProject.codeSample.code }}</code></pre>
        </div>
      </div>
      <div v-else>
        <p>Select a package to see the details.</p>
      </div>
    </div>
  </div>
</template>

<style scoped>
.foundation-page {
  display: grid;
  grid-template-columns: 300px 1fr;
  min-height: 100vh;
}

.packages-list {
  border-right: 1px solid var(--color-border);
  padding: var(--spacing-lg);
}

.code-view {
  padding: var(--spacing-lg);
}

.packages-list ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.packages-list li {
  padding: var(--spacing-sm) var(--spacing-md);
  cursor: pointer;
  border-radius: var(--border-radius-md);
  transition: background-color 0.2s ease;
}

.packages-list li:hover {
  background-color: var(--color-surface);
}

.packages-list li.active {
  background-color: var(--color-primary);
  color: var(--color-on-primary);
}

.code-sample {
  margin-top: var(--spacing-lg);
}

.code-sample pre {
  background-color: var(--color-surface);
  padding: var(--spacing-md);
  border-radius: var(--border-radius-md);
  overflow-x: auto;
}
</style>
