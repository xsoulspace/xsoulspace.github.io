### **Project Refactoring & Implementation Plan**

The goal is to transform the current website into a modern, responsive, and multilingual landing experience using Vue 3, following the principles outlined in your documentation.

---

### **Phase 1: Foundational Setup & Core Systems**

This phase focuses on restructuring the project, setting up core systems for routing, state management, design, and internationalization.

1.  **Project Cleanup & Scaffolding:**
    *   Remove existing, now-obsolete components: `src/components/ProjectCard.vue`, `src/components/ProjectGrid.vue`.
    *   Remove the old data structure: `src/data/projects.yaml`.
    *   Create a new, more organized directory structure as recommended in `vue-landing-guide.mdc`:
        *   `src/components/layout/`, `src/components/sections/`, `src/components/ui/`
        *   `src/composables/`
        *   `src/router/`
        *   `src/locales/`
        *   `src/pages/`

2.  **Install Dependencies:**
    *   Add `vue-router` for multi-page navigation.
    *   Add `vue-i18n` for multilingual support (en/ru).
    *   Add `@vueuse/core` and `@vueuse/head` for utility composables and SEO management.

3.  **Routing (`vue-router`):**
    *   Create a router configuration file (`src/router/index.ts`).
    *   Define the following routes:
        *   `/`: The main landing page with 5-row navigation.
        *   `/apps`: Apps showcase page.
        *   `/games`: Games showcase page.
        *   `/utilities`: Utilities showcase page.
        *   `/foundation`: Foundation packages page.
        *   `/ethics`: Ethics page.

4.  **Design System (`docs/COLOR_SCHEME.md`):**
    *   Create a `useDesignSystem.ts` composable.
    *   Implement the "Ceramic & Clay" color palette as CSS custom properties injected into the root.
        *   `--color-background: #FAF6F0;` (Unglazed Bisque)
        *   `--color-text: #4E342E;` (Earthy Brown)
        *   `--color-primary: #E07A5F;` (Terracotta)
        *   `--color-secondary: #81B29A;` (Sage Glaze)
        *   `--color-highlight: #F2CC8F;` (Sandstone)
    *   Define typography and spacing tokens as CSS variables for sitewide consistency.

5.  **Internationalization (i18n):**
    *   Configure `vue-i18n`.
    *   Create locale files: `src/locales/en.ts` and `src/locales/ru.ts`.
    *   Create a `useLocale.ts` composable to manage language switching and provide translation strings (`t`) to components.

---

### **Phase 2: Core Component Development**

This phase involves building the reusable components that form the building blocks of the site.

1.  **Layout Components:**
    *   `AppLayout.vue`: A main wrapper containing the header, a `<router-view />` for page content, and the footer.
    *   `AppFooter.vue`: The site-wide footer, which will implement the "ABOUT" section content as specified.

2.  **UI Components:**
    *   `ThemedButton.vue`: A versatile button component that can be styled with the design system's colors.
    *   `CodeBlock.vue`: A component for syntax highlighting, to be used on the "FOUNDATION" page.

3.  **Main Navigation Component:**
    *   `HomeNavigation.vue`: A component dedicated to the main page, displaying the five full-width, clickable rows (APPS/GAMES, UTILITIES, FOUNDATION, ETHICS, ABOUT).

---

### **Phase 3: Page Construction**

With the core components ready, this phase focuses on assembling the individual pages.

1.  **Home Page (`src/pages/Index.vue`):**
    *   This page will primarily feature the `HomeNavigation.vue` component, serving as the site's main entry point.

2.  **Showcase Pages (`/apps`, `/games`, `/utilities`):**
    *   Create a reusable `ProjectShowcasePage.vue` component that implements the two-column CSS Scroll Snap layout from `css_scroll_snap_layout.mdc`.
    *   This component will accept an array of projects as a prop.
    *   The left column will display project details (title, description).
    *   The right column will be a sticky container displaying the associated media (GIF/YouTube).
    *   Create `Apps.vue`, `Games.vue`, and `Utilities.vue` pages that use `ProjectShowcasePage.vue` and pass the relevant project data to it.

3.  **Foundation Page (`src/pages/Foundation.vue`):**
    *   This page will also use a two-column layout.
    *   **Left Column:** A scrollable, condensed list of all foundation packages. Clicking an item will update the right column.
    *   **Right Column:** Displays the selected package's purpose, a `CodeBlock.vue` with an example, and links to GitHub/pub.dev.

4.  **Ethics Page (`src/pages/Ethics.vue`):**
    *   This page will be implemented using a CSS Grid-based "Bento Box" layout to visually separate and present the core principles.
    *   Below the bento grid, a section will be dedicated to the letter explaining the "why".

---

### **Phase 4: Content & Data Integration**

This phase involves populating the site with its actual content.

1.  **Data Modeling:**
    *   Create TypeScript files (`src/data/apps.ts`, `src/data/games.ts`, etc.) to define and store the project information, including titles, descriptions, media URLs, and code examples. This provides type safety.

2.  **Populate Locale Files:**
    *   Translate all UI strings, project descriptions, and page content into both English and Russian within the `en.ts` and `ru.ts` files.

3.  **Asset Management:**
    *   Place all images, GIFs, and other media assets into a structured `src/assets/media/` directory.

---

### **Phase 5: Finalization & Polish**

The final phase ensures the site is robust, accessible, and optimized.

1.  **Responsiveness:**
    *   Thoroughly test all pages and components on both mobile and desktop screen sizes, applying mobile-first media queries as defined in the CSS Scroll Snap guide.

2.  **Accessibility (A11y):**
    *   Ensure all interactive elements are keyboard-navigable.
    *   Use semantic HTML and add appropriate ARIA roles where necessary.
    *   Verify color contrast ratios meet WCAG AA standards.

3.  **SEO:**
    *   Use the `@vueuse/head` composable to set unique, descriptive titles and meta descriptions for each page in both languages.
