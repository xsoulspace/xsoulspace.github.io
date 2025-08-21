# Project Implementation Plan

This document outlines a detailed, step-by-step plan to complete the development of the xsoulspace.dev portfolio website. It is designed to be followed by a developer or AI agent to implement the features and designs described in `docs/plan_v2.md` and `docs/PROJECT_OVERVIEW.md`.

## Phase 1: Data Layer Refactoring

The goal of this phase is to migrate from a static, TypeScript-based data system to a flexible, localized YAML-based content management system.

### Task 1.1: Enhance the Project Data Model

1.  **File to Modify:** `src/types/project.ts`
2.  **Objective:** Ensure the `Project` type definition is comprehensive enough to support all planned page layouts.
3.  **Action Items:**
    - Review the existing `Project` interface.
    - Add optional fields to support unique content types:
      - `codeSample?: { language: string; code: string; }` for the Foundation page.
      - `bentoConfig?: { size: 'small' | 'medium' | 'large'; accent: string; }` for the Ethics page Bento Grid.
      - Ensure fields for media (images, videos, GIFs) are robust.

### Task 1.2: Migrate Content to YAML

1.  **Files to Create/Modify:** All files in `src/data/en/` and `src/data/ru/`.
2.  **Objective:** Move all project content from the old `.ts` files into the new localized `.yaml` files.
3.  **Action Items:**
    - For each category (`apps`, `games`, `utilities`, `foundation`, `ethics`):
      - Read the corresponding data from the `.ts` file (e.g., `src/data/apps.ts`).
      - Convert the array of project objects into YAML format.
      - Save the formatted YAML into the appropriate localized file (e.g., `src/data/en/apps.yaml`).
      - Initially, the content for `en` and `ru` can be identical; translation can happen later.

### Task 1.3: Implement Dynamic Project Service

1.  **File to Modify:** `src/services/projectService.ts`
2.  **Objective:** Create a centralized, asynchronous service to load and parse project data based on category and locale.
3.  **Action Items:**
    - Rewrite the existing functions.
    - Create a function like `getProjects(category: string, locale: string): Promise<Project[]>`.
    - This function should use dynamic imports to fetch the correct raw YAML file based on the arguments (e.g., `import(`../data/${locale}/${category}.yaml?raw`)`).
    - Parse the imported YAML string.
    - Return the data, typed as `Project[]`.

### Task 1.4: Cleanup Old Data Files

1.  **Files to Delete:** `src/data/apps.ts`, `src/data/games.ts`, `src/data/utilities.ts`, `src/data/foundation.ts`, `src/data/ethics.ts`.
2.  **Objective:** Remove the now-redundant static data files.
3.  **Action Items:**
    - Delete the specified files from the `src/data/` directory.
    - Ensure no other part of the application is still trying to import them.

## Phase 2: Page & Component Implementation

With a solid data layer, this phase focuses on building the actual user-facing pages.

### Task 2.1: Implement Project Showcase Page

1.  **File to Modify:** `src/pages/ProjectShowcasePage.vue`
2.  **Objective:** Build the reusable, two-column, scroll-snapping layout for showcasing projects.
3.  **Action Items:**
    - Define a `category` prop for the component to accept (`'apps'`, `'games'`, etc.).
    - In the `<script setup>`, use the `projectService` to fetch data for the given category and the current locale.
    - Implement the Vue template with two columns:
      - **Left Column:** A scrollable container that lists all projects for the category.
      - **Right Column:** A `position: sticky` container for visual media.
    - Implement an `IntersectionObserver` to track which project in the left column is currently in view and dynamically update the content of the right column to show the corresponding media. The existing CSS (`.is-active`) suggests this is the intended mechanism.

### Task 2.2: Implement Foundation Page

1.  **File to Modify:** `src/pages/Foundation.vue`
2.  **Objective:** Build the developer-focused layout for foundation libraries.
3.  **Action Items:**
    - Fetch all "foundation" projects using the `projectService`.
    - Implement the two-column layout:
      - **Left Column:** A simple, clickable list of library names.
      - **Right Column:** A display area that shows the selected library's description, details, and the formatted `codeSample`.
    - Manage the "selected" state within the component to control what is displayed in the right column.

### Task 2.3: Implement Ethics Page & Bento Grid

1.  **Files to Create/Modify:** `src/pages/Ethics.vue`, `src/components/ui/BentoGrid.vue` (new).
2.  **Objective:** Build the Ethics page, featuring a custom Bento Grid.
3.  **Action Items:**
    - Create a new reusable component, `BentoGrid.vue`. This component should accept a list of items and use their `bentoConfig` properties to render a grid with items of varying sizes.
    - In `Ethics.vue`, fetch the "ethics" data using the `projectService`.
    - Use the `BentoGrid.vue` component to render the first part of the page.
    - Add the second part of the page, which displays the ethics letter content.

## Phase 3: Integration & Polish

This final phase connects everything and ensures a high-quality user experience.

### Task 3.1: Integrate Components into Main Pages

1.  **Files to Modify:** `src/pages/Apps.vue`, `src/pages/Games.vue`, `src/pages/Utilities.vue`.
2.  **Objective:** Use the implemented components to complete the primary pages.
3.  **Action Items:**
    - In `Apps.vue`, use the `<ProjectShowcasePage category="apps" />` component.
    - Do the same for `Games.vue` and `Utilities.vue`, passing the correct category prop.
    - Ensure the router (`src/router/index.ts`) is correctly pointing to these pages.

### Task 3.2: Ensure Full Responsiveness

1.  **Files to Modify:** All new/modified `.vue` components and their associated `<style>` blocks.
2.  **Objective:** Guarantee a seamless experience on all screen sizes.
3.  **Action Items:**
    - Thoroughly test the `ProjectShowcasePage`, `Foundation`, and `Ethics` layouts on mobile, tablet, and desktop viewport sizes.
    - Add or adjust media queries as needed to handle layout shifts, font size changes, and element stacking.

### Task 3.3: Verify SEO Implementation

1.  **Files to Modify:** All page-level components (`Apps.vue`, `Foundation.vue`, etc.).
2.  **Objective:** Ensure each page has proper, dynamic SEO metadata.
3.  **Action Items:**
    - On each page, use the `useSEO` composable.
    - Pass dynamic titles and descriptions to it, preferably derived from the loaded page data or i18n locales, to provide context-rich metadata.
