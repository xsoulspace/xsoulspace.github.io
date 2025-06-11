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

### 1.2. Molecules

Molecules are groups of atoms bonded together.

- **Project Card (`ProjectCard`)**: A combination of text, badges, and tags to display project information. It has a default and a large variant.
- **Contributor Spotlight**: Displays information about a contributor.

### 1.3. Organisms

Organisms are groups of molecules joined together to form a distinct section of an interface.

- **Bento Grid (`BentoGrid`)**: A grid layout that arranges `ProjectCard` components and other molecules in a visually interesting way.
- **Section Header**: A combination of `.section-title` and `.section-subtitle` to introduce a new section.
