<script setup lang="ts">
import type { Project } from "@/types/project";

interface Props {
  selectedProject: Project | null;
  readmeHtml: string;
  readmeLoading: boolean;
  readmeError: string;
  hasReadme: boolean;
}

defineProps<Props>();
</script>

<template>
  <div class="code-view">
    <div v-if="selectedProject" class="project-details">
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
</template>

<style scoped>
.code-view {
  padding: var(--spacing-lg);
  overflow-y: auto;
}

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
}

.readme-section {
  margin-bottom: var(--spacing-lg);
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
  background-color: var(--color-background);
  line-height: 1.6;
  max-width: 600px;
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

@media (max-width: 768px) {
  .code-view {
    padding: var(--spacing-md);
  }

  .project-header {
    flex-direction: column;
    align-items: flex-start;
    gap: var(--spacing-sm);
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
