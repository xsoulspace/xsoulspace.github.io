<script setup lang="ts">
import { getProjects } from "@/services/projectService";
import type { Project } from "@/types/project";
import { nextTick, onBeforeUnmount, ref, watch } from "vue";
import { useI18n } from "vue-i18n";

// Import badge assets
import appStoreBlackEn from "@/assets/badges/app-store-black-en.svg";
import appStoreBlackRu from "@/assets/badges/app-store-black-ru.svg";
import googlePlayBadge from "@/assets/badges/google_play.png";
import rustoreDarkBadge from "@/assets/badges/rustore-dark.svg";
import snapstoreBadge from "@/assets/badges/snapstore.svg";
import itchIoIcon from "@/assets/icons/itch_io.svg";

const props = defineProps<{
  category: string;
}>();

const { locale } = useI18n();

// Helper function to detect YouTube URLs
const isYouTubeUrl = (url: string): boolean => {
  return url.includes("youtube.com") || url.includes("youtu.be");
};

// Helper function to convert YouTube URLs to embed URLs
const getYouTubeEmbedUrl = (url: string): string => {
  // Handle youtu.be short URLs
  if (url.includes("youtu.be/")) {
    const videoId = url.split("youtu.be/")[1].split("?")[0];
    return `https://www.youtube.com/embed/${videoId}`;
  }

  // Handle youtube.com URLs
  if (url.includes("youtube.com/watch?v=")) {
    const videoId = url.split("v=")[1].split("&")[0];
    return `https://www.youtube.com/embed/${videoId}`;
  }

  // Handle YouTube playlist URLs
  if (url.includes("youtube.com/playlist?list=")) {
    const playlistId = url.split("list=")[1].split("&")[0];
    return `https://www.youtube.com/embed/videoseries?list=${playlistId}`;
  }

  // Fallback - try to extract video ID from other YouTube URL formats
  const videoIdMatch = url.match(
    /(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/
  );
  if (videoIdMatch) {
    return `https://www.youtube.com/embed/${videoIdMatch[1]}`;
  }

  return url; // Return original URL if we can't parse it
};

// Helper function to get the appropriate icon/badge for a link
const getLinkIcon = (title: string, url: string) => {
  const lowerTitle = title.toLowerCase();
  const isComingSoon =
    !url || url.trim() === "" || lowerTitle.includes("coming soon");

  // Website links - use Font Awesome icon
  if (lowerTitle.includes("website") || lowerTitle.includes("site")) {
    return {
      type: "icon",
      icon: "fa-solid fa-globe",
      alt: "Website",
      comingSoon: false,
    };
  }

  // App Store links
  if (lowerTitle.includes("app store") || url.includes("apps.apple.com")) {
    return {
      type: "badge",
      path: locale.value === "en" ? appStoreBlackEn : appStoreBlackRu,
      alt: "App Store",
      comingSoon: isComingSoon,
    };
  }

  // Google Play links
  if (lowerTitle.includes("google play") || url.includes("play.google.com")) {
    return {
      type: "badge",
      path: googlePlayBadge,
      alt: "Google Play",
      comingSoon: isComingSoon,
    };
  }

  // RuStore links
  if (lowerTitle.includes("rustore") || url.includes("rustore.ru")) {
    return {
      type: "badge",
      path: rustoreDarkBadge,
      alt: "RuStore",
      comingSoon: isComingSoon,
    };
  }

  // Snap Store links
  if (lowerTitle.includes("snap") || url.includes("snapcraft.io")) {
    return {
      type: "badge",
      path: snapstoreBadge,
      alt: "Snap Store",
      comingSoon: isComingSoon,
    };
  }

  // Microsoft Store links
  if (lowerTitle.includes("microsoft") || url.includes("microsoft.com")) {
    return {
      type: "badge",
      path: "https://get.microsoft.com/images/en-us%20dark.svg",
      alt: "Microsoft Store",
      comingSoon: isComingSoon,
    };
  }

  // itch.io links
  if (lowerTitle.includes("itch.io") || url.includes("itch.io")) {
    return {
      type: "badge",
      path: itchIoIcon,
      alt: "itch.io",
      comingSoon: isComingSoon,
    };
  }

  // Default - external link icon
  return {
    type: "icon",
    icon: "fa-solid fa-external-link-alt",
    alt: "External Link",
    comingSoon: isComingSoon,
  };
};

// Helper function to get GitHub icon
const getGithubIcon = () => {
  return {
    type: "icon",
    icon: "fa-brands fa-github",
    alt: "GitHub Repository",
    comingSoon: false,
  };
};
const projects = ref<Project[]>([]);
const activeProjectId = ref<string | null>(null);
const contentItemRefs = ref<Map<string, HTMLElement>>(new Map());
const isLoading = ref(true);

let observer: IntersectionObserver;

const fetchData = async () => {
  isLoading.value = true;

  // Start fetching data immediately
  const dataPromise = getProjects(props.category, locale.value);

  // Clear existing observer while data is loading
  if (observer) {
    contentItemRefs.value.forEach((el) => observer.unobserve(el));
    contentItemRefs.value.clear();
  }

  // Wait for data
  projects.value = await dataPromise;

  if (projects.value.length > 0) {
    activeProjectId.value = projects.value[0].id;
  }

  isLoading.value = false;

  // Wait for DOM update before setting up observer
  nextTick(() => {
    setupObserver();
  });
};

const setupObserver = () => {
  if (observer) {
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
      root: null,
      rootMargin: "-50% 0px -50% 0px",
      threshold: 0,
    }
  );

  // Setup observer for existing elements
  contentItemRefs.value.forEach((el) => observer.observe(el));
};

// Preload data when component is created (before mount)
const preloadData = async () => {
  await fetchData();
};

// Start loading immediately
preloadData();

// Watch for locale changes
watch(locale, fetchData);

// Cleanup observer on unmount
onBeforeUnmount(() => {
  if (observer) {
    observer.disconnect();
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
    <!-- Loading state -->
    <div v-if="isLoading" class="loading-container">
      <div class="loading-spinner"></div>
      <p>Loading projects...</p>
    </div>

    <!-- Content when loaded -->
    <template v-else>
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
              <i
                :class="getGithubIcon().icon"
                class="link-icon font-awesome-icon github-icon"
                :alt="getGithubIcon().alt"
              ></i>
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
              <div
                v-if="getLinkIcon(link.title, link.url).type === 'badge'"
                class="badge-container"
                :class="{
                  'coming-soon': getLinkIcon(link.title, link.url).comingSoon,
                }"
              >
                <img
                  :src="getLinkIcon(link.title, link.url).path"
                  :alt="getLinkIcon(link.title, link.url).alt"
                  class="link-icon badge-icon"
                />
                <div
                  v-if="getLinkIcon(link.title, link.url).comingSoon"
                  class="coming-soon-overlay"
                >
                  Coming Soon
                </div>
              </div>
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
            <div class="media-placeholder" @click.stop>
              <img
                v-if="project.media.type === 'image'"
                :src="project.media.url"
                :alt="project.title"
              />
              <!-- YouTube videos -->
              <iframe
                v-else-if="
                  project.media.type === 'video' &&
                  isYouTubeUrl(project.media.url)
                "
                :src="getYouTubeEmbedUrl(project.media.url)"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen
                class="youtube-video"
                @click.stop
              ></iframe>
              <!-- Direct video files -->
              <video
                v-else-if="project.media.type === 'video'"
                :src="project.media.url"
                autoplay
                muted
                loop
                class="direct-video"
                @click.stop
              ></video>
            </div>
          </div>
        </div>
      </div>
    </template>
  </div>
</template>

<style scoped>
.loading-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
  gap: var(--spacing-md);
}

.loading-spinner {
  width: 40px;
  height: 40px;
  border: 3px solid var(--color-border);
  border-top: 3px solid var(--color-primary);
  border-radius: 50%;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

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
  gap: var(--spacing-sm);
  align-items: center;
  flex-wrap: wrap;
}

.link-item {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: var(--spacing-xs);
  border-radius: var(--border-radius-md);
  transition: all 0.2s ease;
  min-width: 44px;
  min-height: 44px;
}

.link-item:hover {
  background-color: var(--color-primary-light);
  transform: translateY(-1px);
}

.link-icon {
  height: 32px;
  width: 32px;
  object-fit: contain;
  transition: all 0.2s ease;
}

.github-icon {
  opacity: 0.8;
  filter: grayscale(20%);
}

.github-icon:hover {
  opacity: 1;
  filter: grayscale(0%);
}

.font-awesome-icon {
  font-size: 28px;
  color: var(--color-text-secondary);
  display: flex;
  align-items: center;
  justify-content: center;
}

.font-awesome-icon:hover {
  color: var(--color-primary);
  transform: scale(1.1);
}

.badge-icon {
  height: 32px;
  width: auto;
  max-width: 120px;
  border-radius: var(--border-radius-sm);
  box-shadow: var(--shadow-sm);
  transition: all 0.2s ease;
}

.badge-icon:hover {
  box-shadow: var(--shadow-md);
  transform: scale(1.05);
}

.micro-badge {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  font-size: 10px;
  font-weight: 600;
  color: var(--color-text-secondary);
  background-color: var(--color-surface);
  border: 1px solid var(--color-border);
  border-radius: var(--border-radius-sm);
  padding: 2px 6px;
  white-space: nowrap;
  transition: all 0.2s ease;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.micro-badge:hover {
  background-color: var(--color-primary-light);
  color: var(--color-primary);
  border-color: var(--color-primary);
  transform: scale(1.05);
}

.badge-container {
  position: relative;
  display: inline-block;
}

.badge-container.coming-soon .badge-icon {
  opacity: 0.6;
  filter: grayscale(50%);
}

.coming-soon-overlay {
  position: absolute;
  top: 2px;
  right: 2px;
  background-color: var(--color-primary);
  color: var(--color-on-primary);
  font-size: 8px;
  font-weight: 700;
  padding: 2px 4px;
  border-radius: var(--border-radius-sm);
  text-transform: uppercase;
  letter-spacing: 0.3px;
  white-space: nowrap;
  box-shadow: var(--shadow-sm);
  z-index: 1;
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
  pointer-events: none;
  transition: opacity 0.5s ease;
  display: flex;
  align-items: center;
  justify-content: center;
}

.visual-item.is-active {
  opacity: 1;
  pointer-events: auto;
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

.youtube-video,
.direct-video {
  width: 100%;
  height: 100%;
  border-radius: var(--border-radius-lg);
  border: none;
}

.youtube-video {
  background-color: #000; /* YouTube player background */
}

.direct-video {
  object-fit: contain;
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
