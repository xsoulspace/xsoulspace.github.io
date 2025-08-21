<script setup lang="ts">
import type { DropdownProps } from "@/types/dropdown";
import { onMounted, onUnmounted, ref } from "vue";

interface Props extends DropdownProps {}

const props = withDefaults(defineProps<Props>(), {
  trigger: "click",
  placement: "bottom-end",
  offset: 8,
  width: "auto",
  maxWidth: "280px",
  minWidth: "220px",
});

const emit = defineEmits<{
  open: [];
  close: [];
}>();

const isOpen = ref(false);
const dropdownRef = ref<HTMLElement>();
const triggerRef = ref<HTMLElement>();

// Toggle dropdown
const toggle = () => {
  isOpen.value = !isOpen.value;
  if (isOpen.value) {
    emit("open");
  } else {
    emit("close");
  }
};

// Open dropdown
const open = () => {
  if (!isOpen.value) {
    isOpen.value = true;
    emit("open");
  }
};

// Close dropdown
const close = () => {
  if (isOpen.value) {
    isOpen.value = false;
    emit("close");
  }
};

// Handle click outside
const handleClickOutside = (event: Event) => {
  if (
    dropdownRef.value &&
    triggerRef.value &&
    !dropdownRef.value.contains(event.target as Node) &&
    !triggerRef.value.contains(event.target as Node)
  ) {
    close();
  }
};

// Handle hover events with delay to prevent flickering
let closeTimeout: number | null = null;

const handleMouseEnter = () => {
  if (props.trigger === "hover") {
    if (closeTimeout) {
      clearTimeout(closeTimeout);
      closeTimeout = null;
    }
    open();
  }
};

const handleMouseLeave = () => {
  if (props.trigger === "hover") {
    // Add small delay to allow seamless movement between trigger and dropdown
    closeTimeout = window.setTimeout(() => {
      close();
    }, 150);
  }
};

// Expose methods to parent
defineExpose({
  open,
  close,
  toggle,
  isOpen: () => isOpen.value,
});

// Lifecycle
onMounted(() => {
  if (props.trigger === "click") {
    document.addEventListener("click", handleClickOutside);
  }
});

onUnmounted(() => {
  if (props.trigger === "click") {
    document.removeEventListener("click", handleClickOutside);
  }
  if (closeTimeout) {
    clearTimeout(closeTimeout);
  }
});
</script>

<template>
  <div
    class="base-dropdown"
    @mouseenter="handleMouseEnter"
    @mouseleave="handleMouseLeave"
  >
    <!-- Trigger slot -->
    <div ref="triggerRef" @click="props.trigger === 'click' ? toggle() : null">
      <slot name="trigger" :is-open="isOpen" :toggle="toggle" />
    </div>

    <!-- Dropdown content -->
    <Transition name="dropdown">
      <div
        v-if="isOpen"
        ref="dropdownRef"
        class="dropdown-content"
        :class="[`placement-${placement}`]"
        :style="{
          width: width,
          maxWidth: maxWidth,
          minWidth: minWidth,
          marginTop: `${offset}px`,
        }"
      >
        <slot />
      </div>
    </Transition>
  </div>
</template>

<style scoped>
.base-dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  position: absolute;
  background: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--border-radius-md);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
  z-index: 1001;
  overflow: hidden;
  box-sizing: border-box;
  animation: dropdownSlideIn 0.2s ease;
}

/* Placement classes */
.placement-bottom-start {
  top: 100%;
  left: 0;
}

.placement-bottom-end {
  top: 100%;
  right: 0;
}

.placement-top-start {
  bottom: 100%;
  left: 0;
}

.placement-top-end {
  bottom: 100%;
  right: 0;
}

/* Animation */
.dropdown-enter-active,
.dropdown-leave-active {
  transition: all 0.2s ease;
}

.dropdown-enter-from {
  opacity: 0;
  transform: translateY(-8px);
}

.dropdown-leave-to {
  opacity: 0;
  transform: translateY(-8px);
}

@keyframes dropdownSlideIn {
  from {
    opacity: 0;
    transform: translateY(-8px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Mobile responsive */
@media (max-width: 768px) {
  .placement-bottom-end {
    right: 0;
    left: auto;
    max-width: calc(100vw - 32px);
  }

  .placement-bottom-start {
    left: 0;
    right: auto;
    max-width: calc(100vw - 32px);
  }

  .dropdown-content {
    max-width: calc(100vw - 32px);
    width: auto;
  }
}
</style>
