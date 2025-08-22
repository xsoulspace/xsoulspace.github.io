<script setup lang="ts">
import type { DropdownSectionProps } from "@/types/dropdown";

interface Props extends DropdownSectionProps {}

withDefaults(defineProps<Props>(), {
  padding: "var(--spacing-sm)",
});
</script>

<template>
  <div class="dropdown-section" :style="{ padding }">
    <div v-if="title" class="dropdown-header">{{ title }}</div>
    <div class="dropdown-content">
      <slot />
    </div>
  </div>
</template>

<style scoped>
.dropdown-section {
  width: 100%;
  max-width: 100%;
  background: rgba(247, 242, 233, 0.8); /* --color-surface with transparency */
  box-sizing: border-box;
  overflow: hidden;
}

.dropdown-header {
  font-size: 0.75rem;
  font-weight: 600;
  color: var(--color-text-secondary);
  text-transform: uppercase;
  letter-spacing: 0.05em;
  margin-bottom: var(--spacing-sm);
  padding-bottom: var(--spacing-xs);
  border-bottom: 1px solid var(--color-border);
}

.dropdown-content {
  display: flex;
  flex-direction: column;
  gap: var(--spacing-xs);
}
</style>
