<script setup lang="ts">
import { getProjects } from "@/services/projectService";
import type { Project } from "@/types/project";
import { nextTick, onBeforeUnmount, onMounted, ref, watch } from "vue";
import { useI18n } from "vue-i18n";

const props = defineProps<{
  category: string;
}>();

const { locale } = useI18n();

// Helper function to get the appropriate icon/badge for a link
const getLinkIcon = (title: string, url: string) => {
  const lowerTitle = title.toLowerCase();

  // Website links - use Font Awesome icon
  if (lowerTitle.includes("website") || lowerTitle.includes("site")) {
    return {
      type: "icon",
      icon: "fa-solid fa-globe",
      alt: "Website",
    };
  }

  // App Store links
  if (lowerTitle.includes("app store") || url.includes("apps.apple.com")) {
    return {
      type: "badge",
      path: `/src/assets/badges/app-store-black-${locale.value}.svg`,
      alt: "App Store",
    };
  }

  // Google Play links
  if (lowerTitle.includes("google play") || url.includes("play.google.com")) {
    return {
      type: "badge",
      path: "/src/assets/badges/google_play.png",
      alt: "Google Play",
    };
  }

  // RuStore links
  if (lowerTitle.includes("rustore") || url.includes("rustore.ru")) {
    return {
      type: "badge",
      path: "/src/assets/badges/rustore-dark.svg",
      alt: "RuStore",
    };
  }

  // Snap Store links
  if (lowerTitle.includes("snap") || url.includes("snapcraft.io")) {
    return {
      type: "badge",
      path: "/src/assets/badges/snapstore.svg",
      alt: "Snap Store",
    };
  }

  // Default - external link icon
  return {
    type: "icon",
    icon: "fa-solid fa-external-link-alt",
    alt: "External Link",
  };
};

// Helper function to get GitHub icon
const getGithubIcon = () => {
  return {
    type: "image",
    path: "/src/assets/icons/github/GitHub-Mark-32px.png",
    alt: "GitHub Repository",
  };
};
const projects = ref<Project[]>([]);
const activeProjectId = ref<string | null>(null);
const contentItemRefs = ref<Map<string, HTMLElement>>(new Map());

let observer: IntersectionObserver;

const fetchData = async () => {
  // Clear existing observer before fetching new data
  if (observer) {
    contentItemRefs.value.forEach((el) => observer.unobserve(el));
    contentItemRefs.value.clear();
  }

  projects.value = await getProjects(props.category, locale.value);

  if (projects.value.length > 0) {
    activeProjectId.value = projects.value[0].id;
  }

  // We need to wait for the DOM to update with the new projects
  // before we can set up the observer on the new elements.
  // nextTick is perfect for this.
  await nextTick();

  setupObserver();
};

const setupObserver = () => {
  if (observer) {
    // Disconnect old observer if exists
    observer.disconnect();
  }

  observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          const id = (entry.target as HTMLElement).dataset.id;
          if (id) {
            activeProjectId.value = id;
          }
        }
      });
    },
    {
      root: null, // viewport
      rootMargin: "-50% 0px -50% 0px", // Trigger when the element is in the vertical center
      threshold: 0,
    }
  );

  contentItemRefs.value.forEach((el) => observer.observe(el));
};

onMounted(fetchData);

watch(locale, fetchData);

onBeforeUnmount(() => {
  if (observer) {
    contentItemRefs.value.forEach((el) => observer.unobserve(el));
  }
});

const setContentItemRef = (el: any, id: string) => {
  if (el) {
    contentItemRefs.value.set(id, el);
  } else {
    contentItemRefs.value.delete(id);
  }
};
</script>

<template>
  <div class="scroll-snap-section">
    <div class="content-column">
      <div
        v-for="project in projects"
        :key="project.id"
        :ref="(el) => setContentItemRef(el, project.id)"
        class="content-item"
        :data-id="project.id"
      >
        <h2>{{ project.title }}</h2>
        <p v-if="project.subtitle">{{ project.subtitle }}</p>
        <p>{{ project.description }}</p>
        <div v-if="project.tags" class="tags">
          <span v-for="tag in project.tags" :key="tag" class="tag">
            {{ tag }}
          </span>
        </div>
        <div class="project-links">
          <!-- Repository link (GitHub) -->
          <a
            v-if="project.repository"
            :href="project.repository"
            target="_blank"
            class="link-item"
            :title="'View source code on GitHub'"
          >
            <img
              :src="getGithubIcon().path"
              :alt="getGithubIcon().alt"
              class="link-icon github-icon"
            />
          </a>

          <!-- Project links (website, app stores, etc.) -->
          <a
            v-for="link in project.links || []"
            :key="link.url"
            :href="link.url"
            target="_blank"
            class="link-item"
            :title="link.title"
          >
            <!-- Font Awesome icons -->
            <i
              v-if="getLinkIcon(link.title, link.url).type === 'icon'"
              :class="getLinkIcon(link.title, link.url).icon"
              class="link-icon font-awesome-icon"
              :alt="getLinkIcon(link.title, link.url).alt"
            ></i>

            <!-- Badge images -->
            <img
              v-else-if="getLinkIcon(link.title, link.url).type === 'badge'"
              :src="getLinkIcon(link.title, link.url).path"
              :alt="getLinkIcon(link.title, link.url).alt"
              class="link-icon badge-icon"
            />
          </a>
        </div>
      </div>
    </div>
    <div class="visual-column">
      <div class="visual-container">
        <div
          v-for="project in projects"
          :key="project.id"
          class="visual-item"
          :class="{ 'is-active': activeProjectId === project.id }"
        >
          <div class="media-placeholder">
            <img
              v-if="project.media.type === 'image'"
              :src="project.media.url"
              :alt="project.title"
            />
            <video
              v-else-if="project.media.type === 'video'"
              :src="project.media.url"
              autoplay
              muted
              loop
            ></video>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.tags {
  margin-top: var(--spacing-md);
  display: flex;
  flex-wrap: wrap;
  gap: var(--spacing-xs);
}

.tag {
  background-color: var(--color-surface);
  color: var(--color-text-secondary);
  padding: var(--spacing-xs) var(--spacing-sm);
  border-radius: var(--border-radius-sm);
  font-size: 0.85rem;
  font-weight: 500;
  border: 1px solid var(--color-border);
  transition: all 0.2s ease;
}

.tag:hover {
  background-color: var(--color-primary-light);
  color: var(--color-primary);
  border-color: var(--color-primary);
}

.project-links {
  margin-top: var(--spacing-lg);
  display: flex;
  gap: var(--spacing-md);
  align-items: center;
}

.link-item {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  transition: transform 0.2s ease, opacity 0.2s ease;
}

.link-item:hover {
  transform: scale(1.05);
  opacity: 0.8;
}

.link-icon {
  height: 32px;
  width: auto;
  object-fit: contain;
}

.github-icon {
  height: 28px;
  opacity: 0.7;
  transition: opacity 0.2s ease;
}

.github-icon:hover {
  opacity: 1;
}

.font-awesome-icon {
  font-size: 24px;
  color: var(--color-text-secondary);
  transition: color 0.2s ease;
}

.font-awesome-icon:hover {
  color: var(--color-primary);
}

.badge-icon {
  height: 36px;
  border-radius: var(--border-radius-sm);
  box-shadow: var(--shadow-sm);
  transition: box-shadow 0.2s ease;
}

.badge-icon:hover {
  box-shadow: var(--shadow-md);
}

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
