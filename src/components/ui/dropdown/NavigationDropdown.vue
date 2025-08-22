<script setup lang="ts">
import BaseDropdown from "./BaseDropdown.vue";
import DropdownItem from "./DropdownItem.vue";
import DropdownSection from "./DropdownSection.vue";

import type { NavigationItem } from "@/types/dropdown";

interface Props {
  items: NavigationItem[];
  trigger?: "click" | "hover";
  placement?: "bottom-start" | "bottom-end" | "top-start" | "top-end";
  title?: string;
  getItemLabel?: (item: NavigationItem) => string;
}

const props = withDefaults(defineProps<Props>(), {
  trigger: "hover",
  placement: "bottom-end",
  title: "Navigate",
});

const emit = defineEmits<{
  navigate: [path: string];
}>();

const handleNavigate = (path: string) => {
  emit("navigate", path);
};
</script>

<template>
  <BaseDropdown
    :trigger="trigger"
    :placement="placement"
    min-width="220px"
    max-width="280px"
  >
    <template #trigger="{ isOpen, toggle }">
      <button
        class="nav-button"
        :class="{ active: isOpen }"
        @click="trigger === 'click' ? toggle() : null"
      >
        <span class="button-icon">
          <i class="fas fa-bars"></i>
        </span>
        <span class="button-text">Menu</span>
      </button>
    </template>

    <DropdownSection :title="title">
      <DropdownItem
        v-for="item in items"
        :key="item.key"
        :icon="item.icon"
        @click="handleNavigate(item.path)"
      >
        {{ getItemLabel ? getItemLabel(item) : item.key }}
      </DropdownItem>
    </DropdownSection>
  </BaseDropdown>
</template>

<style scoped>
.nav-button {
  background: transparent;
  border: none;
  padding: var(--spacing-sm) var(--spacing-md);
  border-radius: var(--border-radius-md);
  cursor: pointer;
  font-size: 0.875rem;
  font-weight: 500;
  color: var(--color-text);
  transition: all 0.2s ease;
  display: flex;
  align-items: center;
  gap: var(--spacing-sm);
  position: relative;
}

.nav-button:hover {
  background-color: var(--color-surface-hover);
  transform: translateY(-1px);
  box-shadow: var(--shadow-md);
}

.nav-button.active {
  background-color: var(--color-primary);
  color: var(--color-on-primary);
  border-color: var(--color-primary);
}

.button-icon {
  font-size: 1rem;
}

.button-icon i {
  font-size: 1rem;
}

.button-text {
  font-size: 0.875rem;
}

/* Mobile responsive */
@media (max-width: 768px) {
  .nav-button {
    padding: var(--spacing-xs) var(--spacing-sm);
    font-size: 0.75rem;
  }

  .button-text {
    display: none;
  }
}
</style>
