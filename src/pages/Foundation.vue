<script setup lang="ts">
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

// Generate package registry links
const getPackageLinks = (project: Project) => {
  const links: { type: string; url: string; icon: string; label: string }[] =
    [];

  // GitHub link (if repository exists)
  if (project.repository) {
    links.push({
      type: "github",
      url: project.repository,
      icon: "github",
      label: "GitHub",
    });
  }

  // Pub.dev link for Dart packages
  if (project.tags.includes("dart") || project.tags.includes("flutter")) {
    const pubDevLink =
      project.links &&
      project.links.find((l) => l.url && l.url.includes("pub.dev"))?.url;
    if (pubDevLink) {
      links.push({
        type: "pub",
        url: pubDevLink,
        icon: "pub",
        label: "Pub.dev",
      });
    }
  }

  // NPM link for NPM packages
  if (
    project.tags.includes("npm") ||
    project.tags.includes("javascript") ||
    project.tags.includes("typescript")
  ) {
    const packageName = project.title.toLowerCase().replace(/_/g, "-");
    links.push({
      type: "npm",
      url: `https://www.npmjs.com/package/${packageName}`,
      icon: "npm",
      label: "NPM",
    });
  }

  return links;
};

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
        const response = await fetch(
          `https://api.github.com/repos/${owner}/${repo}/contents/${fileName}`
        );

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
    <div class="packages-list">
      <!-- Dart Packages -->
      <div
        v-if="groupedProjects.dart && groupedProjects.dart.length > 0"
        class="package-group"
      >
        <h3 class="group-title">Dart/Flutter Packages</h3>
        <ul class="package-list">
          <li
            v-for="project in groupedProjects.dart"
            :key="project.id"
            :class="{ active: selectedProjectId === project.id }"
            @click="selectedProjectId = project.id"
            class="package-item"
          >
            <div class="package-header">
              <span class="package-name">{{ project.title }}</span>
              <div class="package-links" @click.stop>
                <a
                  v-for="link in getPackageLinks(project)"
                  :key="link.type"
                  :href="link.url"
                  target="_blank"
                  :title="link.label"
                  class="package-link"
                  :class="`link-${link.type}`"
                  @click.stop
                >
                  <i
                    v-if="link.icon === 'github'"
                    class="fab fa-github link-icon github-icon"
                  ></i>
                  <i
                    v-else-if="link.icon === 'pub'"
                    class="fas fa-cube link-icon pub-icon"
                  ></i>
                  <i
                    v-else-if="link.icon === 'npm'"
                    class="fas fa-cube link-icon npm-icon"
                  ></i>
                  <span class="link-label">{{ link.label }}</span>
                </a>
              </div>
            </div>
          </li>
        </ul>
      </div>

      <!-- NPM Packages -->
      <div
        v-if="groupedProjects.npm && groupedProjects.npm.length > 0"
        class="package-group"
      >
        <h3 class="group-title">NPM Packages</h3>
        <ul class="package-list">
          <li
            v-for="project in groupedProjects.npm"
            :key="project.id"
            :class="{ active: selectedProjectId === project.id }"
            @click="selectedProjectId = project.id"
            class="package-item"
          >
            <div class="package-header">
              <span class="package-name">{{ project.title }}</span>
              <div class="package-links" @click.stop>
                <a
                  v-for="link in getPackageLinks(project)"
                  :key="link.type"
                  :href="link.url"
                  target="_blank"
                  :title="link.label"
                  class="package-link"
                  :class="`link-${link.type}`"
                  @click.stop
                >
                  <i
                    v-if="link.icon === 'github'"
                    class="fab fa-github link-icon github-icon"
                  ></i>
                  <i
                    v-else-if="link.icon === 'pub'"
                    class="fas fa-cube link-icon pub-icon"
                  ></i>
                  <i
                    v-else-if="link.icon === 'npm'"
                    class="fas fa-cube link-icon npm-icon"
                  ></i>
                  <span class="link-label">{{ link.label }}</span>
                </a>
              </div>
            </div>
          </li>
        </ul>
      </div>

      <!-- Other Packages -->
      <div
        v-if="groupedProjects.other && groupedProjects.other.length > 0"
        class="package-group"
      >
        <h3 class="group-title">Other Packages</h3>
        <ul class="package-list">
          <li
            v-for="project in groupedProjects.other"
            :key="project.id"
            :class="{ active: selectedProjectId === project.id }"
            @click="selectedProjectId = project.id"
            class="package-item"
          >
            <div class="package-header">
              <span class="package-name">{{ project.title }}</span>
              <div class="package-links" @click.stop>
                <a
                  v-for="link in getPackageLinks(project)"
                  :key="link.type"
                  :href="link.url"
                  target="_blank"
                  :title="link.label"
                  class="package-link"
                  :class="`link-${link.type}`"
                  @click.stop
                >
                  <i
                    v-if="link.icon === 'github'"
                    class="fab fa-github link-icon github-icon"
                  ></i>
                  <i
                    v-else-if="link.icon === 'pub'"
                    class="fas fa-cube link-icon pub-icon"
                  ></i>
                  <i
                    v-else-if="link.icon === 'npm'"
                    class="fas fa-cube link-icon npm-icon"
                  ></i>
                  <span class="link-label">{{ link.label }}</span>
                </a>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <div class="code-view">
      <div v-if="selectedProject" class="project-details">
        <div class="project-header">
          <div>
            <h2>{{ selectedProject.title }}</h2>
            <p v-if="selectedProject.subtitle" class="project-subtitle">
              {{ selectedProject.subtitle }}
            </p>
          </div>
        </div>

        <p class="project-description">{{ selectedProject.description }}</p>

        <!-- README Display -->
        <div v-if="selectedProject?.repository" class="readme-section">
          <div v-if="readmeLoading" class="readme-loading">
            <i class="fas fa-spinner fa-spin"></i>
            Loading README...
          </div>
          <div v-else-if="readmeError" class="readme-error">
            <i class="fas fa-exclamation-triangle"></i>
            {{ readmeError }}
          </div>
          <div
            v-else-if="hasReadme && readmeHtml"
            class="readme-content"
            v-html="readmeHtml"
          ></div>
          <div v-else-if="!readmeLoading && !readmeError" class="readme-empty">
            <i class="fas fa-book-open"></i>
            <span>No README available</span>
          </div>
        </div>

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
  grid-template-columns: 350px 1fr;
  min-height: 100vh;
  gap: var(--spacing-lg);
}

.packages-list {
  border-right: 1px solid var(--color-border);
  padding: var(--spacing-lg);
  overflow-y: auto;
}

.code-view {
  padding: var(--spacing-lg);
  overflow-y: auto;
}

/* Project Header */
.project-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  gap: var(--spacing-md);
  margin-bottom: var(--spacing-md);
}

.project-subtitle {
  color: var(--color-text-secondary);
  font-size: var(--font-size-body);
  margin: var(--spacing-xs) 0 0 0;
}

.project-description {
  color: var(--color-text);
  margin-bottom: var(--spacing-lg);
}

/* README Section */
.readme-section {
  margin-bottom: var(--spacing-lg);
  border: 1px solid var(--color-border);
  border-radius: var(--border-radius-lg);
  overflow: hidden;
}

.readme-loading,
.readme-error {
  padding: var(--spacing-lg);
  text-align: center;
  background-color: var(--color-surface);
  border-bottom: 1px solid var(--color-border);
}

.readme-loading {
  color: var(--color-text-secondary);
}

.readme-error {
  color: var(--color-error);
  background-color: var(--color-primary-light);
}

.readme-error i {
  margin-right: var(--spacing-xs);
}

.readme-empty {
  padding: var(--spacing-lg);
  text-align: center;
  background-color: var(--color-background);
  color: var(--color-text-secondary);
  border-bottom: 1px solid var(--color-border);
}

.readme-empty i {
  margin-bottom: var(--spacing-sm);
  opacity: 0.7;
}

.readme-empty span {
  display: block;
  font-size: 0.9rem;
}

.readme-content {
  padding: var(--spacing-lg);
  background-color: var(--color-background);
  line-height: 1.6;
}

.readme-content :deep(h1),
.readme-content :deep(h2),
.readme-content :deep(h3),
.readme-content :deep(h4),
.readme-content :deep(h5),
.readme-content :deep(h6) {
  margin-top: var(--spacing-lg);
  margin-bottom: var(--spacing-md);
  font-weight: 600;
  color: var(--color-text);
}

.readme-content :deep(h1) {
  font-size: var(--font-size-h3);
}

.readme-content :deep(h2) {
  font-size: var(--font-size-h4);
}

.readme-content :deep(h3) {
  font-size: var(--font-size-body);
}

.readme-content :deep(p) {
  margin-bottom: var(--spacing-md);
}

.readme-content :deep(pre) {
  background-color: var(--color-surface);
  padding: var(--spacing-md);
  border-radius: var(--border-radius-md);
  overflow-x: auto;
  margin: var(--spacing-md) 0;
  font-family: "Monaco", "Menlo", "Ubuntu Mono", monospace;
  font-size: 0.875rem;
  line-height: 1.5;
}

.readme-content :deep(code) {
  background-color: var(--color-surface);
  padding: 2px 4px;
  border-radius: 4px;
  font-family: "Monaco", "Menlo", "Ubuntu Mono", monospace;
  font-size: 0.8em;
}

.readme-content :deep(pre code) {
  background: none;
  padding: 0;
}

.readme-content :deep(ul),
.readme-content :deep(ol) {
  margin-bottom: var(--spacing-md);
  padding-left: var(--spacing-lg);
}

.readme-content :deep(li) {
  margin-bottom: var(--spacing-xs);
}

.readme-content :deep(a) {
  color: var(--color-primary);
  text-decoration: none;
}

.readme-content :deep(a:hover) {
  text-decoration: underline;
}

.readme-content :deep(blockquote) {
  border-left: 4px solid var(--color-primary);
  padding-left: var(--spacing-md);
  margin: var(--spacing-md) 0;
  background-color: var(--color-surface);
  font-style: italic;
  color: var(--color-text-secondary);
}

.readme-content :deep(img) {
  max-width: 100%;
  height: auto;
  border-radius: var(--border-radius-md);
}

.readme-content :deep(table) {
  border-collapse: collapse;
  width: 100%;
  margin: var(--spacing-md) 0;
}

.readme-content :deep(th),
.readme-content :deep(td) {
  border: 1px solid var(--color-border);
  padding: var(--spacing-sm);
  text-align: left;
}

.readme-content :deep(th) {
  background-color: var(--color-surface);
  font-weight: 600;
}

/* Package Groups */
.package-group {
  margin-bottom: var(--spacing-lg);
}

.group-title {
  font-size: var(--font-size-h4);
  color: var(--color-text-secondary);
  margin-bottom: var(--spacing-sm);
  font-weight: 300;
  text-transform: lowercase;
  letter-spacing: 0.5px;
}

.package-list {
  list-style: none;
  padding: 0;
  margin: var(--spacing-md) 0;
}

.package-item {
  padding: var(--spacing-sm) var(--spacing-sm);
  cursor: pointer;
  border-radius: var(--border-radius-md);
  transition: all 0.2s ease;
  border: 1px solid transparent;
  background-color: var(--color-surface);
}

.package-item:hover {
  background-color: var(--color-surface-hover);
  border-color: var(--color-border);
}

.package-item.active {
  background-color: var(--color-primary-light);
  border-color: var(--color-primary);
  color: var(--color-text);
}

.package-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: var(--spacing-md);
}

.package-name {
  font-weight: 500;
  font-size: var(--font-size-tiny);
  color: var(--color-text);
  flex: 1;
  min-width: 0;
}

/* Package Links */
.package-links {
  display: flex;
  gap: 2px;
  flex-shrink: 0;
}

.package-link {
  display: flex;
  align-items: center;
  gap: 2px;
  padding: 2px var(--spacing-xs);
  border-radius: var(--border-radius-sm);
  text-decoration: none;
  font-size: 0.7rem;
  font-weight: 500;
  transition: all 0.2s ease;
  white-space: nowrap;
}

.package-link:hover {
  transform: translateY(-1px);
  box-shadow: var(--shadow-sm);
}

/* Link specific styles */
.link-github {
  background-color: #f6f8fa;
  color: #24292e;
  border: 1px solid #d1d9e0;
}

.link-github:hover {
  background-color: #24292e;
  color: white;
}

.link-pub {
  background-color: #0175c2;
  color: white;
}

.link-pub:hover {
  background-color: #015a9c;
}

.link-npm {
  background-color: #cb3837;
  color: white;
}

.link-npm:hover {
  background-color: #a52e2d;
}

.link-icon {
  font-size: 0.75rem;
  display: flex;
  align-items: center;
}

.link-label {
  font-size: 0.75rem;
  font-weight: 500;
}

/* Code View */
.code-sample {
  margin-top: var(--spacing-lg);
}

.code-sample pre {
  background-color: var(--color-surface);
  padding: var(--spacing-md);
  border-radius: var(--border-radius-md);
  overflow-x: auto;
  font-family: "Monaco", "Menlo", "Ubuntu Mono", monospace;
  font-size: 0.875rem;
  line-height: 1.5;
}

.code-sample pre code {
  background: none;
  padding: 0;
}

/* Responsive Design */
@media (max-width: 768px) {
  .foundation-page {
    grid-template-columns: 1fr;
    gap: 0;
  }

  .packages-list {
    border-right: none;
    border-bottom: 1px solid var(--color-border);
    max-height: 40vh;
    overflow-y: auto;
    padding: var(--spacing-md);
  }

  .package-header {
    flex-direction: column;
    align-items: flex-start;
    gap: var(--spacing-sm);
  }

  .package-links {
    align-self: flex-end;
  }

  .package-link {
    font-size: 0.65rem;
    padding: 1px var(--spacing-xs);
  }
}

@media (max-width: 480px) {
  .package-links {
    flex-wrap: wrap;
  }

  .package-link {
    flex-shrink: 0;
  }

  /* Responsive README */
  .project-header {
    flex-direction: column;
    align-items: flex-start;
    gap: var(--spacing-sm);
  }

  .readme-toggle-btn {
    align-self: flex-end;
    font-size: 0.8rem;
    padding: var(--spacing-xs) var(--spacing-sm);
  }

  .readme-content {
    padding: var(--spacing-md);
    font-size: 0.9rem;
  }

  .readme-content :deep(h1) {
    font-size: var(--font-size-h4);
  }

  .readme-content :deep(h2) {
    font-size: var(--font-size-body);
  }

  .readme-content :deep(pre) {
    font-size: 0.8rem;
  }
}
</style>
