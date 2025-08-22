<script setup lang="ts">
import type { DropdownItemProps } from "@/types/dropdown";

interface Props extends DropdownItemProps {}

const props = withDefaults(defineProps<Props>(), {
  selected: false,
  disabled: false,
  variant: "default",
});

const emit = defineEmits<{
  click: [event: MouseEvent];
}>();

const handleClick = (event: MouseEvent) => {
  if (!props.disabled) {
    emit("click", event);
  }
};
</script>

<template>
  <button
    class="dropdown-item"
    :class="[`variant-${variant}`, { selected: selected, disabled: disabled }]"
    @click="handleClick"
    :disabled="disabled"
  >
    <span v-if="icon" class="item-icon">
      <i :class="icon"></i>
    </span>
    <span class="item-text">
      <slot />
    </span>
    <span v-if="selected" class="checkmark">
      <i class="fas fa-check"></i>
    </span>
  </button>
</template>

<style scoped>
.dropdown-item {
  box-sizing: border-box;
  display: flex;
  align-items: center;
  gap: var(--spacing-sm);
  padding: var(--spacing-sm);
  width: 100%;
  border: none;
  background: none;
  text-decoration: none;
  color: var(--color-text);
  cursor: pointer;
  border-radius: var(--border-radius-sm);
  transition: all 0.2s ease;
  text-align: left;
  overflow: hidden;
  white-space: nowrap;
  font-size: 0.875rem;
}

.dropdown-item:hover:not(.disabled) {
  background-color: var(--color-surface-hover);
  transform: translateX(2px);
}

.dropdown-item.selected,
.dropdown-item.variant-selected {
  background-color: var(--color-primary-light);
  color: var(--color-primary);
  font-weight: 500;
}

.dropdown-item.variant-danger {
  color: var(--color-error);
}

.dropdown-item.variant-danger:hover:not(.disabled) {
  background-color: rgba(224, 122, 95, 0.1);
}

.dropdown-item.disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.dropdown-item.disabled:hover {
  background: none;
  transform: none;
}

.item-icon {
  font-size: 1rem;
  width: 24px;
  text-align: center;
  flex-shrink: 0;
}

.item-icon i {
  font-size: 1rem;
}

.item-text {
  flex: 1;
  min-width: 0;
  word-wrap: break-word;
  overflow-wrap: break-word;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* Responsive adjustments for very small screens */
@media (max-width: 320px) {
  .item-text {
    max-width: calc(100vw - 120px);
  }
}

.checkmark {
  color: var(--color-primary);
  font-weight: bold;
  margin-left: auto;
}

.checkmark i {
  font-size: 0.875rem;
}
</style>
