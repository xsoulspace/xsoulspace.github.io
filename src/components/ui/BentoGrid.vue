<script setup lang="ts">
import type { Project } from "@/types/project";

defineProps<{
  items: Project[];
}>();
</script>

<template>
  <div class="bento-grid">
    <div
      v-for="item in items"
      :key="item.id"
      class="bento-item"
      :class="`size-${item.bentoConfig?.size || 'small'}`"
    >
      <h3>{{ item.title }}</h3>
    </div>
  </div>
</template>

<style scoped>
.bento-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
  gap: var(--spacing-lg);
}

.bento-item {
  padding: var(--spacing-lg);
  background-color: var(--color-surface);
  border-radius: var(--border-radius-lg);
  border: 1px solid var(--color-border);
}

.bento-item.size-medium {
  grid-column: span 2;
}

.bento-item.size-large {
  grid-column: span 3;
}

@media (max-width: 1024px) {
  .bento-item.size-large {
    grid-column: span 2;
  }
}

@media (max-width: 768px) {
  .bento-grid {
    grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
  }

  .bento-item.size-medium,
  .bento-item.size-large {
    grid-column: span 1;
  }
}
</style>
