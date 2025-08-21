<script setup lang="ts">
import BaseDropdown from "./BaseDropdown.vue";
import DropdownItem from "./DropdownItem.vue";
import DropdownSection from "./DropdownSection.vue";

import type { Language } from "@/types/dropdown";

interface Props {
  languages: Language[];
  currentLanguage: string;
  trigger?: "click" | "hover";
  placement?: "bottom-start" | "bottom-end" | "top-start" | "top-end";
  title?: string;
}

const props = withDefaults(defineProps<Props>(), {
  trigger: "hover",
  placement: "bottom-end",
  title: "Language",
});

const emit = defineEmits<{
  change: [languageCode: string];
}>();

const handleLanguageChange = (languageCode: string) => {
  emit("change", languageCode);
};
</script>

<template>
  <BaseDropdown
    :trigger="trigger"
    :placement="placement"
    min-width="150px"
    max-width="200px"
  >
    <template #trigger="{ isOpen, toggle }">
      <button
        class="lang-button"
        :class="{ active: isOpen }"
        @click="trigger === 'click' ? toggle() : null"
      >
        <span class="lang-text">{{ currentLanguage.toUpperCase() }}</span>
        <span class="dropdown-arrow">
          <i class="fas fa-chevron-down"></i>
        </span>
      </button>
    </template>

    <DropdownSection :title="title">
      <DropdownItem
        v-for="lang in languages"
        :key="lang.code"
        :selected="currentLanguage === lang.code"
        @click="handleLanguageChange(lang.code)"
      >
        {{ lang.name }}
      </DropdownItem>
    </DropdownSection>
  </BaseDropdown>
</template>

<style scoped>
.lang-button {
  background: var(--color-background);
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

.lang-button:hover {
  background-color: var(--color-surface-hover);
  transform: translateY(-1px);
  box-shadow: var(--shadow-md);
}

.lang-button.active {
  background-color: var(--color-primary);
  color: var(--color-on-primary);
  border-color: var(--color-primary);
}

.lang-text {
  font-weight: 600;
  font-size: 0.875rem;
}

.dropdown-arrow {
  font-size: 0.75rem;
  transition: transform 0.2s ease;
}

.dropdown-arrow i {
  font-size: 0.75rem;
  transition: transform 0.2s ease;
}

.lang-button.active .dropdown-arrow i {
  transform: rotate(180deg);
}

/* Mobile responsive */
@media (max-width: 768px) {
  .lang-button {
    padding: var(--spacing-xs) var(--spacing-sm);
    font-size: 0.75rem;
  }
}
</style>
