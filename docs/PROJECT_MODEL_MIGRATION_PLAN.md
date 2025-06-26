# ProjectModel Migration Implementation Plan

## 🎯 **Objective**

Migrate existing codebase from old `preferredSize` and `ProjectSize` system to new enhanced ProjectModel with `ProjectPriority`, `ContentEmphasis`, and `ResponsiveLayout`.

## 🔍 **Issues Found**

- `project.preferredSize` references need replacement with priority/contentEmphasis logic
- `ProjectSize` references need replacement with `ProjectType`
- `ProjectCardSize` enum needs removal
- `BentoConfig` references to `ProjectSize` need updating
- `AccentBlock` using `ProjectSize` needs updating

---

## 📋 **Step-by-Step Migration**

### **Step 1: Fix ProjectCard Component (CRITICAL)**

**File:** `lib/components/molecules/project_card.dart`  
**Priority:** 🔴 High - Breaks current layout

#### **1.1: Replace preferredSize references**

**Location:** Line 42  
**Current:**

```dart
if (project.preferredSize.isFeatured && project.metrics.hasMetrics)
```

**Replace with:**

```dart
if (project.priority.isFeatured && project.metrics.hasMetrics)
```

#### **1.2: Update CSS class generation**

**Location:** Line 81 in `_getCardClasses()` method  
**Current:**

```dart
final sizeClass = 'project-card--${project.preferredSize.value}';
```

**Replace with:**

```dart
final priorityClass = 'project-card--priority-${project.priority.value}';
final emphasisClass = 'project-card--emphasis-${project.contentEmphasis.value}';
return '$baseClass $priorityClass $emphasisClass $typeClass';
```

#### **1.3: Remove ProjectCardSize enum**

**Location:** Lines 407-416  
**Action:** DELETE the entire `ProjectCardSize` enum and its `fromProject` method

#### **1.4: Add new priority-based CSS**

**Location:** Add to existing `@css` styles  
**Action:** ADD new CSS rules:

```dart
// Priority-based styling
css('.project-card--priority-1').styles(
  raw: const {
    'opacity': '0.8',
    'border-left': '2px solid #D4C4B0', // Muted for background
  },
),
css('.project-card--priority-2').styles(
  raw: const {
    'border-left': '3px solid #8B7355', // Standard
  },
),
css('.project-card--priority-3').styles(
  raw: const {
    'border-left': '4px solid #E07A5F', // Featured
    'box-shadow': '0 4px 16px rgba(224, 122, 95, 0.2)',
  },
),
css('.project-card--priority-4').styles(
  raw: const {
    'border-left': '5px solid #D4693B', // Hero
    'box-shadow': '0 8px 24px rgba(212, 105, 59, 0.3)',
    'transform': 'scale(1.02)',
  },
),

// Content emphasis styling
css('.project-card--emphasis-image .project-card__preview').styles(
  raw: const {
    'aspect-ratio': '16/9', // Emphasize image
    'flex-shrink': '0',
  },
),
css('.project-card--emphasis-text .project-card__title').styles(
  raw: const {
    'font-size': '1.25rem', // Larger title for text emphasis
    'font-weight': '600',
  },
),
css('.project-card--emphasis-metrics .project-card__metrics').styles(
  raw: const {
    'font-size': '1rem', // Larger metrics
    'margin-top': '0.75rem',
  },
),
```

---

### **Step 2: Fix BentoBlock Model (CRITICAL)**

**File:** `lib/components/models/bento_block_model.dart`  
**Priority:** 🔴 High - Breaks accent cards

#### **2.1: Remove ProjectSize from AccentBlock**

**Location:** Lines 20-35  
**Current:**

```dart
class AccentBlock {
  const AccentBlock({
    required this.title,
    this.subtitle,
    this.backgroundColor,
    this.imageUrl,
    this.size = ProjectSize.standard,
    this.colSpan = 1,
    this.rowSpan = 1,
  });

  final String title;
  final String? subtitle;
  final String? backgroundColor;
  final String? imageUrl;
  final ProjectSize size;
  final int colSpan;
  final int rowSpan;
}
```

**Replace with:**

```dart
class AccentBlock {
  const AccentBlock({
    required this.title,
    this.subtitle,
    this.backgroundColor,
    this.imageUrl,
    this.colSpan = 1,
    this.rowSpan = 1,
  });

  final String title;
  final String? subtitle;
  final String? backgroundColor;
  final String? imageUrl;
  final int colSpan;
  final int rowSpan;
}
```

#### **2.2: Remove ProjectSize import**

**Action:** Remove any `ProjectSize` imports if they exist

---

### **Step 3: Fix HomePage Logic (CRITICAL)**

**File:** `lib/pages/home_page.dart`  
**Priority:** 🔴 High - Breaks page rendering

#### **3.1: Update BentoBlock creation**

**Location:** Lines 312-324  
**Current:**

```dart
final blocks = projects.map((project) {
  if (project.type == 'Accent' ||
      project.type == 'Concept' ||
      project.type == 'Value') {
    return BentoBlock(
      accent: AccentBlock(
        title: project.title,
        subtitle: project.description,
        size: project.preferredSize,
        colSpan: project.colSpan,
        rowSpan: project.rowSpan,
      ),
    );
  }
  return BentoBlock(project: project);
}).toList();
```

**Replace with:**

```dart
final blocks = projects.map((project) {
  if (project.projectType.isAccent ||
      project.projectType.isConcept ||
      project.projectType.isValue) {
    return BentoBlock(
      accent: AccentBlock(
        title: project.title,
        subtitle: project.description,
        colSpan: project.colSpan,
        rowSpan: project.rowSpan,
      ),
    );
  }
  return BentoBlock(project: project);
}).toList();
```

---

### **Step 4: Fix BentoConfig (MEDIUM)**

**File:** `lib/components/models/bento_config.dart`  
**Priority:** 🟡 Medium - Breaks configuration

#### **4.1: Replace ProjectSize references**

**Location:** Lines 225-230  
**Current:**

```dart
/// Get the default project size for a given project type
ProjectSize getDefaultSizeForType(String projectType) {
  final sizeString = defaultSizes[projectType.toLowerCase()] ?? 'standard';
  return ProjectSize(sizeString);
}
```

**Replace with:**

```dart
/// Get the default priority for a given project type
ProjectPriority getDefaultPriorityForType(String projectType) {
  final priorityValue = defaultPriorities[projectType.toLowerCase()] ?? 2;
  return ProjectPriority(priorityValue);
}
```

#### **4.2: Update defaultConfig**

**Location:** Lines 240-265  
**Current:**

```dart
'defaultSizes': {
  'package': 'micro',
  'app': 'standard',
  'game': 'featured',
  'utility': 'micro',
  'bot': 'standard',
  'web add-in': 'standard',
},
```

**Replace with:**

```dart
'defaultPriorities': {
  'package': 1,        // background priority
  'app': 2,           // standard priority
  'game': 3,          // featured priority
  'utility': 1,       // background priority
  'bot': 2,          // standard priority
  'web add-in': 2,   // standard priority
},
```

#### **4.3: Update property getter**

**Location:** Line 218  
**Current:**

```dart
Map<String, String> get defaultSizes =>
    jsonDecodeMapAs<String, String>(value['defaultSizes']);
```

**Replace with:**

```dart
Map<String, int> get defaultPriorities =>
    jsonDecodeMapAs<String, int>(value['defaultPriorities']);
```

---

### **Step 5: Add Responsive Layout Support (ENHANCEMENT)**

**File:** `lib/components/organisms/bento_grid.dart`  
**Priority:** 🟢 Low - New feature

#### **5.1: Update grid item styles**

**Location:** `_getGridItemStyles` method  
**Current:**

```dart
Styles _getGridItemStyles(BentoBlock block) {
  final colSpan = block.project?.colSpan ?? block.accent?.colSpan ?? 1;
  final rowSpan = block.project?.rowSpan ?? block.accent?.rowSpan ?? 1;

  return Styles.raw({
    'grid-column': 'span $colSpan',
    'grid-row': 'span $rowSpan',
  });
}
```

**Replace with:**

```dart
Styles _getGridItemStyles(BentoBlock block) {
  final project = block.project;
  if (project != null) {
    final responsive = project.responsiveLayout;
    return Styles.raw({
      'grid-column': 'span ${responsive.desktopColSpan}',
      'grid-row': 'span ${responsive.desktopRowSpan}',
      // CSS custom properties for responsive behavior
      '--mobile-col-span': '${responsive.mobileColSpan}',
      '--tablet-col-span': '${responsive.tabletColSpan}',
      '--mobile-row-span': '${responsive.mobileRowSpan}',
      '--tablet-row-span': '${responsive.tabletRowSpan}',
    });
  }

  final colSpan = block.accent?.colSpan ?? 1;
  final rowSpan = block.accent?.rowSpan ?? 1;
  return Styles.raw({
    'grid-column': 'span $colSpan',
    'grid-row': 'span $rowSpan',
  });
}
```

#### **5.2: Add responsive CSS**

**Location:** Add to `@css` styles in BentoGrid  
**Action:** ADD responsive media queries:

```dart
// Responsive grid behavior
css.media(MediaQuery.screen(maxWidth: 768.px), [
  css('.bento-grid > *').styles(raw: const {
    'grid-column': 'span var(--mobile-col-span, 1) !important',
    'grid-row': 'span var(--mobile-row-span, 1) !important',
  }),
]),

css.media(MediaQuery.screen(minWidth: 769.px, maxWidth: 1024.px), [
  css('.bento-grid > *').styles(raw: const {
    'grid-column': 'span var(--tablet-col-span, 2) !important',
    'grid-row': 'span var(--tablet-row-span, 1) !important',
  }),
]),
```

---

### **Step 6: Add Content Emphasis Support (ENHANCEMENT)**

**File:** `lib/components/molecules/project_card.dart`  
**Priority:** 🟢 Low - New feature

#### **6.1: Add content layout method**

**Location:** Add new method after `_getCardClasses()`  
**Action:** ADD new method:

```dart
String _getContentLayoutClasses() {
  final emphasis = project.contentEmphasis;
  final baseClass = 'project-card__content';

  if (emphasis.emphasizeImage) {
    return '$baseClass project-card__content--image-emphasis';
  } else if (emphasis.emphasizeText) {
    return '$baseClass project-card__content--text-emphasis';
  } else if (emphasis.emphasizeMetrics) {
    return '$baseClass project-card__content--metrics-emphasis';
  } else if (emphasis.emphasizeInteractive) {
    return '$baseClass project-card__content--interactive-emphasis';
  }
  return baseClass;
}
```

#### **6.2: Update content div usage**

**Location:** Line where content div is created  
**Current:**

```dart
div(classes: 'project-card__content', [
```

**Replace with:**

```dart
div(classes: _getContentLayoutClasses(), [
```

---

## 🧪 **Testing Requirements**

### **Critical Tests (Must Pass)**

1. **Project cards render without errors**
   - All projects display correctly
   - No missing `preferredSize` errors
2. **Accent cards display correctly**
   - No `ProjectSize` dependency errors
   - AccentBlock creation works
3. **Page loads without crashes**
   - HomePage renders successfully
   - BentoBlock creation works

### **Feature Tests (Should Pass)**

1. **Priority-based styling works**
   - Different priorities show different visual treatments
   - CSS classes apply correctly
2. **Content emphasis functions**
   - Image/text/metrics emphasis affects layout
   - CSS classes apply correctly
3. **All project types recognized**
   - New ProjectType system works
   - Type checking functions correctly

### **Cleanup Tests (Should Pass)**

1. **No remaining `preferredSize` references**
   - Search codebase for any remaining refs
   - All replaced with priority/emphasis
2. **No remaining `ProjectSize` references**
   - All replaced with `ProjectType`
   - Imports cleaned up

---

## ⚠️ **Implementation Order (CRITICAL)**

**Must be done in this exact order to avoid breaking the build:**

1. **Step 1** - Fix ProjectCard (prevents rendering errors)
2. **Step 2** - Fix BentoBlock (prevents accent card errors)
3. **Step 3** - Fix HomePage (prevents page load errors)
4. **Step 4** - Fix BentoConfig (prevents config errors)
5. **Steps 5-6** - Add enhancements (safe to do after core fixes)

## 🔍 **Validation Commands**

After each step, run:

```bash
# Check for compilation errors
dart analyze

# Search for remaining old references
grep -r "preferredSize" lib/
grep -r "ProjectSize" lib/ --exclude="*project_model.dart"
grep -r "ProjectCardSize" lib/

# Test build
jaspr build
```

## 📝 **Success Criteria**

✅ **Migration Complete When:**

- [ ] All compilation errors resolved
- [ ] No `preferredSize` references except in project_model.dart
- [ ] No `ProjectSize` references outside of project_model.dart
- [ ] All project cards render with new priority styling
- [ ] Accent cards work without size parameter
- [ ] Page loads and displays correctly
- [ ] New CSS classes applied correctly

This migration transforms the static size-based system into a sophisticated priority and content-emphasis driven layout system that supports responsive behavior and enhanced visual hierarchy!
