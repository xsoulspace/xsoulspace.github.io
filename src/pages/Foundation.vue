<script setup lang="ts">
import { useSEO } from "@/composables/useSEO";
import { getProjects } from "@/services/projectService";
import type { Project } from "@/types/project";
import { computed, onMounted, ref, watch } from "vue";
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
        <h2>{{ selectedProject.title }}</h2>
        <p v-if="selectedProject.subtitle">{{ selectedProject.subtitle }}</p>
        <p>{{ selectedProject.description }}</p>
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
}
</style>
