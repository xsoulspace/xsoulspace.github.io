<script setup lang="ts">
import type { Project } from "@/types/project";
import { getPackageLinks } from "@/utils/packageLinks";

interface Props {
  projects: Project[];
  groupedProjects: { [key: string]: Project[] };
  selectedProjectId: string | null;
}

interface Emits {
  (e: "select-project", projectId: string): void;
}

defineProps<Props>();
const emit = defineEmits<Emits>();
</script>

<template>
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
          @click="emit('select-project', project.id)"
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
                  class="fab fa-github github-icon"
                ></i>
                <i
                  v-else-if="link.icon === 'pub'"
                  class="fas fa-cube link-icon pub-icon"
                ></i>
                <i
                  v-else-if="link.icon === 'npm'"
                  class="fas fa-cube link-icon npm-icon"
                ></i>
                <span v-if="link.icon !== 'github'" class="link-label">{{
                  link.label
                }}</span>
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
          @click="emit('select-project', project.id)"
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
          @click="emit('select-project', project.id)"
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
</template>

<style scoped>
.packages-list {
  border-right: 1px solid var(--color-border);
  padding-left: var(--spacing-md);
  padding-right: 0;
  overflow-y: auto;
}

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
  word-wrap: break-word;
  overflow-wrap: break-word;
  hyphens: none;
}

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

@media (max-width: 768px) {
  .packages-list {
    border-right: none;
    border-bottom: 1px solid var(--color-border);
    max-height: 40vh;
    overflow-y: auto;
    padding-left: var(--spacing-md);
    padding-right: 0;
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
