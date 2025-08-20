<template>
  <div class="project-card" :style="gridStyle">
    <div class="card-content">
      <h3>{{ project.title }}</h3>
      <p v-if="project.subtitle">{{ project.subtitle }}</p>
      <p>{{ project.description }}</p>
      <div class="tags" v-if="project.tags">
        <span v-for="tag in project.tags" :key="tag" class="tag">{{ tag }}</span>
      </div>
      <a :href="project.repository" v-if="project.repository" target="_blank" rel="noopener noreferrer">
        View Repository
      </a>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue';
import type { Project } from '@/types/project';

const props = defineProps<{
  project: Project;
}>();

const gridStyle = computed(() => ({
  'grid-column': `span ${props.project.colSpan}`,
  'grid-row': `span ${props.project.rowSpan}`,
}));
</script>

<style lang="scss" scoped>
.project-card {
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  padding: 1.5rem;
  display: flex;
  flex-direction: column;
  transition: transform 0.3s ease, box-shadow 0.3s ease;

  &:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
  }
}

.card-content {
  h3 {
    margin-top: 0;
    font-size: 1.25rem;
    color: #333;
  }

  p {
    color: #666;
    line-height: 1.6;
  }
}

.tags {
  margin-top: 1rem;
  .tag {
    display: inline-block;
    background-color: #eee;
    color: #555;
    padding: 0.25rem 0.75rem;
    border-radius: 15px;
    font-size: 0.8rem;
    margin-right: 0.5rem;
    margin-bottom: 0.5rem;
  }
}

a {
  margin-top: 1rem;
  color: #007bff;
  text-decoration: none;
  font-weight: 600;

  &:hover {
    text-decoration: underline;
  }
}
</style>
