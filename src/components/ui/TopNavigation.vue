<script setup lang="ts">
import { useLocale } from "@/composables/useLocale";
import { computed, ref } from "vue";
import { useRoute, useRouter } from "vue-router";

const { setLocale, locale, t } = useLocale();
const route = useRoute();
const router = useRouter();

const showDropdown = ref(false);
const showLangDropdown = ref(false);

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

// Get current language display
const currentLangDisplay = computed(() => locale.value.toUpperCase());

// Available languages
const languages = [
  { code: "en", name: "English" },
  { code: "ru", name: "Русский" },
];

// Navigate to page
const navigateTo = (path: string) => {
  router.push(path);
  showDropdown.value = false;
};

// Change language
const changeLanguage = (langCode: string) => {
  setLocale(langCode as "en" | "ru");
  showLangDropdown.value = false;
};

// Toggle dropdowns
const toggleDropdown = () => {
  showDropdown.value = !showDropdown.value;
  showLangDropdown.value = false;
};

const toggleLangDropdown = () => {
  showLangDropdown.value = !showLangDropdown.value;
  showDropdown.value = false;
};

// Open dropdowns on hover
const openMenuDropdown = () => {
  showDropdown.value = true;
  showLangDropdown.value = false;
};

const openLangDropdown = () => {
  showLangDropdown.value = true;
  showDropdown.value = false;
};

// Close dropdowns when clicking outside
const closeDropdowns = () => {
  showDropdown.value = false;
  showLangDropdown.value = false;
};
</script>

<template>
  <div class="top-navigation" @mouseleave="closeDropdowns">
    <div class="nav-container">
      <!-- Current Page Display -->
      <div class="page-display">
        <span class="page-name">{{ currentPageName }}</span>
      </div>

      <!-- Navigation Menu -->
      <div class="nav-menu">
        <!-- Navigation Dropdown -->
        <div class="dropdown-container" @mouseenter="openMenuDropdown">
          <button
            class="nav-button"
            @click="toggleDropdown"
            :class="{ active: showDropdown }"
          >
            <span class="button-icon"><i class="fas fa-bars"></i></span>
            <span class="button-text">Menu</span>
          </button>

          <div v-if="showDropdown" class="dropdown-menu">
            <div class="dropdown-section">
              <div class="dropdown-header">Navigate</div>
              <a
                v-for="item in navItems"
                :key="item.key"
                :href="item.path"
                class="dropdown-item"
                @click.prevent="navigateTo(item.path)"
              >
                <span class="item-icon"><i :class="item.icon"></i></span>
                <span class="item-text">{{ t(`nav.${item.key}`) }}</span>
              </a>
            </div>
          </div>
        </div>

        <!-- Language Switcher -->
        <div class="dropdown-container" @mouseenter="openLangDropdown">
          <button
            class="lang-button"
            @click="toggleLangDropdown"
            :class="{ active: showLangDropdown }"
          >
            <span class="lang-text">{{ currentLangDisplay }}</span>
            <span class="dropdown-arrow"
              ><i class="fas fa-chevron-down"></i
            ></span>
          </button>

          <div v-if="showLangDropdown" class="dropdown-menu lang-dropdown">
            <div class="dropdown-section">
              <div class="dropdown-header">Language</div>
              <button
                v-for="lang in languages"
                :key="lang.code"
                class="dropdown-item lang-item"
                :class="{ selected: locale === lang.code }"
                @click="changeLanguage(lang.code)"
              >
                <span class="item-text">{{ lang.name }}</span>
                <span v-if="locale === lang.code" class="checkmark"
                  ><i class="fas fa-check"></i
                ></span>
              </button>
            </div>
          </div>
        </div>
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
  background: rgba(var(--color-background, 255, 255, 255), 0.8);
  backdrop-filter: blur(12px);
  border: 1px solid var(--color-border, rgba(0, 0, 0, 0.1));
  transition: all 0.3s ease;
  border-radius: var(--border-radius-xl);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.nav-container {
  margin: 0 auto;
  padding: 0 var(--spacing-lg, 1rem);
  display: flex;
  align-items: center;
  justify-content: center;
  gap: var(--spacing-lg);
  min-height: 50px;
}

.page-display {
  /* flex: 1; */ /* Removed */
  text-align: center;
}

.page-name {
  font-size: 1.25rem;
  font-weight: 600;
  color: var(--color-text, #333);
  background: linear-gradient(
    135deg,
    var(--color-primary, #007bff),
    var(--color-secondary, #6c757d)
  );
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.nav-menu {
  display: flex;
  gap: var(--spacing-md, 0.75rem);
  align-items: center;
}

.nav-button,
.lang-button {
  background: var(--color-background, #fff);
  border: none; /* 1px solid var(--color-border, rgba(0, 0, 0, 0.1)); */
  padding: var(--spacing-sm, 0.5rem) var(--spacing-md, 0.75rem);
  border-radius: var(--border-radius-md, 8px);
  cursor: pointer;
  font-size: 0.875rem;
  font-weight: 500;
  color: var(--color-text, #333);
  transition: all 0.2s ease;
  display: flex;
  align-items: center;
  gap: var(--spacing-sm, 0.5rem);
  position: relative;
}

.nav-button:hover,
.lang-button:hover {
  background-color: var(--color-surface-hover, #f8f9fa);
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.nav-button.active,
.lang-button.active {
  background-color: var(--color-primary, #007bff);
  color: var(--color-on-primary, #fff);
  border-color: var(--color-primary, #007bff);
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

.dropdown-container {
  position: relative;
}

.dropdown-menu {
  position: absolute;
  top: 100%;
  right: 0;
  margin-top: var(--spacing-sm, 0.5rem);
  background: var(--color-surface, #fff);
  border: 1px solid var(--color-border, rgba(0, 0, 0, 0.1));
  border-radius: var(--border-radius-md, 8px);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
  min-width: 200px;
  z-index: 1001;
  animation: dropdownSlideIn 0.2s ease;
}

.lang-dropdown {
  min-width: 150px;
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

.dropdown-section {
  padding: var(--spacing-sm, 0.5rem);
}

.dropdown-header {
  font-size: 0.75rem;
  font-weight: 600;
  color: var(--color-text-secondary, #666);
  text-transform: uppercase;
  letter-spacing: 0.05em;
  margin-bottom: var(--spacing-sm, 0.5rem);
  padding-bottom: var(--spacing-xs, 0.25rem);
  border-bottom: 1px solid var(--color-border, rgba(0, 0, 0, 0.1));
}

.dropdown-item {
  display: flex;
  align-items: center;
  gap: var(--spacing-sm, 0.5rem);
  padding: var(--spacing-sm, 0.5rem);
  width: 100%;
  border: none;
  background: none;
  text-decoration: none;
  color: var(--color-text, #333);
  cursor: pointer;
  border-radius: var(--border-radius-sm, 4px);
  transition: all 0.2s ease;
  text-align: left;
}

.dropdown-item:hover {
  background-color: var(--color-surface-hover, #f8f9fa);
  transform: translateX(2px);
}

.lang-item {
  justify-content: space-between;
}

.lang-item.selected {
  background-color: var(--color-primary-light, rgba(0, 123, 255, 0.1));
  color: var(--color-primary, #007bff);
  font-weight: 500;
}

.checkmark {
  color: var(--color-primary, #007bff);
  font-weight: bold;
}

.checkmark i {
  font-size: 0.875rem;
}

.item-icon {
  font-size: 1rem;
  width: 20px;
  text-align: center;
}

.item-icon i {
  font-size: 1rem;
}

.item-text {
  flex: 1;
  white-space: normal;
  word-break: break-word;
  min-width: 0;
}

/* Mobile responsive */
@media (max-width: 768px) {
  .nav-container {
    padding: 0 var(--spacing-md, 0.75rem);
    min-height: 50px;
  }

  .page-name {
    font-size: 1rem;
    display: none; /* Hide page name on small screens for compactness */
  }

  .nav-button,
  .lang-button {
    padding: var(--spacing-xs, 0.25rem) var(--spacing-sm, 0.5rem);
    font-size: 0.75rem;
  }

  .button-text {
    display: none;
  }

  .dropdown-menu {
    right: -100px;
    min-width: 180px;
  }

  .lang-dropdown {
    right: -50px;
    min-width: 120px;
  }
}
</style>
