# UI Kit

This document serves as a living library of the UI components available in our design system. It details the structure and usage of components, from the smallest atoms to complex organisms, ensuring they are implemented consistently across the project.

## 1. Component Architecture

We follow an atomic design approach to build our UI.

### 1.1. Atoms

Atoms are the basic building blocks of our UI.

- **Text**: Styled text elements, as defined in the Typography System in `DESIGN_GUIDELINES.md`.
- **Buttons/Tags**: Styled with padding, radius, and color tokens (e.g., `.contributor-tag`).
- **Badges**: Circular tags with specific color combinations (e.g., `.project-type`).
- **Inputs**: (To be defined)
- **Contributor Avatar**: A `1.5rem` circular image for a contributor. On hover, a tooltip shows their name.
- **Language Tag**: A small tag indicating a supported language (e.g., "EN").
- **Access Point Icon**: An icon indicating how to interact with a project.
- **Legal Info Icon**: An icon that triggers the `LegalInfoModal`.

### 1.2. Molecules

Molecules are groups of atoms bonded together.

- **Project Card (`ProjectCard`)**: A rich, informative container that conveys a project's story. It combines a project image, title, type badge, description, a list of `Contributor Avatars`, and an `Information Footer`. The footer contains `Maintenance Status`, `Language Tags`, an `Access Point Icon`, and a `Legal Info Icon`.
- **Contributor Spotlight**: Displays information about a contributor.
- **Language Switcher**: A component that displays the current language and opens a dropdown with other available languages on click.

### 1.3. Organisms

Organisms are groups of molecules joined together to form a distinct section of an interface.

- **Bento Grid (`BentoGrid`)**: A grid layout that arranges `ProjectCard` components and other molecules in a visually interesting way.
- **Section Header**: A combination of `.section-title` and `.section-subtitle` to introduce a new section.
- **Legal Info Modal**: A clean, focused modal for displaying legal documents. It is triggered by the `Legal Info Icon` on a `ProjectCard` and displays content from `LICENSE`, `PRIVACY_POLICY.md`, etc.
