# Design Guidelines

This document outlines the core principles, aesthetic concepts, and foundational rules of our design language. It defines the visual elements that create a cohesive feel and user experience across the entire website.

## 0. Our Design Philosophy

Our design is not merely aesthetic; it is a direct reflection of our development ethos. We build with intention, guided by a set of core principles that ensure our work is respectful, enduring, and genuinely useful. This philosophy is the "why" behind every color, layout, and interaction.

- **Convenience & Simplicity:** We prioritize clarity and ease of use through a warm, organic interface inspired by handcrafted ceramics. The natural color palette reduces eye strain while the sidebar navigation provides intuitive access to all project categories.
- **Longevity & Usefulness:** We build to last with a timeless ceramic aesthetic that feels both grounded and sophisticated, ensuring our interface remains welcoming and functional across all contexts.
- **Safety & Trust:** We believe in ethical technology, reflected in our honest, earthy design language that communicates transparency and authenticity in every interaction.
- **Creativity, Fun & Challenge:** We celebrate creative endeavors through our handcrafted aesthetic that showcases each project's unique story while maintaining the warm, human touch of artisanal work.

## 1. Foundational Design Tokens

Design tokens are the visual atoms of the design system — specifically, they are named entities that store visual design attributes for our warm, ceramic-inspired interface.

### 1.1. Color System

Our color palette draws from the world of handmade pottery and ceramics, creating an earthy, tactile, and grounded aesthetic that speaks to the process of shaping something raw into something both beautiful and functional.

**Primary Ceramic Palette**

| Token             | Hex       | Usage                                  |
| ----------------- | --------- | -------------------------------------- |
| `unglazed-bisque` | `#FAF6F0` | Main background, primary surface       |
| `warm-ceramic`    | `#F5F1EB` | Card backgrounds, elevated surfaces    |
| `soft-clay`       | `#EDE7DD` | Sidebar background, secondary surfaces |
| `earthy-brown`    | `#4E342E` | Primary text, headings                 |
| `warm-umber`      | `#6B4E3D` | Secondary text, descriptions           |
| `muted-taupe`     | `#8B7355` | Tertiary text, labels                  |
| `terracotta`      | `#E07A5F` | Primary accent, active elements        |
| `sage-glaze`      | `#81B29A` | Secondary accent, utility indicators   |
| `sandstone`       | `#F2CC8F` | Highlight accent, hover states         |
| `clay-border`     | `#D4C4B0` | Borders, dividers                      |

**Category Accent Colors**

| Category          | Color Token  | Hex       | Usage                          |
| ----------------- | ------------ | --------- | ------------------------------ |
| `Apps & Games`    | `terracotta` | `#E07A5F` | Interactive applications       |
| `Dart & Flutter`  | `sage-glaze` | `#81B29A` | Development tools & packages   |
| `Office & Excel`  | `sandstone`  | `#F2CC8F` | Productivity & business tools  |
| `Gaming & Values` | `warm-coral` | `#D4756B` | Gaming projects & principles   |
| `Community`       | `soft-mint`  | `#A8C4A2` | Community resources & contacts |

**Status & Feedback Colors**

| Type       | Background | Text      | Usage                    |
| ---------- | ---------- | --------- | ------------------------ |
| `Active`   | `#E8F5E8`  | `#2D5A2D` | Active/maintained status |
| `Beta`     | `#FFF4E6`  | `#B45309` | Beta/development status  |
| `Archive`  | `#F3F4F6`  | `#6B7280` | Archived project status  |
| `Featured` | `#FDF2F8`  | `#BE185D` | Featured project marker  |

### 1.2. Typography System

Enhanced typography scale optimized for warm backgrounds with excellent readability and organic feel.

| Class Name          | Font Size   | Font Weight | Color Token    | Usage                          |
| ------------------- | ----------- | ----------- | -------------- | ------------------------------ |
| `.brand-title`      | `2rem`      | `300`       | `earthy-brown` | Brand name in header           |
| `.brand-subtitle`   | `0.875rem`  | `400`       | `warm-umber`   | Brand tagline                  |
| `.nav-category`     | `0.875rem`  | `500`       | `earthy-brown` | Sidebar category headers       |
| `.nav-item`         | `0.8125rem` | `400`       | `muted-taupe`  | Sidebar navigation items       |
| `.section-title`    | `1.5rem`    | `500`       | `earthy-brown` | Main content section titles    |
| `.card-title`       | `1.125rem`  | `500`       | `earthy-brown` | Project card titles            |
| `.card-subtitle`    | `0.875rem`  | `400`       | `warm-umber`   | Project card subtitles         |
| `.card-description` | `0.8125rem` | `400`       | `muted-taupe`  | Project descriptions           |
| `.card-meta`        | `0.75rem`   | `400`       | `muted-taupe`  | Project metadata (tags, dates) |

### 1.3. Layout System

**Sidebar Navigation Layout**

| Property          | Value    | Usage                        |
| ----------------- | -------- | ---------------------------- |
| `sidebar-width`   | `280px`  | Fixed sidebar width          |
| `sidebar-padding` | `1.5rem` | Internal sidebar spacing     |
| `nav-item-height` | `2.5rem` | Navigation item touch target |
| `nav-gap`         | `0.5rem` | Gap between nav items        |
| `category-gap`    | `2rem`   | Gap between nav categories   |

**Main Content Layout**

| Property              | Value    | Usage                         |
| --------------------- | -------- | ----------------------------- |
| `content-margin-left` | `280px`  | Main content offset           |
| `content-padding`     | `2rem`   | Main content internal padding |
| `section-gap`         | `3rem`   | Gap between content sections  |
| `card-gap`            | `1.5rem` | Gap between project cards     |

### 1.4. Spacing System

Refined spacing system optimized for the ceramic-inspired layout structure.

| Token | Value     | Usage                           |
| ----- | --------- | ------------------------------- |
| `xs`  | `0.25rem` | Fine details, borders           |
| `sm`  | `0.5rem`  | Small gaps, tag spacing         |
| `md`  | `1rem`    | Standard spacing, card padding  |
| `lg`  | `1.5rem`  | Card gaps, section padding      |
| `xl`  | `2rem`    | Large sections, content padding |
| `2xl` | `3rem`    | Major section separations       |
| `3xl` | `4rem`    | Page-level spacing              |

### 1.5. Border & Radius

Refined border system for the warm, organic interface.

| Property           | Value      | Usage                |
| ------------------ | ---------- | -------------------- |
| `border-radius-sm` | `0.375rem` | Small elements, tags |
| `border-radius-md` | `0.5rem`   | Cards, buttons       |
| `border-radius-lg` | `0.75rem`  | Large containers     |
| `border-width`     | `1px`      | Standard borders     |
| `border-color`     | `#D4C4B0`  | Default border color |

### 1.6. Effects & Shadows

Enhanced shadow system for warm backgrounds with subtle, organic depth.

| Name              | Value                               | Usage                  |
| ----------------- | ----------------------------------- | ---------------------- |
| `shadow-card`     | `0 4px 12px rgba(78, 52, 46, 0.1)`  | Card elevation         |
| `shadow-hover`    | `0 8px 24px rgba(78, 52, 46, 0.15)` | Card hover state       |
| `shadow-sidebar`  | `2px 0 8px rgba(78, 52, 46, 0.08)`  | Sidebar separation     |
| `glow-terracotta` | `0 0 20px rgba(224, 122, 95, 0.3)`  | Terracotta accent glow |
| `glow-sage`       | `0 0 20px rgba(129, 178, 154, 0.3)` | Sage accent glow       |

**Transitions**

| Property    | Duration | Timing Function | Usage                 |
| ----------- | -------- | --------------- | --------------------- |
| `all`       | `300ms`  | `ease`          | General hover effects |
| `transform` | `200ms`  | `ease-out`      | Scale and position    |
| `opacity`   | `150ms`  | `ease`          | Fade effects          |
| `color`     | `200ms`  | `ease`          | Color transitions     |

## 2. Component Library

All UI components are defined and documented in the [UI Kit](./UI_KIT.md). This document acts as the single source of truth for the building blocks of our ceramic-inspired interface.

## 3. Layout System

### 3.1. Sidebar Navigation System

The layout features a warm, ceramic-inspired sidebar navigation that provides intuitive access to all project categories.

**Navigation Structure:**

- **Brand Header**: Logo/name with tagline in earthy tones
- **Category Groups**: Organized by project type and purpose
  - Apps & Games (Terracotta accent)
  - Dart & Flutter packages (Sage Glaze accent)
  - Office & Excel (Sandstone accent)
  - Gaming & Values (Warm Coral accent)
  - Community & Contacts (Soft Mint accent)
- **Visual Hierarchy**: Warm typography scale with organic spacing
- **Active States**: Highlighted current section with ceramic accent colors

### 3.2. Bento Grid System

The main content area uses an enhanced bento grid system with ceramic-inspired organization and visual hierarchy.

**Grid Principles:**

- **Contextual Grouping**: Projects grouped by category with warm section headers
- **Visual Variety**: Mixed card sizes (1x1, 2x1, 1x2) for organic layouts
- **Consistent Spacing**: Uniform gaps between cards within sections
- **Responsive Behavior**: Adapts from 1-4 columns based on available space
- **Content Hierarchy**: Title, subtitle, description, and metadata with ceramic color palette

### 3.3. Responsive Breakpoints

| Breakpoint | Min Width | Sidebar Behavior | Grid Columns | Content Padding |
| ---------- | --------- | ---------------- | ------------ | --------------- |
| Mobile     | `0px`     | Overlay/Hidden   | 1            | `1rem`          |
| Tablet     | `768px`   | Overlay/Toggle   | 2            | `1.5rem`        |
| Desktop    | `1024px`  | Fixed Visible    | 3            | `2rem`          |
| Large      | `1280px`  | Fixed Visible    | 4            | `2rem`          |

### 3.4. Content Organization

**Section Structure:**

- Each category has its own dedicated section with ceramic-inspired headers
- Section headers with project counts in warm typography
- Cards organized in responsive grids with organic spacing
- Clear visual separation between sections using subtle ceramic borders
- Consistent card styling within sections using the ceramic palette

**Card Hierarchy:**

- **Primary**: Project title and type in earthy brown
- **Secondary**: Brief description in warm umber
- **Tertiary**: Metadata in muted taupe
- **Interactive**: Hover states reveal terracotta and sage accents

## 4. Accessibility & Usability

### 4.1. Ceramic Theme Considerations

- **Contrast Ratios**: All text meets WCAG AA standards (4.5:1 minimum)
  - `earthy-brown` on `unglazed-bisque`: 8.2:1
  - `warm-umber` on `warm-ceramic`: 6.1:1
  - `muted-taupe` on `warm-ceramic`: 4.8:1
- **Color Independence**: Information conveyed through multiple visual cues
- **Focus Indicators**: Clear focus states using terracotta accents
- **Reduced Motion**: Respects user preferences for reduced motion

### 4.2. Navigation Accessibility

- **Keyboard Navigation**: Full keyboard support for sidebar and content
- **Screen Reader Support**: Proper ARIA labels and semantic structure
- **Touch Targets**: Minimum 44px touch targets for mobile interaction
- **Clear Hierarchy**: Logical heading structure with ceramic color coding

### 4.3. Organic Design Principles

- **Handcrafted Feel**: Subtle imperfections and organic spacing create warmth
- **Natural Materials**: Color palette evokes clay, earth, and ceramic glazes
- **Tactile Experience**: Visual textures suggest the feel of handmade pottery
- **Human Scale**: Proportions and spacing feel comfortable and approachable
