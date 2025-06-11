# Design Guidelines

This document outlines the core principles, aesthetic concepts, and foundational rules of our design language. It defines the visual elements that create a cohesive feel and user experience across the entire website.

## 0. Our Design Philosophy

Our design is not merely aesthetic; it is a direct reflection of our development ethos. We build with intention, guided by a set of core principles that ensure our work is respectful, enduring, and genuinely useful. This philosophy is the "why" behind every color, layout, and interaction.

- **Convenience & Simplicity:** We prioritize clarity and ease of use. Our use of a warm, high-contrast palette (`warm-paper`, `deep-espresso`) is intentional, designed to be as timeless and readable as a well-loved book, reducing eye strain and focusing on the content itself. The interface should feel intuitive and friction-free.
- **Longevity & Usefulness:** We build to last. This is reflected in a clean, maintainable design system and in transparently showing project support status. We aim to create tools and experiences that remain relevant and valuable over time.
- **Safety & Trust:** We believe in ethical technology. This commitment is made tangible through clear, accessible information about licenses, privacy, and terms. We design to empower users, not to exploit them.
- **Creativity, Fun & Challenge:** We are a home for creative endeavors. Our `BentoGrid` layout and cinematic textures are designed to spark curiosity and showcase projects in an engaging, non-uniform manner, celebrating the unique story of each creation.

## 1. Foundational Design Tokens

Design tokens are the visual atoms of the design system — specifically, they are named entities that store visual design attributes. We use them in place of hard-coded values in order to maintain a scalable and consistent visual system.

### 1.1. Color System

Our color palette is designed to be warm, inviting, and professional. The colors are categorized by their semantic purpose.

**Primary Palette**

| Token           | Hex       | Usage                              |
| --------------- | --------- | ---------------------------------- |
| `deep-espresso` | `#2C1810` | Main text, headings, hover states  |
| `warm-paper`    | `#F5F1EB` | Secondary text (on dark), tag bg   |
| `soft-linen`    | `#E8E2D8` | Card backgrounds, neutral surfaces |
| `creamy-amber`  | `#E6B17A` | Hovered card backgrounds           |
| `warm-copper`   | `#8B4513` | Subtitles, labels, secondary text  |
| `grain-muted`   | `#9B8B7A` | Description text, borders          |

**Feedback & Status Colors (for badges)**

| Type      | Background Token | Text Token        | Background Hex | Text Hex  |
| --------- | ---------------- | ----------------- | -------------- | --------- |
| `App`     | `bg-blue-100`    | `text-blue-800`   | `#dbeafe`      | `#1e40af` |
| `Game`    | `bg-purple-100`  | `text-purple-800` | `#f3e8ff`      | `#6b21a8` |
| `Library` | `bg-green-100`   | `text-green-800`  | `#dcfce7`      | `#166534` |
| `Default` | `bg-gray-100`    | `text-gray-800`   | `#f3f4f6`      | `#1f2937` |

**Utility Colors**

| Token    | RGBA                     | Usage          |
| -------- | ------------------------ | -------------- |
| `shadow` | `rgba(44, 24, 16, 0.15)` | Box shadows    |
| `border` | `rgba(139, 69, 19, 0.1)` | Subtle borders |

### 1.2. Typography System

The typography scale is designed to create a clear visual hierarchy. It uses `rem` units for scalability.

| Class Name             | Font Size  | Font Weight | Usage                            |
| ---------------------- | ---------- | ----------- | -------------------------------- |
| `.section-title`       | `2.25rem`  | `300`       | Main page section titles         |
| `.section-subtitle`    | `1.25rem`  | `400`       | Subtitles for sections           |
| `.project-title`       | `1.25rem`  | `500`       | Titles for project cards         |
| `.project-description` | `0.875rem` | `400`       | Description text in cards        |
| `.project-type`        | `0.75rem`  | `500`       | Badges for project types         |
| `.contributor-tag`     | `0.75rem`  | `400`       | Tags for contributors            |
| `.contributors-label`  | `0.75rem`  | `400`       | Labels for sections within cards |
| `.project-stats`       | `0.75rem`  | `400`       | Statistical info in cards        |

- **Line Height**: A `line-height` of `1.625rem` is used for body-like text such as `.project-description` and `.section-subtitle` to ensure readability.

### 1.3. Spacing System

A base unit of `0.25rem` (4px) is used. The spacing scale is based on multiples of this base unit.

| Rem       | Px   | Usage                                                                        |
| --------- | ---- | ---------------------------------------------------------------------------- |
| `0.25rem` | 4px  | Small gaps, vertical padding on small tags                                   |
| `0.5rem`  | 8px  | Gaps between tags, horizontal padding on small tags, margin bottom on labels |
| `0.75rem` | 12px | Margin bottom on titles, horizontal padding on badges                        |
| `1.0rem`  | 16px | Margin bottom on badges                                                      |
| `1.5rem`  | 24px | Main card padding, grid gap, margin bottom on description text               |
| `4.0rem`  | 64px | Margin bottom for section headers                                            |

### 1.4. Border & Radius

| Property             | Value         | Usage                         |
| -------------------- | ------------- | ----------------------------- |
| `border-radius-sm`   | `0.25rem`     | Small elements like tags      |
| `border-radius-md`   | `0.5rem`      | Cards and containers          |
| `border-radius-full` | `50%`         | Circular elements like badges |
| `border-width`       | `1px`         | Standard border width         |
| `border-color`       | `grain-muted` | Standard border color         |

### 1.5. Effects

**Shadows**

A single, subtle shadow is used for hover effects to create a sense of elevation.

| Name           | Value                                 | Usage         |
| -------------- | ------------------------------------- | ------------- |
| `shadow-hover` | `0px 8px 25px rgba(44, 24, 16, 0.15)` | On card hover |

**Transitions**

Transitions are used to create smooth animations for interactive elements.

| Property | Duration | Timing Function | Usage                      |
| -------- | -------- | --------------- | -------------------------- |
| `all`    | `300ms`  | `ease`          | Default for hover on cards |
| `color`  | `300ms`  | `ease`          | For text color changes     |

## 2. Component Library

All UI components are defined and documented in the [UI Kit](./UI_KIT.md). This document acts as the single source of truth for the building blocks of our interface.

## 3. Layout System

### 3.1. Grid System

The `BentoGrid` component uses CSS Grid to create a flexible and responsive layout.

- **Gap**: `1.5rem` between grid items.
- **Columns**: It uses a responsive grid template that can be adjusted with media queries.
- **Item Placement**: Components can span multiple columns and rows (e.g., `.project-card-large`).
