<script setup lang="ts">
import FoundationPackageContent from "@/components/foundation/FoundationPackageContent.vue";
import FoundationPackageList from "@/components/foundation/FoundationPackageList.vue";
import { useSEO } from "@/composables/useSEO";
import { getProjects } from "@/services/projectService";
import type { Project } from "@/types/project";
import M_ from "markdown-it";
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

// Store README data per project to avoid re-fetching
const readmeCache = ref<
  Record<string, { html: string; error: string; loaded: boolean }>
>({});

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

// Function to fetch README from GitHub repository
const fetchReadme = async (project: Project, useCache = true) => {
  if (!project.repository) {
    const error = "No repository URL available";
    if (!useCache) {
      readmeError.value = error;
      hasReadme.value = false;
      hasReadme.value = false;
    }
    return { html: "", error, loaded: true };
  }

  // Check cache first
  if (useCache && readmeCache.value[project.id]) {
    const cached = readmeCache.value[project.id];
    if (!useCache) {
      readmeHtml.value = cached.html;
      readmeError.value = cached.error;
    }
    return cached;
  }

  if (!useCache) {
    readmeLoading.value = true;
    readmeError.value = "";
    hasReadme.value = false;
  }

  try {
    // Extract GitHub owner/repo from repository URL
    const githubMatch = project.repository.match(
      /github\.com\/([^\/]+)\/([^\/]+)/
    );
    if (!githubMatch) {
      const error = "Unable to extract GitHub repository information";
      readmeCache.value[project.id] = { html: "", error, loaded: true };
      if (!useCache) {
        readmeError.value = error;
        hasReadme.value = false;
      }
      return readmeCache.value[project.id];
    }

    const [, owner, repo] = githubMatch;

    // Try different README file names
    const readmeFiles = ["README.md", "readme.md", "README.txt", "readme.txt"];
    for (const fileName of readmeFiles) {
      try {
        // Try GitHub API first
        const apiUrl = `https://api.github.com/repos/${owner}/${repo}/contents/${fileName}`;
        let response = await fetch(apiUrl);

        if (response.ok) {
          const data = await response.json();
          const content = atob(data.content);
          const md = new M_({
            html: true,
            linkify: true,
            typographer: true,
          });
          const html = md.render(content);

          readmeCache.value[project.id] = { html, error: "", loaded: true };

          if (!useCache) {
            readmeHtml.value = html;
            readmeError.value = "";
            hasReadme.value = true;
          }

          return readmeCache.value[project.id];
        }

        // Try raw.githubusercontent.com for monorepo or subfolder packages
        // Guess possible subfolder: pkgs/{project.id} or {project.id}
        // Try both /main/ and /refs/heads/main/ for branch
        const possibleFolders = [`pkgs/${project.id}`, `${project.id}`];
        const possibleBranches = ["main", "refs/heads/main"];

        for (const folder of possibleFolders) {
          for (const branch of possibleBranches) {
            const rawUrl = `https://raw.githubusercontent.com/${owner}/${repo}/${branch}/${folder}/${fileName}`;
            response = await fetch(rawUrl);

            if (response.ok) {
              const content = await response.text();
              const md = new M_({
                html: true,
                linkify: true,
                typographer: true,
              });
              const html = md.render(content);

              readmeCache.value[project.id] = { html, error: "", loaded: true };

              if (!useCache) {
                readmeHtml.value = html;
                readmeError.value = "";
                hasReadme.value = true;
              }

              return readmeCache.value[project.id];
            }
          }
        }
      } catch (error) {
        // Continue to next file
        console.log(`Failed to fetch ${fileName}:`, error);
      }
    }

    const error = "README not found in repository";
    readmeCache.value[project.id] = { html: "", error, loaded: true };

    if (!useCache) {
      readmeError.value = error;
      hasReadme.value = false;
    }

    return readmeCache.value[project.id];
  } catch (error) {
    console.error("Error fetching README:", error);
    const errorMsg = "Failed to fetch README from repository";
    readmeCache.value[project.id] = { html: "", error: errorMsg, loaded: true };

    if (!useCache) {
      readmeError.value = errorMsg;
    }

    return readmeCache.value[project.id];
  } finally {
    if (!useCache) {
      readmeLoading.value = false;
    }
  }
};

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

        // Load README and show it immediately when ready
        const result = await fetchReadme(newProject, false);
        if (result) {
          readmeHtml.value = result.html;
          readmeError.value = result.error;
          hasReadme.value = !result.error && !!result.html;
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
