<script setup lang="ts">
import FoundationPackageContent from "@/components/foundation/FoundationPackageContent.vue";
import FoundationPackageList from "@/components/foundation/FoundationPackageList.vue";
import { useSEO } from "@/composables/useSEO";
import { getProjects } from "@/services/projectService";
import type { Project } from "@/types/project";
import {
  clearReadmeCaches,
  fetchReadme,
  readmeCache,
} from "@/utils/readmeFetcher";
import { computed, onMounted, ref, watch } from "vue";
import { useI18n } from "vue-i18n";

useSEO({
  title: "Foundation | xsoulspace",
  description: "Core libraries and packages developed by xsoulspace.",
});

const { locale } = useI18n();
const projects = ref<Project[]>([]);
const selectedProjectId = ref<string | null>(null);
const readmeHtml = ref("");
const readmeLoading = ref(false);
const readmeError = ref("");
const hasReadme = ref(false);

const selectedProject = computed(() => {
  if (!selectedProjectId.value) return null;
  return projects.value.find((p) => p.id === selectedProjectId.value);
});

// Group projects by package type
const groupedProjects = computed(() => {
  const groups: { [key: string]: Project[] } = {};

  projects.value.forEach((project) => {
    let groupKey = "other";

    if (project.tags.includes("dart") || project.tags.includes("flutter")) {
      groupKey = "dart";
    } else if (
      project.tags.includes("npm") ||
      project.tags.includes("javascript") ||
      project.tags.includes("typescript")
    ) {
      groupKey = "npm";
    }

    if (!groups[groupKey]) {
      groups[groupKey] = [];
    }
    groups[groupKey].push(project);
  });

  return groups;
});

// Watch for project changes to reset README state and preload
watch(selectedProjectId, async (newId, oldId) => {
  // Reset README state

  if (oldId) {
    // Keep current state for previous project
    const prevProject = projects.value.find((p) => p.id === oldId);
    if (prevProject) {
      const cached = readmeCache.value[prevProject.id];
      if (cached) {
        readmeHtml.value = cached.html;
        readmeError.value = cached.error;
        hasReadme.value = !cached.error && !!cached.html;
      }
    }
  }

  if (newId) {
    // Load state for new project
    const newProject = projects.value.find((p) => p.id === newId);
    if (newProject) {
      const cached = readmeCache.value[newProject.id];
      if (cached?.loaded) {
        // Show cached README immediately
        readmeHtml.value = cached.html;
        readmeError.value = cached.error;
        hasReadme.value = !cached.error && !!cached.html;
      } else if (newProject.repository) {
        // Start loading immediately and show loading state
        readmeHtml.value = "";
        readmeError.value = "";
        hasReadme.value = false;
        readmeLoading.value = true;

        try {
          // Load README and show it immediately when ready
          const result = await fetchReadme(newProject, false);
          readmeHtml.value = result.html;
          readmeError.value = result.error;
          hasReadme.value = !result.error && !!result.html;
        } finally {
          readmeLoading.value = false;
        }
      } else {
        // No repository, show empty state
        readmeHtml.value = "";
        readmeError.value = "";
        hasReadme.value = false;
      }
    }
  }
});

// Handle project selection
const selectProject = (projectId: string) => {
  selectedProjectId.value = projectId;
};

// Helper function to clear README caches (useful for debugging)
const clearCaches = () => {
  clearReadmeCaches();
  console.log("README caches cleared");
};

const fetchData = async () => {
  projects.value = await getProjects("foundation", locale.value);
  if (
    projects.value.length > 0 &&
    !projects.value.find((p) => p.id === selectedProjectId.value)
  ) {
    selectedProjectId.value = projects.value[0].id;
  }
};

onMounted(fetchData);

watch(locale, fetchData);
</script>

<template>
  <div class="foundation-page">
    <FoundationPackageList
      :projects="projects"
      :grouped-projects="groupedProjects"
      :selected-project-id="selectedProjectId"
      @select-project="selectProject"
    />
    <FoundationPackageContent
      :selected-project="selectedProject || null"
      :readme-html="readmeHtml"
      :readme-loading="readmeLoading"
      :readme-error="readmeError"
      :has-readme="hasReadme"
    />
  </div>
</template>

<style scoped>
.foundation-page {
  display: grid;
  grid-template-columns: 300px 1fr;
  min-height: 100vh;
  gap: var(--spacing-md);
}

/* Responsive Design */
@media (max-width: 768px) {
  .foundation-page {
    grid-template-columns: 1fr;
    gap: 0;
  }
}
</style>
