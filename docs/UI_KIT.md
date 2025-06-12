# UI Kit

This document serves as a living library of the UI components available in our design system. It details the structure and usage of components, from the smallest atoms to complex organisms, ensuring they are implemented consistently across the project.

## 1. Component Architecture

We follow an atomic design approach to build our UI, with enhanced cinematic elements that create depth and storytelling through dynamic, adaptive layouts.

### 1.1. Atoms

Atoms are the basic building blocks of our UI, refined for cinematic elegance and dynamic interactions.

- **Text**: Styled text elements with enhanced typography scale, as defined in the Typography System in `DESIGN_GUIDELINES.md`.
- **Buttons/Tags**: Enhanced with larger padding, refined radius (`0.375rem`), and improved color tokens.
- **Badges**: Project type badges with bolder font weights (`600`) and enhanced padding for better visibility.
- **Enhanced Contributor Tag**: Larger (`0.8125rem`) with improved padding and refined styling.
- **Language Tag**: Refined tags with enhanced hover states and better visual hierarchy.
- **Icon Links**: Circular icon containers (`2.5rem`) with hover effects and scale animations.
- **Loading Spinner**: Larger (`64px`) with refined animation and cinematic timing.
- **Preview Thumbnail**: Optimized image/video thumbnails with aspect ratio preservation and loading states.
- **Live Preview Frame**: Secure iframe container with loading states and error handling.

### 1.2. Molecules

Molecules are groups of atoms bonded together, enhanced for better storytelling and dynamic interactions.

- **Micro Bento (`MicroBento`)**: Ultra-compact library cards featuring:

  - **Minimal Footprint**: `1x1` grid unit with `aspect-ratio: 1/1`
  - **Icon-Focused Design**: Large project icon with minimal text
  - **Subtle Interactions**: 5% scale on hover with soft shadow
  - **Quick Recognition**: Project type color coding via border accent
  - **Performance**: Optimized for rapid scanning and minimal DOM impact

- **Standard Bento (`StandardBento`)**: Medium-sized project cards for games/apps/utilities:

  - **Balanced Layout**: `1x2` or `2x1` grid units with flexible aspect ratios
  - **Preview Integration**: Thumbnail slot with lazy loading
  - **Enhanced Hover**: 10-15% scale increase with preview content reveal
  - **Content Hierarchy**: Title, type badge, brief description, contributor info
  - **Interaction Feedback**: Pronounced lift with enhanced shadow system

- **Expanded Bento (`ExpandedBento`)**: Full-featured project showcase:

  - **Generous Space**: `2x3` or `3x2` grid units for rich content
  - **Live Preview**: Embedded iframe, video player, or interactive demo
  - **Complete Information**: Full description, contributor details, action buttons
  - **Focus Management**: Surrounding content dims to 40% opacity
  - **Smooth Transitions**: 400ms expansion with grid reflow animation

- **Preview Content (`PreviewContent`)**: Dynamic content revealed on hover:

  - **Adaptive Media**: Screenshots, GIFs, or video previews based on project type
  - **Contextual Actions**: Quick access buttons (demo, source, download)
  - **Loading States**: Skeleton screens during content fetch
  - **Fallback Handling**: Graceful degradation when previews unavailable

- **Enhanced Loading Experience**: A storytelling moment featuring:

  - **Loading Container**: Centered layout with proper spacing
  - **Animated Text**: "Crafting Stories..." with pulsing animation
  - **Contextual Subtitle**: Explanation of the loading process
  - **Refined Spinner**: Larger, more elegant animation

- **Contributor Spotlight**: Enhanced with larger avatars (`5rem`) and improved hover effects.

- **Language Switcher**: Enhanced with better visual feedback and transitions.

### 1.3. Organisms

Organisms are groups of molecules joined together to form distinct sections with cinematic presence and dynamic behavior.

- **Dynamic Bento Grid (`DynamicBentoGrid`)**: An intelligent, adaptive grid system featuring:

  **Size Hierarchy Management:**

  - **Micro Zone**: Libraries clustered in compact 1x1 units
  - **Standard Zone**: Games/Apps/Utilities in balanced 1x2 or 2x1 units
  - **Expansion Space**: Dynamic allocation for 2x3 or 3x2 expanded views

  **Responsive Grid Engine:**

  - **Mobile (0px)**: Single column with stacked micro bentos
  - **Tablet (768px)**: 2-column hybrid with micro bento clusters
  - **Desktop (1024px)**: 3-column with dedicated micro bento sidebar
  - **Large (1280px)**: 4-column with optimized micro/standard distribution

  **Interaction Orchestration:**

  - **Hover Cascade**: Adjacent bentos scale down 5% for focus enhancement
  - **Expansion Choreography**: Smooth grid reflow with neighboring repositioning
  - **Dimming System**: Non-focused elements fade to 40% opacity with 20% grayscale
  - **Return Animation**: Graceful collapse with restored grid positions

  **Performance Optimizations:**

  - **Virtual Scrolling**: Efficient rendering for large project collections
  - **Intersection Observer**: Lazy loading for preview content
  - **Transform-based Animations**: GPU-accelerated scaling and positioning
  - **Reduced Motion Support**: Simplified animations for accessibility

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

- **Dynamic Card Overlays**: Context-aware overlays that adapt to interaction state:

  - **Rest State**: Subtle grain texture overlay (15% opacity)
  - **Hover State**: Gradient preview overlay with content reveal
  - **Focus State**: Full overlay with live preview background
  - **Dimmed State**: Grayscale filter with reduced opacity

- **Adaptive Icon Interactions**:
  - **Micro Bentos**: Simplified icon-only interactions
  - **Standard Bentos**: Circular backgrounds with scale effects
  - **Expanded Bentos**: Full button treatments with enhanced feedback

## 2. Animation System

### 2.1. Entrance Animations

- **Hero Fade In**: `1.5s` fade and slide up for hero content
- **Subtitle Slide Up**: `1.5s` slide up with `0.3s` delay for subtitle
- **CTA Fade In**: `1.5s` scale and fade with `0.6s` delay for call-to-action
- **Staggered Bento Entrance**: Libraries first (100ms intervals), then standard bentos (200ms intervals)

### 2.2. Interaction Animations

**Bento Interaction States:**

- **Micro Hover**: `200ms` subtle scale (1.05x) with soft shadow
- **Standard Hover**: `300ms` pronounced scale (1.1-1.15x) with preview reveal
- **Expansion**: `400ms` smooth scale and reposition with grid reflow
- **Collapse**: `300ms` return animation with restored positioning
- **Dimming**: `200ms` opacity and grayscale transition for non-focused elements

**Supporting Animations:**

- **Icon Hover**: `400ms` scale and color transition
- **Loading Pulse**: `2s` infinite opacity animation
- **Scroll Bounce**: `2s` infinite bounce for scroll indicator
- **Preview Content Slide**: `250ms` slide-in from bottom with fade

### 2.3. Ambient Animations

- **Grain Float**: `12s` subtle texture movement for cinematic atmosphere
- **Global Grain**: `16s` very subtle background texture animation
- **Hover Cascade**: `150ms` staggered scale adjustments for neighboring bentos

### 2.4. Choreography Patterns

**Focus Management:**

- **Single Focus**: Only one bento can be expanded at a time
- **Smooth Transitions**: Previous expanded bento collapses before new one expands
- **Context Preservation**: Grid remembers positions during expansion/collapse cycles
- **Escape Handling**: Click outside or ESC key gracefully collapses expanded state

## 3. Responsive Behavior

### 3.1. Breakpoint Adaptations

| Component              | Mobile (0px)     | Tablet (768px)   | Desktop (1024px)          | Large (1280px)         |
| ---------------------- | ---------------- | ---------------- | ------------------------- | ---------------------- |
| **Dynamic Bento Grid** | 1 column stacked | 2 columns hybrid | 3 columns + micro sidebar | 4 columns optimized    |
| **Micro Bentos**       | Full width cards | 2x2 clusters     | Dedicated sidebar         | Integrated clusters    |
| **Standard Bentos**    | Full width       | 1x2 or 2x1 units | Flexible grid placement   | Optimized distribution |
| **Expanded Bentos**    | Full viewport    | 2x3 overlay      | 2x3 or 3x2 in-grid        | 3x2 with rich content  |
| **Hero Title**         | `4.5rem`         | `6rem`           | `7rem`                    | `7rem`                 |
| **Principles Grid**    | 1 column         | 3 columns        | 3 columns                 | 3 columns              |

### 3.2. Component Scaling

**Adaptive Sizing:**

- **Micro Bentos**: Consistent 1x1 ratio across all breakpoints
- **Standard Bentos**: Flexible aspect ratios based on content and screen space
- **Expanded Bentos**: Responsive sizing with maximum content optimization
- **Preview Content**: Adaptive media sizing with aspect ratio preservation

**Content Adaptation:**

- **Mobile**: Simplified content with essential information only
- **Tablet**: Balanced content with preview thumbnails
- **Desktop**: Full content with rich previews and interactions
- **Large**: Maximum content density with live preview capabilities

## 4. Accessibility Features

### 4.1. Interactive States

- **Focus Indicators**: Clear focus states for keyboard navigation with enhanced visibility
- **Hover Feedback**: Enhanced visual feedback for all interactive elements
- **Loading States**: Clear loading indicators with descriptive text
- **Expansion Announcements**: Screen reader notifications for state changes
- **Keyboard Navigation**: Full keyboard support for bento interactions and expansion

### 4.2. Motion Preferences

- **Reduced Motion**: All animations respect `prefers-reduced-motion` settings
- **Performance**: Optimized animations using `transform` and `opacity`
- **Fallback States**: Static layouts when animations are disabled
- **Focus Management**: Maintained focus during expansion/collapse cycles

### 4.3. Content Accessibility

- **Alt Text**: Comprehensive alt text for all preview images and thumbnails
- **ARIA Labels**: Descriptive labels for interactive elements and state changes
- **Color Independence**: Information conveyed through multiple visual cues, not just color
- **High Contrast**: Enhanced visibility in high contrast modes

## 5. Implementation Guidelines

### 5.1. Component Usage

**Bento Selection Strategy:**

- **Libraries**: Always use `MicroBento` for quick scanning and minimal footprint
- **Games/Apps/Utilities**: Use `StandardBento` with appropriate aspect ratios
- **Featured Projects**: Strategic use of `ExpandedBento` for showcase content
- **Grid Distribution**: Balance micro and standard bentos for visual rhythm

**Interaction Patterns:**

- **Progressive Disclosure**: Start minimal, reveal more on interaction
- **Single Focus**: Maintain one expanded bento at a time
- **Graceful Degradation**: Fallback to static cards when dynamic features unavailable
- **Performance Budget**: Monitor animation performance and optimize accordingly

### 5.2. Styling Consistency

**Animation Timing:**

- **Micro Interactions**: 200ms for subtle feedback
- **Standard Interactions**: 300-400ms for pronounced effects
- **Expansion/Collapse**: 400ms for smooth transitions
- **Ambient Effects**: 12-16s for atmospheric animations

**Visual Hierarchy:**

- **Size Relationships**: Maintain clear size distinctions between bento types
- **Color Coding**: Consistent project type colors across all bento sizes
- **Shadow System**: Enhanced shadows for depth and focus indication
- **Typography Scaling**: Appropriate text sizes for each bento type

### 5.3. Performance Considerations

**Optimization Strategies:**

- **Lazy Loading**: Preview content loaded on demand
- **Virtual Scrolling**: Efficient rendering for large collections
- **Animation Throttling**: Limit concurrent animations for smooth performance
- **Memory Management**: Cleanup expanded content when collapsed

## 6. Future Enhancements

### 6.1. Planned Components

- **Legal Info Modal**: Clean, focused modal for displaying legal documents
- **Enhanced Navigation**: Cinematic navigation with smooth transitions
- **Project Detail Views**: Full-page project exploration with immersive layouts
- **Bento Customization**: User preferences for bento sizes and arrangements
- **Smart Grouping**: AI-powered project clustering and recommendation

### 6.2. Animation Expansions

- **Page Transitions**: Smooth transitions between different views
- **Micro-interactions**: Enhanced feedback for form elements and buttons
- **Parallax Effects**: Subtle parallax for enhanced depth perception
- **Gesture Support**: Touch and swipe interactions for mobile devices
- **Sound Design**: Subtle audio feedback for interactions (user preference)

### 6.3. Advanced Features

- **Live Preview APIs**: Real-time project status and activity feeds
- **Collaborative Features**: Multi-user interaction and shared project spaces
- **Analytics Integration**: User interaction tracking for layout optimization
- **A/B Testing**: Dynamic layout variations for user experience research
