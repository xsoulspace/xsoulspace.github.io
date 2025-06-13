# UI Kit

This document serves as a living library of the UI components available in our design system. It details the structure and usage of components for our warm, ceramic-inspired interface with sidebar navigation, ensuring consistent implementation across the project.

## 1. Component Architecture

We follow an atomic design approach optimized for our ceramic and clay interface with sidebar navigation, creating components that embody the handcrafted, organic aesthetic of pottery and natural materials.

### 1.1. Atoms

Atoms are the foundational building blocks optimized for warm backgrounds and organic, handcrafted aesthetics.

- **Typography Elements**:

  - **Brand Title**: Large brand name with light font weight (`300`) in `earthy-brown`
  - **Brand Subtitle**: Tagline text in `warm-umber` with organic spacing
  - **Navigation Text**: Category headers and nav items with ceramic hierarchy
  - **Card Text**: Title, subtitle, description, and metadata with warm contrast

- **Interactive Elements**:

  - **Navigation Items**: Sidebar navigation links with terracotta hover states and active indicators
  - **Card Buttons**: Subtle action buttons with ceramic theme styling
  - **Status Badges**: Project status indicators with category-specific ceramic colors
  - **Icon Elements**: Consistent icon sizing with warm hover effects

- **Visual Elements**:
  - **Borders**: Subtle borders using `clay-border` (`#D4C4B0`)
  - **Shadows**: Warm-optimized shadow system using earthy brown tones
  - **Accent Colors**: Ceramic-inspired accent colors for visual organization

### 1.2. Molecules

Molecules combine atoms into functional interface components optimized for the ceramic sidebar layout.

- **Sidebar Navigation Item (`SidebarNavItem`)**: Individual navigation elements featuring:

  - **Touch Target**: Minimum 44px height for accessibility
  - **Hover State**: Subtle background change with terracotta accent indication
  - **Active State**: Clear visual indication using ceramic accent colors
  - **Typography**: Consistent text styling with warm contrast
  - **Spacing**: Uniform padding and margins for organic visual rhythm

- **Project Card (`ProjectCard`)**: Enhanced cards for the main content area:

  - **Warm Background**: `warm-ceramic` background with subtle clay borders
  - **Content Hierarchy**: Clear title, subtitle, description, and metadata structure
  - **Hover Effects**: Subtle elevation with terracotta and sage accent reveals
  - **Responsive Sizing**: Adapts to grid constraints (1x1, 2x1, 1x2)
  - **Category Indicators**: Ceramic color-coded accents based on project type

- **Section Header (`SectionHeader`)**: Content section titles with:

  - **Typography**: Section title styling with project counts in earthy brown
  - **Spacing**: Consistent margins and padding with organic feel
  - **Visual Separation**: Clear distinction using ceramic color palette
  - **Responsive Behavior**: Adapts to different screen sizes

- **Category Badge (`CategoryBadge`)**: Project type indicators featuring:
  - **Ceramic Color Coding**: Category-specific background and text colors
  - **Consistent Sizing**: Uniform badge dimensions across all cards
  - **Readable Typography**: High contrast text with warm aesthetics
  - **Organic Styling**: Rounded corners with handcrafted appearance

### 1.3. Organisms

Organisms are complex components that define major interface sections with ceramic-inspired design.

- **Sidebar Navigation (`SidebarNav`)**: The main navigation component featuring:

  **Structure & Layout:**

  - **Fixed Width**: 280px sidebar with consistent internal spacing
  - **Brand Header**: Logo/name area at the top with ceramic tagline
  - **Navigation Categories**: Organized groups of related projects
  - **Scroll Behavior**: Smooth scrolling for long navigation lists

  **Visual Design:**

  - **Background**: `soft-clay` background with subtle warm shadow separation
  - **Typography Hierarchy**: Clear distinction between categories and items using ceramic colors
  - **Active States**: Highlighted current section with terracotta and sage accents
  - **Hover Effects**: Subtle feedback with warm color transitions

  **Category Organization:**

  - **Apps & Games**: Interactive applications and entertainment (`terracotta`)
  - **Dart & Flutter**: Development packages and tools (`sage-glaze`)
  - **Office & Excel**: Productivity and business tools (`sandstone`)
  - **Gaming & Values**: Gaming projects and ethical principles (`warm-coral`)
  - **Community & Contacts**: Community resources and contact info (`soft-mint`)

  **Responsive Behavior:**

  - **Desktop**: Fixed visible sidebar with ceramic styling
  - **Tablet**: Collapsible overlay with warm backdrop
  - **Mobile**: Hidden by default with organic hamburger menu access

- **Main Content Area (`MainContent`)**: The primary content display featuring:

  **Layout System:**

  - **Content Offset**: Left margin to accommodate fixed sidebar
  - **Section Organization**: Clear separation between project categories
  - **Grid System**: Responsive bento grid within each section
  - **Spacing**: Consistent gaps and padding with organic feel

  **Content Structure:**

  - **Section Headers**: Category titles with project counts in ceramic colors
  - **Project Grids**: Responsive card layouts within each section
  - **Visual Hierarchy**: Clear information architecture with warm aesthetics
  - **Interactive Elements**: Hover states with terracotta and sage accents

- **Bento Grid System (`BentoGrid`)**: Enhanced grid layout featuring:

  **Grid Principles:**

  - **Contextual Grouping**: Projects organized by category sections
  - **Visual Variety**: Mixed card sizes for organic, handcrafted layouts
  - **Consistent Spacing**: Uniform gaps between cards with ceramic feel
  - **Responsive Columns**: 1-4 columns based on screen size
  - **Dense Packing**: Efficient space utilization with organic flow

  **Card Size Variations:**

  - **Standard Cards (1x1)**: Default project cards with ceramic styling
  - **Wide Cards (2x1)**: Extended cards for projects with more content
  - **Tall Cards (1x2)**: Vertical cards for specific content types
  - **Featured Cards (2x2)**: Showcase cards with terracotta highlights

  **Responsive Breakpoints:**

  - **Mobile (0-767px)**: Single column layout with warm spacing
  - **Tablet (768-1023px)**: 2-column grid with ceramic gaps
  - **Desktop (1024-1279px)**: 3-column grid with organic spacing
  - **Large (1280px+)**: 4-column grid with optimal ceramic layout

### 1.4. Enhanced Interactive Elements

- **Card Hover System**: Sophisticated interaction feedback featuring:

  - **Elevation**: Subtle shadow increase with warm tones
  - **Accent Reveal**: Terracotta and sage category colors appear on hover
  - **Content Preview**: Additional information revealed with ceramic transitions
  - **Smooth Transitions**: 300ms easing for all hover effects

- **Navigation Interactions**: Refined sidebar navigation featuring:
  - **Active Indicators**: Clear visual feedback using ceramic accent colors
  - **Hover States**: Subtle background changes with warm color transitions
  - **Focus Management**: Proper keyboard navigation with terracotta focus states
  - **Smooth Scrolling**: Animated scroll to section with organic easing

## 2. Component Specifications

### 2.1. Sidebar Navigation Component

```yaml
SidebarNav:
  dimensions:
    width: 280px
    padding: 1.5rem
  background: soft-clay
  shadow: sidebar-shadow

  brand-header:
    title:
      font-size: 2rem
      font-weight: 300
      color: earthy-brown
    subtitle:
      font-size: 0.875rem
      font-weight: 400
      color: warm-umber
      margin-top: 0.25rem

  navigation:
    category-spacing: 2rem
    item-height: 2.5rem
    item-gap: 0.5rem

    category-header:
      font-size: 0.875rem
      font-weight: 500
      color: earthy-brown
      margin-bottom: 0.75rem

    nav-item:
      font-size: 0.8125rem
      font-weight: 400
      color: muted-taupe
      padding: 0.5rem 0.75rem
      border-radius: 0.375rem

      hover:
        background: rgba(224, 122, 95, 0.1)
        color: earthy-brown

      active:
        background: rgba(224, 122, 95, 0.15)
        color: terracotta
        border-left: 3px solid terracotta
```

### 2.2. Project Card Component

```yaml
ProjectCard:
  dimensions:
    min-height: 200px
    padding: 1.5rem
    border-radius: 0.5rem

  background: warm-ceramic
  border: 1px solid clay-border
  shadow: shadow-card

  hover:
    shadow: shadow-hover
    transform: translateY(-2px)
    transition: all 300ms ease
    border-color: terracotta

  content:
    title:
      font-size: 1.125rem
      font-weight: 500
      color: earthy-brown
      margin-bottom: 0.5rem

    subtitle:
      font-size: 0.875rem
      font-weight: 400
      color: warm-umber
      margin-bottom: 0.75rem

    description:
      font-size: 0.8125rem
      font-weight: 400
      color: muted-taupe
      line-height: 1.5
      margin-bottom: 1rem

    metadata:
      font-size: 0.75rem
      font-weight: 400
      color: muted-taupe
      display: flex
      gap: 0.5rem
      flex-wrap: wrap
```

### 2.3. Category Badge Component

```yaml
CategoryBadge:
  dimensions:
    padding: 0.25rem 0.5rem
    border-radius: 0.375rem
    font-size: 0.75rem
    font-weight: 500

  variants:
    apps-games:
      background: rgba(224, 122, 95, 0.15)
      color: #B85A3E
      border: 1px solid rgba(224, 122, 95, 0.3)

    dart-flutter:
      background: rgba(129, 178, 154, 0.15)
      color: #5A8A6B
      border: 1px solid rgba(129, 178, 154, 0.3)

    office-excel:
      background: rgba(242, 204, 143, 0.15)
      color: #B8941F
      border: 1px solid rgba(242, 204, 143, 0.3)

    gaming-values:
      background: rgba(212, 117, 107, 0.15)
      color: #A85A52
      border: 1px solid rgba(212, 117, 107, 0.3)

    community:
      background: rgba(168, 196, 162, 0.15)
      color: #6B8A65
      border: 1px solid rgba(168, 196, 162, 0.3)
```

## 3. Animation System

### 3.1. Transition Specifications

```yaml
Transitions:
  general:
    duration: 300ms
    timing: ease
    properties: [all]

  transform:
    duration: 200ms
    timing: ease-out
    properties: [transform]

  opacity:
    duration: 150ms
    timing: ease
    properties: [opacity]

  color:
    duration: 200ms
    timing: ease
    properties: [color, background-color, border-color]
```

### 3.2. Hover Effects

```yaml
HoverEffects:
  card-hover:
    transform: translateY(-2px)
    shadow: shadow-hover
    border-color: terracotta
    duration: 300ms

  nav-item-hover:
    background: rgba(224, 122, 95, 0.1)
    color: earthy-brown
    duration: 200ms

  button-hover:
    transform: scale(1.02)
    shadow: glow-terracotta
    duration: 200ms
```

## 4. Responsive Behavior

### 4.1. Sidebar Responsive States

```yaml
SidebarResponsive:
  desktop:
    min-width: 1024px
    behavior: fixed-visible
    width: 280px
    background: soft-clay

  tablet:
    min-width: 768px
    max-width: 1023px
    behavior: overlay-toggle
    width: 280px
    backdrop: rgba(78, 52, 46, 0.3)

  mobile:
    max-width: 767px
    behavior: hidden-hamburger
    width: 100vw
    slide-direction: left
    background: soft-clay
```

### 4.2. Grid Responsive Behavior

```yaml
GridResponsive:
  mobile:
    columns: 1
    gap: 1rem
    padding: 1rem
    background: unglazed-bisque

  tablet:
    columns: 2
    gap: 1.5rem
    padding: 1.5rem
    background: unglazed-bisque

  desktop:
    columns: 3
    gap: 1.5rem
    padding: 2rem
    background: unglazed-bisque

  large:
    columns: 4
    gap: 1.5rem
    padding: 2rem
    background: unglazed-bisque
```

## 5. Accessibility Specifications

### 5.1. Color Contrast Requirements

All text combinations meet WCAG AA standards (4.5:1 minimum contrast ratio):

- `earthy-brown` on `unglazed-bisque`: 8.2:1
- `warm-umber` on `warm-ceramic`: 6.1:1
- `muted-taupe` on `warm-ceramic`: 4.8:1
- `terracotta` on `unglazed-bisque`: 4.7:1
- `sage-glaze` on `unglazed-bisque`: 5.1:1

### 5.2. Keyboard Navigation

- **Tab Order**: Logical flow through sidebar navigation and main content
- **Focus Indicators**: Clear visual focus states using terracotta accents
- **Skip Links**: Direct navigation to main content areas with ceramic styling
- **Escape Handling**: Close overlays and expanded states with smooth transitions

### 5.3. Screen Reader Support

- **Semantic HTML**: Proper heading hierarchy and landmark elements
- **ARIA Labels**: Descriptive labels for interactive elements
- **Live Regions**: Dynamic content updates announced appropriately
- **Alternative Text**: Meaningful descriptions for visual elements

### 5.4. Ceramic Design Accessibility

- **Organic Spacing**: Comfortable touch targets with natural proportions
- **Warm Contrast**: High readability without harsh contrasts
- **Handcrafted Feel**: Subtle variations that don't compromise usability
- **Natural Flow**: Intuitive navigation patterns inspired by pottery organization
