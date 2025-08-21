<script setup lang="ts">
import { useLocale } from "@/composables/useLocale";
import { computed } from "vue";
import { useRoute, useRouter } from "vue-router";
import LanguageDropdown from "./LanguageDropdown.vue";
import NavigationDropdown from "./NavigationDropdown.vue";

const { setLocale, locale, t } = useLocale();
const route = useRoute();
const router = useRouter();

// Navigation items with their routes and Font Awesome icons
const navItems = [
  { key: "apps", path: "/apps", icon: "fas fa-mobile-alt" },
  { key: "games", path: "/games", icon: "fas fa-gamepad" },
  { key: "utilities", path: "/utilities", icon: "fas fa-tools" },
  { key: "foundation", path: "/foundation", icon: "fas fa-building" },
  { key: "ethics", path: "/ethics", icon: "fas fa-balance-scale" },
];

// Get current page name
const currentPageName = computed(() => {
  if (route.path === "/") {
    return t("nav.about");
  }

  const currentNavItem = navItems.find((item) => item.path === route.path);
  return currentNavItem ? t(`nav.${currentNavItem.key}`) : "Unknown";
});

// Available languages
const languages = [
  { code: "en", name: "English" },
  { code: "ru", name: "Русский" },
];

// Navigate to page
const handleNavigate = (path: string) => {
  router.push(path);
};

// Change language
const handleLanguageChange = (langCode: string) => {
  setLocale(langCode as "en" | "ru");
};
</script>

<template>
  <div class="top-navigation">
    <div class="nav-container">
      <!-- Current Page Display -->
      <div class="page-display">
        <span class="page-name">{{ currentPageName }}</span>
      </div>

      <!-- Navigation Menu -->
      <div class="nav-menu">
        <!-- Navigation Dropdown -->
        <NavigationDropdown
          :items="navItems"
          trigger="hover"
          placement="bottom-end"
          title="Navigate"
          :get-item-label="(item) => t(`nav.${item.key}`)"
          @navigate="handleNavigate"
        />

        <!-- Language Switcher -->
        <LanguageDropdown
          :languages="languages"
          :current-language="locale"
          trigger="hover"
          placement="bottom-end"
          title="Language"
          @change="handleLanguageChange"
        />
      </div>
    </div>
  </div>
</template>

<style scoped>
.top-navigation {
  position: fixed;
  top: var(--spacing-md);
  left: 50%;
  transform: translateX(-50%);
  width: fit-content;
  z-index: 1000;
  background: rgba(250, 246, 240, 0.8);
  backdrop-filter: blur(12px);
  border: 1px solid var(--color-border);
  transition: all 0.3s ease;
  border-radius: var(--border-radius-xl);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.nav-container {
  margin: 0 auto;
  padding: 0 var(--spacing-lg);
  display: flex;
  align-items: center;
  justify-content: center;
  gap: var(--spacing-lg);
  min-height: 50px;
}

.page-display {
  text-align: center;
}

.page-name {
  font-size: 1.25rem;
  font-weight: 600;
  color: var(--color-text);
  background: linear-gradient(
    135deg,
    var(--color-primary),
    var(--color-secondary)
  );
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.nav-menu {
  display: flex;
  gap: var(--spacing-md);
  align-items: center;
}

/* Mobile responsive */
@media (max-width: 768px) {
  .nav-container {
    padding: 0 var(--spacing-md);
    min-height: 50px;
  }

  .page-name {
    font-size: 1rem;
    display: none; /* Hide page name on small screens for compactness */
  }
}
</style>
