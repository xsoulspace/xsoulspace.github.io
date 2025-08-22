# Dropdown Component System

A modular and reusable dropdown system built with Vue 3 Composition API.

## Components

### BaseDropdown

The foundation component that provides dropdown functionality.

**Props:**

- `trigger`: "click" | "hover" (default: "click")
- `placement`: "bottom-start" | "bottom-end" | "top-start" | "top-end" (default: "bottom-end")
- `offset`: number (default: 8)
- `width`: string (default: "auto")
- `maxWidth`: string (default: "280px")
- `minWidth`: string (default: "220px")

**Slots:**

- `trigger`: The trigger element (receives `isOpen` and `toggle` props)
- `default`: The dropdown content

**Events:**

- `open`: Emitted when dropdown opens
- `close`: Emitted when dropdown closes

**Example:**

```vue
<BaseDropdown trigger="hover" placement="bottom-end">
  <template #trigger="{ isOpen, toggle }">
    <button @click="toggle">Toggle</button>
  </template>
  <div>Dropdown content</div>
</BaseDropdown>
```

### DropdownSection

A container component for organizing dropdown content with optional title.

**Props:**

- `title`: string (optional)
- `padding`: string (default: "var(--spacing-sm)")

**Example:**

```vue
<DropdownSection title="Options">
  <DropdownItem>Option 1</DropdownItem>
  <DropdownItem>Option 2</DropdownItem>
</DropdownSection>
```

### DropdownItem

A clickable item within a dropdown.

**Props:**

- `icon`: string (optional) - Font Awesome icon class
- `selected`: boolean (default: false)
- `disabled`: boolean (default: false)
- `variant`: "default" | "selected" | "danger" (default: "default")

**Events:**

- `click`: Emitted when item is clicked

**Example:**

```vue
<DropdownItem icon="fas fa-user" :selected="true" @click="handleClick">
  Profile
</DropdownItem>
```

### NavigationDropdown

A specialized dropdown for navigation menus.

**Props:**

- `items`: NavigationItem[] - Array of navigation items
- `trigger`: "click" | "hover" (default: "hover")
- `placement`: "bottom-start" | "bottom-end" | "top-start" | "top-end" (default: "bottom-end")
- `title`: string (default: "Navigate")
- `getItemLabel`: (item: NavigationItem) => string (optional) - Function to get display label

**Events:**

- `navigate`: Emitted with path when navigation item is clicked

**Example:**

```vue
<NavigationDropdown
  :items="navItems"
  :get-item-label="(item) => t(`nav.${item.key}`)"
  @navigate="handleNavigate"
/>
```

### LanguageDropdown

A specialized dropdown for language switching.

**Props:**

- `languages`: Language[] - Array of available languages
- `currentLanguage`: string - Current language code
- `trigger`: "click" | "hover" (default: "hover")
- `placement`: "bottom-start" | "bottom-end" | "top-start" | "top-end" (default: "bottom-end")
- `title`: string (default: "Language")

**Events:**

- `change`: Emitted with language code when language is changed

**Example:**

```vue
<LanguageDropdown
  :languages="languages"
  :current-language="locale"
  @change="handleLanguageChange"
/>
```

## Types

```typescript
interface NavigationItem {
  key: string;
  path: string;
  icon: string;
}

interface Language {
  code: string;
  name: string;
}

interface DropdownProps {
  trigger?: "click" | "hover";
  placement?: "bottom-start" | "bottom-end" | "top-start" | "top-end";
  offset?: number;
  width?: string;
  maxWidth?: string;
  minWidth?: string;
}

interface DropdownItemProps {
  icon?: string;
  selected?: boolean;
  disabled?: boolean;
  variant?: "default" | "selected" | "danger";
}

interface DropdownSectionProps {
  title?: string;
  padding?: string;
}
```

## Usage

Import components individually or use the index file:

```typescript
// Individual imports
import BaseDropdown from "@/components/ui/BaseDropdown.vue";
import NavigationDropdown from "@/components/ui/NavigationDropdown.vue";

// Or use index file
import { BaseDropdown, NavigationDropdown } from "@/components/ui";
```

## Features

- **Modular Design**: Each component has a single responsibility
- **TypeScript Support**: Full type safety with shared interfaces
- **Responsive**: Mobile-friendly with adaptive positioning
- **Accessible**: Proper ARIA attributes and keyboard navigation
- **Customizable**: Extensive props for styling and behavior
- **Reusable**: Can be used across the entire application
- **Consistent**: Follows design system colors and spacing
