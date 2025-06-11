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
| `Utility` | `bg-indigo-100`  | `text-indigo-800` | `#e0e7ff`      | `#3730a3` |
| `Default` | `bg-gray-100`    | `text-gray-800`   | `#f3f4f6`      | `#1f2937` |

**Utility Colors**

| Token    | RGBA                     | Usage          |
| -------- | ------------------------ | -------------- |
| `shadow` | `rgba(44, 24, 16, 0.15)` | Box shadows    |
| `border` | `rgba(139, 69, 19, 0.1)` | Subtle borders |

### 1.2. Typography System

The typography scale is designed to create a clear visual hierarchy. It uses `rem` units for scalability and emphasizes elegance through lighter font weights.

| Class Name             | Font Size   | Font Weight | Usage                            |
| ---------------------- | ----------- | ----------- | -------------------------------- |
| `.hero-title`          | `4.5rem`    | `200`       | Main hero section title          |
| `.section-title`       | `2.5rem`    | `200`       | Main page section titles         |
| `.section-subtitle`    | `1.125rem`  | `400`       | Subtitles for sections           |
| `.project-title`       | `1.375rem`  | `500`       | Titles for project cards         |
| `.project-description` | `0.9375rem` | `400`       | Description text in cards        |
| `.project-type`        | `0.75rem`   | `600`       | Badges for project types         |
| `.contributor-tag`     | `0.8125rem` | `500`       | Tags for contributors            |
| `.contributors-label`  | `0.8125rem` | `500`       | Labels for sections within cards |
| `.loading-text`        | `1.125rem`  | `400`       | Loading state text               |

- **Line Height**: Enhanced line heights (`1.7rem` for body text) ensure optimal readability and breathing room.
- **Letter Spacing**: Negative letter spacing (`-0.02em`) on large titles for refined typography.

### 1.3. Spacing System

A base unit of `0.25rem` (4px) is used. The spacing scale is based on multiples of this base unit, with enhanced spacing for better visual hierarchy.

| Rem        | Px    | Usage                              |
| ---------- | ----- | ---------------------------------- |
| `0.375rem` | 6px   | Small padding on enhanced elements |
| `0.5rem`   | 8px   | Gaps between tags, small margins   |
| `0.75rem`  | 12px  | Medium gaps, enhanced tag padding  |
| `1.0rem`   | 16px  | Standard margins and padding       |
| `1.5rem`   | 24px  | Card padding, section spacing      |
| `2.0rem`   | 32px  | Enhanced card padding, grid gaps   |
| `2.5rem`   | 40px  | Large card padding, increased gaps |
| `4.0rem`   | 64px  | Section margins                    |
| `5.0rem`   | 80px  | Enhanced section spacing           |
| `8.0rem`   | 128px | Major section separations          |

### 1.4. Border & Radius

Enhanced border radius values for a more modern, refined appearance.

| Property             | Value         | Usage                         |
| -------------------- | ------------- | ----------------------------- |
| `border-radius-sm`   | `0.375rem`    | Small elements like tags      |
| `border-radius-md`   | `0.75rem`     | Cards and containers          |
| `border-radius-full` | `50%`         | Circular elements like badges |
| `border-width`       | `1px`         | Standard border width         |
| `border-color`       | `grain-muted` | Standard border color         |

### 1.5. Effects

**Shadows**

Enhanced shadow system for better depth and cinematic feel.

| Name           | Value                                 | Usage               |
| -------------- | ------------------------------------- | ------------------- |
| `shadow-hover` | `0px 16px 40px rgba(44, 24, 16, 0.2)` | Enhanced card hover |
| `shadow-cta`   | `0px 8px 25px rgba(44, 24, 16, 0.25)` | CTA button hover    |

**Transitions**

Refined transitions for smoother, more cinematic interactions.

| Property  | Duration | Timing Function | Usage                  |
| --------- | -------- | --------------- | ---------------------- |
| `all`     | `400ms`  | `ease`          | Enhanced hover effects |
| `color`   | `400ms`  | `ease`          | Text color changes     |
| `opacity` | `400ms`  | `ease`          | Overlay effects        |

**Animations**

Cinematic animations that enhance storytelling without overwhelming the user.

| Animation Name      | Duration | Usage                         |
| ------------------- | -------- | ----------------------------- |
| `hero-fade-in`      | `1.5s`   | Hero content entrance         |
| `subtitle-slide-up` | `1.5s`   | Subtitle entrance with delay  |
| `cta-fade-in`       | `1.5s`   | CTA button entrance           |
| `grain-float`       | `12s`    | Subtle grain texture movement |
| `loading-pulse`     | `2s`     | Loading state animation       |
| `scroll-bounce`     | `2s`     | Scroll indicator animation    |

## 2. Component Library

All UI components are defined and documented in the [UI Kit](./UI_KIT.md). This document acts as the single source of truth for the building blocks of our interface.

## 3. Layout System

### 3.1. Grid System

The `BentoGrid` component uses CSS Grid to create a flexible and responsive layout with enhanced spacing and strategic card sizing.

- **Gap**: `2rem` between grid items for better breathing room.
- **Columns**: Responsive grid template that adapts from 1 column on mobile to 4 columns on large screens.
- **Item Placement**: Strategic large cards (first card and every 7th card) for visual interest.
- **Minimum Heights**: Consistent minimum heights ensure visual harmony.

### 3.2. Responsive Breakpoints

| Breakpoint | Min Width | Grid Columns | Usage                |
| ---------- | --------- | ------------ | -------------------- |
| Mobile     | `0px`     | 1            | Single column layout |
| Tablet     | `768px`   | 2            | Two column layout    |
| Desktop    | `1024px`  | 3            | Three column layout  |
| Large      | `1280px`  | 4            | Four column layout   |

## 4. Cinematic Design Elements

### 4.1. Grain Texture

Subtle grain overlays create cinematic depth without interfering with readability:

- **Global grain**: Very subtle (`opacity: 0.015`) with slow animation
- **Hero grain**: More visible (`opacity: 0.6`) for atmospheric effect
- **Card overlays**: Gradient overlays that appear on hover

### 4.2. Loading Experience

The loading state is designed as a storytelling moment:

- **Spinner**: Elegant, larger spinner with refined animation
- **Text**: "Crafting Stories..." with pulsing animation
- **Subtitle**: Contextual explanation of the loading process

### 4.3. Interactive Feedback

Enhanced hover states that provide clear, delightful feedback:

- **Cards**: Pronounced lift (`-4px`) with enhanced shadows
- **Buttons**: Scale and color transitions with depth
- **Icons**: Circular backgrounds with scale effects

## 5. Accessibility & Performance

- **Color Contrast**: All color combinations meet WCAG AA standards
- **Focus States**: Clear focus indicators for keyboard navigation
- **Animation**: Respects `prefers-reduced-motion` preferences
- **Performance**: Optimized animations using `transform` and `opacity`
- **Semantic HTML**: Proper heading hierarchy and landmark elements
