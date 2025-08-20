<template>
  <div class="project-grid-container">
    <div v-for="(group, groupName) in projectGroups" :key="groupName" class="project-group">
      <h2>{{ formatGroupName(groupName) }}</h2>
      <div class="project-grid">
        <ProjectCard v-for="project in group" :key="project.id" :project="project" />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { getProjectGroups } from '@/services/projectService';
import type { ProjectGroup } from '@/types/project';
import ProjectCard from './ProjectCard.vue';

const projectGroups = ref<ProjectGroup>({});

onMounted(() => {
  projectGroups.value = getProjectGroups();
});

function formatGroupName(name: string | number) {
  const groupName = String(name);
  return groupName.replace(/_/g, ' ').replace(/\b\w/g, l => l.toUpperCase());
}
</script>

<style lang="scss" scoped>
.project-grid-container {
  width: 100%;
}

.project-group {
  margin-bottom: 3rem;

  h2 {
    font-size: 2rem;
    margin-bottom: 1.5rem;
    color: #222;
    border-bottom: 2px solid #eee;
    padding-bottom: 0.5rem;
  }
}

.project-grid {
  display: grid;
  grid-template-columns: repeat(64, 1fr);
  gap: 1rem;
}
</style>
