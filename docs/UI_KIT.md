# UI Kit

This document serves as a living library of the UI components available in our design system. It details the structure and usage of components, from the smallest atoms to complex organisms, ensuring they are implemented consistently across the project.

## 1. Component Architecture

We follow an atomic design approach to build our UI, with enhanced cinematic elements that create depth and storytelling.

### 1.1. Atoms

Atoms are the basic building blocks of our UI, refined for cinematic elegance.

- **Text**: Styled text elements with enhanced typography scale, as defined in the Typography System in `DESIGN_GUIDELINES.md`.
- **Buttons/Tags**: Enhanced with larger padding, refined radius (`0.375rem`), and improved color tokens.
- **Badges**: Project type badges with bolder font weights (`600`) and enhanced padding for better visibility.
- **Enhanced Contributor Tag**: Larger (`0.8125rem`) with improved padding and refined styling.
- **Language Tag**: Refined tags with enhanced hover states and better visual hierarchy.
- **Icon Links**: Circular icon containers (`2.5rem`) with hover effects and scale animations.
- **Loading Spinner**: Larger (`64px`) with refined animation and cinematic timing.

### 1.2. Molecules

Molecules are groups of atoms bonded together, enhanced for better storytelling.

- **Enhanced Project Card (`ProjectCard`)**: A cinematic container with:

  - **Card Overlay**: Gradient overlay that appears on hover for depth
  - **Enhanced Spacing**: Larger padding (`2rem`) and improved minimum heights
  - **Refined Typography**: Larger titles (`1.375rem`) and improved descriptions
  - **Interactive Footer**: Enhanced icon links with circular backgrounds
  - **Hover Effects**: Pronounced lift (`-4px`) with enhanced shadows
  - **Responsive Sizing**: Strategic large cards for visual interest

- **Enhanced Loading Experience**: A storytelling moment featuring:

  - **Loading Container**: Centered layout with proper spacing
  - **Animated Text**: "Crafting Stories..." with pulsing animation
  - **Contextual Subtitle**: Explanation of the loading process
  - **Refined Spinner**: Larger, more elegant animation

- **Contributor Spotlight**: Enhanced with larger avatars (`5rem`) and improved hover effects.

- **Language Switcher**: Enhanced with better visual feedback and transitions.

### 1.3. Organisms

Organisms are groups of molecules joined together to form distinct sections with cinematic presence.

- **Enhanced Bento Grid (`BentoGrid`)**: A sophisticated grid layout featuring:

  - **Strategic Sizing**: First card and every 7th card are large for visual rhythm
  - **Enhanced Spacing**: Larger gaps (`2rem`) and improved minimum heights
  - **Responsive Design**: Adapts from 1 to 4 columns across breakpoints
  - **Section Headers**: Refined typography with better hierarchy

- **Cinematic Hero Section**: A full-viewport storytelling canvas with:

  - **Layered Backgrounds**: Gradient background with grain texture overlay
  - **Animated Content**: Staggered entrance animations for title, subtitle, and CTA
  - **Scroll Indicator**: Animated indicator encouraging exploration
  - **Enhanced Typography**: Larger titles (`4.5rem`) with refined letter spacing

- **Enhanced Section Header**: Improved typography and spacing for better hierarchy.

- **Ethical Principles Grid**: Enhanced cards with:
  - **Larger Icons**: `3rem` emoji icons for better visual impact
  - **Enhanced Hover**: Color transitions and pronounced lift effects
  - **Better Spacing**: Increased padding and gaps for breathing room

### 1.4. Enhanced Interactive Elements

- **CTA Buttons**: Enhanced with:

  - **Larger Size**: Increased padding and font size
  - **Refined Styling**: Border, shadow, and enhanced hover effects
  - **Entrance Animation**: Delayed fade-in with scale effect

- **Card Overlays**: Cinematic gradient overlays that appear on hover for depth.

- **Icon Interactions**: Circular backgrounds with scale effects and color transitions.

## 2. Animation System

### 2.1. Entrance Animations

- **Hero Fade In**: `1.5s` fade and slide up for hero content
- **Subtitle Slide Up**: `1.5s` slide up with `0.3s` delay for subtitle
- **CTA Fade In**: `1.5s` scale and fade with `0.6s` delay for call-to-action

### 2.2. Interaction Animations

- **Card Hover**: `400ms` transition with pronounced lift and shadow
- **Icon Hover**: `400ms` scale and color transition
- **Loading Pulse**: `2s` infinite opacity animation
- **Scroll Bounce**: `2s` infinite bounce for scroll indicator

### 2.3. Ambient Animations

- **Grain Float**: `12s` subtle texture movement for cinematic atmosphere
- **Global Grain**: `16s` very subtle background texture animation

## 3. Responsive Behavior

### 3.1. Breakpoint Adaptations

| Component           | Mobile (0px)     | Tablet (768px)   | Desktop (1024px)    | Large (1280px)  |
| ------------------- | ---------------- | ---------------- | ------------------- | --------------- |
| **Bento Grid**      | 1 column         | 2 columns        | 3 columns           | 4 columns       |
| **Hero Title**      | `4.5rem`         | `6rem`           | `7rem`              | `7rem`          |
| **Project Cards**   | Standard padding | Enhanced spacing | Large card variants | Maximum spacing |
| **Principles Grid** | 1 column         | 3 columns        | 3 columns           | 3 columns       |

### 3.2. Component Scaling

- **Large Project Cards**: Strategic placement (first and every 7th) with enhanced content
- **Icon Scaling**: Consistent `2.5rem` circular containers across all breakpoints
- **Typography Scaling**: Fluid scaling with enhanced line heights for readability

## 4. Accessibility Features

### 4.1. Interactive States

- **Focus Indicators**: Clear focus states for keyboard navigation
- **Hover Feedback**: Enhanced visual feedback for all interactive elements
- **Loading States**: Clear loading indicators with descriptive text

### 4.2. Motion Preferences

- **Reduced Motion**: All animations respect `prefers-reduced-motion` settings
- **Performance**: Optimized animations using `transform` and `opacity`

## 5. Implementation Guidelines

### 5.1. Component Usage

- **Project Cards**: Use `isLarge` prop strategically for visual rhythm
- **Loading States**: Always provide contextual loading text
- **Icon Links**: Use circular containers for consistent interaction areas
- **Animations**: Implement entrance animations for storytelling flow

### 5.2. Styling Consistency

- **Transitions**: Use `400ms` duration for enhanced interactions
- **Shadows**: Apply enhanced shadow system for depth
- **Spacing**: Follow enhanced spacing scale for visual hierarchy
- **Typography**: Use refined font weights and letter spacing for elegance

## 6. Future Enhancements

### 6.1. Planned Components

- **Legal Info Modal**: Clean, focused modal for displaying legal documents
- **Enhanced Navigation**: Cinematic navigation with smooth transitions
- **Project Detail Views**: Expanded project information with storytelling layout

### 6.2. Animation Expansions

- **Page Transitions**: Smooth transitions between different views
- **Micro-interactions**: Enhanced feedback for form elements and buttons
- **Parallax Effects**: Subtle parallax for enhanced depth perception
