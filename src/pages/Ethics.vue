<script setup lang="ts">
import EthicsBentoGrid from "@/components/ui/EthicsBentoGrid.vue";
import EthicsLetter from "@/components/ui/EthicsLetter.vue";
import { useSEO } from "@/composables/useSEO";
import { getProjects } from "@/services/projectService";
import type { Project } from "@/types/project";
import M_ from "markdown-it";
import { onMounted, ref, watch } from "vue";
import { useI18n } from "vue-i18n";

useSEO({
  title: "Ethics & Values | xsoulspace",
  description:
    "The core principles, values, and philosophy that guide everything we create at xsoulspace.",
});

const { locale } = useI18n();
const principles = ref<Project[]>([]);
const letterHtml = ref("");

const fetchData = async () => {
  principles.value = await getProjects("ethics", locale.value);

  // Fetch and render the markdown letter
  const letterModule = await import(
    `@/data/${locale.value}/ethics_letter.md?raw`
  );
  const md = new M_();
  letterHtml.value = md.render(letterModule.default);
};

onMounted(fetchData);

watch(locale, fetchData);
</script>

<template>
  <div class="ethics-page">
    <!-- Hero Section -->
    <section class="hero-section">
      <div class="hero-content">
        <h1 class="hero-title">Ethics & Values</h1>
        <p class="hero-subtitle">
          The principles that helps to make decisions for building products,
          writing code and creating content.
        </p>
      </div>
    </section>

    <!-- Principles Grid -->
    <section class="principles-section">
      <EthicsBentoGrid :items="principles" />
    </section>

    <!-- Philosophy Letter -->
    <section class="letter-section">
      <EthicsLetter :content="letterHtml" />
    </section>
  </div>
</template>

<style scoped>
.ethics-page {
  min-height: 100vh;
  background: var(--color-background);
}

/* Hero Section */
.hero-section {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 50vh;
  margin-bottom: var(--spacing-xxl);
  overflow: hidden;
}

.hero-content {
  text-align: center;
  position: relative;
  z-index: 2;
  max-width: 800px;
  padding: var(--spacing-xl);
}

.hero-title {
  font-family: var(--font-family);
  font-size: clamp(3rem, 8vw, 6rem);
  font-weight: 700;
  color: var(--color-text);
  letter-spacing: -0.02em;
  line-height: 1.1;
  margin: 0 0 var(--spacing-lg) 0;
}

.hero-subtitle {
  font-family: var(--font-family);
  font-size: clamp(1.1rem, 2.5vw, 1.4rem);
  line-height: 1.6;
  color: var(--color-text-secondary);
  max-width: 600px;
  margin: 0 auto;
  font-weight: 400;
  letter-spacing: 0.01em;
}

/* Principles Section */
.principles-section {
  position: relative;
  margin-bottom: var(--spacing-xxl);
}

/* Letter Section */
.letter-section {
  margin-top: var(--spacing-xxl);
}

/* Responsive Design */
@media (max-width: 768px) {
  .hero-section {
    min-height: 40vh;
    margin-bottom: var(--spacing-xl);
  }

  .hero-content {
    padding: var(--spacing-lg);
  }

  .principles-section {
    margin-bottom: var(--spacing-xl);
  }
}

@media (max-width: 480px) {
  .hero-section {
    min-height: 35vh;
  }

  .hero-subtitle {
    font-size: 1rem;
    line-height: 1.5;
  }
}

/* Dark mode enhancements */
@media (prefers-color-scheme: dark) {
  .hero-title {
    color: #faf6f0;
    text-shadow: 0 2px 8px rgba(0, 0, 0, 0.4);
  }

  .hero-subtitle {
    color: rgba(250, 246, 240, 0.7);
  }
}
</style>
