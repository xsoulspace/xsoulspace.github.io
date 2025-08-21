<template>
  <section class="scroll-snap-section" :aria-labelledby="title">
    <div class="content-column" role="region">
      <div v-for="(item, index) in items" :key="item.id" :ref="el => { if (el) contentRefs[index] = el; }" class="content-item">
        <h2>{{ item.title }}</h2>
        <p>{{ item.description }}</p>
        <!-- Add other project details here -->
      </div>
    </div>
    <div class="visual-column" role="region">
      <div class="visual-container">
        <div v-for="(item, index) in items" :key="item.id" class="visual-item" :class="{ 'is-active': activeSection === index }">
          <!-- Placeholder for media - we'll add images/videos later -->
          <div class="media-placeholder">
            <img v-if="item.media.type === 'image'" :src="item.media.url" :alt="item.title">
            <p v-else>Visual for {{ item.title }}</p>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue';

interface Project {
  id: string;
  title: string;
  description: string;
  media: { type: 'image' | 'video', url: string };
}

defineProps<{ title: string, items: Project[] }>();

const activeSection = ref(0);
const contentRefs = ref<HTMLElement[]>([]);
let observer: IntersectionObserver;

onMounted(() => {
  if ('IntersectionObserver' in window) {
    observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const index = contentRefs.value.findIndex(el => el === entry.target);
          if (index !== -1) {
            activeSection.value = index;
          }
        }
      });
    }, { threshold: 0.5, rootMargin: '-40% 0px -40% 0px' });

    contentRefs.value.forEach(item => {
      if (item) observer.observe(item);
    });
  }
});

onUnmounted(() => {
  if (observer) {
    contentRefs.value.forEach(item => {
      if (item) observer.unobserve(item);
    });
  }
});
</script>

<style scoped>
.scroll-snap-section {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: var(--spacing-xl);
  min-height: 100vh;
  padding: var(--spacing-xl);
}

.content-column {
  display: flex;
  flex-direction: column;
  gap: var(--spacing-xxl);
}

.content-item {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: var(--spacing-xl);
  background: var(--color-surface);
  border-radius: var(--border-radius-lg);
  border: 1px solid var(--color-border);
}

.visual-column {
  position: sticky;
  top: 0;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
}

.visual-container {
  position: relative;
  width: 100%;
  height: 80%;
  max-width: 500px;
  max-height: 700px;
}

.visual-item {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0;
  transition: opacity 0.5s ease;
  display: flex;
  align-items: center;
  justify-content: center;
}

.visual-item.is-active {
  opacity: 1;
}

.media-placeholder {
  width: 100%;
  height: 100%;
  background-color: var(--color-border);
  border-radius: var(--border-radius-lg);
  display: flex;
  align-items: center;
  justify-content: center;
}

.media-placeholder img {
  max-width: 100%;
  max-height: 100%;
  border-radius: var(--border-radius-lg);
}

@media (max-width: 768px) {
  .scroll-snap-section {
    grid-template-columns: 1fr;
    padding: var(--spacing-lg);
  }
  .visual-column {
    order: -1; /* Visuals first on mobile */
    position: relative;
    height: 50vh;
  }
  .content-item {
    min-height: 50vh;
  }
}
</style>
