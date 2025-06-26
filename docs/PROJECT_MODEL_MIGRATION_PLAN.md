# ProjectModel Migration Implementation Plan

## 🎯 **Objective**

~~Migrate existing codebase from old `preferredSize` and `ProjectSize` system to new enhanced ProjectModel with `ProjectPriority`, `ContentEmphasis`, and `ResponsiveLayout`.~~

## ✅ **MIGRATION COMPLETED (Steps 1-4)**

**Status**: **COMPLETE** ✅ All core functionality migrated successfully.

**Completed on**: January 2025

**Summary**: Successfully migrated from static size-based project layout system to sophisticated priority and content-emphasis driven system. All critical functionality works correctly.

---

## 📋 **✅ COMPLETED STEPS**

### **✅ Step 1: Fixed ProjectCard Component (COMPLETE)**

**Status**: ✅ **DONE**  
**File**: `lib/components/molecules/project_card.dart`

#### **Completed Changes:**

- ✅ Replaced `project.preferredSize.isFeatured` → `project.priority.isFeatured`
- ✅ Updated CSS class generation: `'project-card--${project.preferredSize.value}'` → `'project-card--priority-${project.priority.value}'` + `'project-card--emphasis-${project.contentEmphasis.value}'`
- ✅ Removed `ProjectCardSize` enum completely
- ✅ Added priority-based CSS styling (priority-1 through priority-4)
- ✅ Added content emphasis CSS (image, text, metrics emphasis)
- ✅ Added `_getContentLayoutClasses()` method for dynamic content layout

### **✅ Step 2: Fixed BentoBlock Model (COMPLETE)**

**Status**: ✅ **DONE**  
**File**: `lib/components/models/bento_block_model.dart`

#### **Completed Changes:**

- ✅ Removed `ProjectSize` dependency from `AccentBlock`
- ✅ Removed `size = ProjectSize.standard` parameter
- ✅ Cleaned up imports

### **✅ Step 3: Fixed HomePage Logic (COMPLETE)**

**Status**: ✅ **DONE**  
**File**: `lib/pages/home_page.dart`

#### **Completed Changes:**

- ✅ Updated BentoBlock creation from `project.type == 'Accent'` → `project.projectType.isAccent`
- ✅ Removed `size: project.preferredSize` from AccentBlock construction
- ✅ All type checking now uses new `ProjectType` system

### **✅ Step 4: Fixed BentoConfig (COMPLETE)**

**Status**: ✅ **DONE**  
**File**: `lib/components/models/bento_config.dart`

#### **Completed Changes:**

- ✅ Replaced `getDefaultSizeForType()` → `getDefaultPriorityForType()`
- ✅ Changed `defaultSizes` → `defaultPriorities` with integer values (1-4)
- ✅ Updated property getter `Map<String, String>` → `Map<String, int>`
- ✅ Mapped old size system to new priority system

### **✅ Bonus Fix: BentoSection (COMPLETE)**

**Status**: ✅ **DONE**  
**File**: `lib/components/organisms/bento_section.dart`

#### **Completed Changes:**

- ✅ Removed conditional check for `ProjectSize.text`
- ✅ Simplified to always use `BentoGrid` (cleaner architecture)

---

## 🚀 **REMAINING ENHANCEMENTS (Steps 5-6)**

### **🟡 Step 5: Add Responsive Layout Support (ENHANCEMENT)**

**Status**: 🟡 **READY TO IMPLEMENT**  
**Priority**: 🟢 Low - New feature (optional enhancement)  
**File**: `lib/components/organisms/bento_grid.dart`

#### **Context**:

The `ResponsiveLayout` system is already implemented in `project_model.dart` with mobile/tablet/desktop span configurations. The grid system needs to be enhanced to use these responsive values.

#### **Implementation Required:**

**5.1: Update grid item styles**

**Location**: `_getGridItemStyles` method in `BentoGrid`  
**Current Code:**

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

**5.2: Add responsive CSS**

**Location**: Add to `@css` styles in `BentoGrid`  
**Action**: ADD responsive media queries:

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

### **🟡 Step 6: Add Content Emphasis Support (ENHANCEMENT)**

**Status**: 🟡 **READY TO IMPLEMENT**  
**Priority**: 🟢 Low - New feature (optional enhancement)  
**File**: `lib/components/molecules/project_card.dart`

#### **Context**:

The `ContentEmphasis` system is already implemented and partially connected. The `_getContentLayoutClasses()` method exists but needs corresponding CSS to make the emphasis effects visible.

#### **Implementation Required:**

**6.1: Add emphasis-specific CSS variations**

**Location**: Add to `@css` styles in `ProjectCard`  
**Action**: ADD enhanced emphasis styling:

```dart
// Enhanced content emphasis styling
css('.project-card__content--image-emphasis').styles(
  raw: const {
    'flex-direction': 'column-reverse', // Image first
  },
),

css('.project-card__content--image-emphasis .project-card__preview').styles(
  raw: const {
    'aspect-ratio': '4/3', // More prominent image ratio
    'margin-bottom': '0.75rem',
  },
),

css('.project-card__content--text-emphasis .project-card__header').styles(
  raw: const {
    'margin-bottom': '1rem', // More space for text
  },
),

css('.project-card__content--text-emphasis .project-card__description').styles(
  raw: const {
    '-webkit-line-clamp': '4', // More text lines visible
    'font-size': '0.875rem', // Slightly larger text
  },
),

css('.project-card__content--metrics-emphasis .project-card__metrics').styles(
  raw: const {
    'display': 'grid',
    'grid-template-columns': 'repeat(auto-fit, minmax(60px, 1fr))',
    'gap': '0.5rem',
    'padding': '0.75rem',
    'background-color': '#EDE7DD',
    'border-radius': '0.5rem',
    'margin-top': '1rem',
  },
),

css('.project-card__content--interactive-emphasis .project-card__footer').styles(
  raw: const {
    'background-color': '#F2CC8F',
    'padding': '1rem',
    'margin': '1rem -1rem -1rem',
    'border-radius': '0 0 0.75rem 0.75rem',
  },
),
```

**6.2: Add emphasis detection logic**

**Location**: Add new method in `ProjectCard`  
**Action**: ADD method to handle emphasis-specific behavior:

```dart
bool _shouldShowExpandedMetrics() {
  return project.contentEmphasis.emphasizeMetrics &&
         project.metrics.hasMetrics;
}

bool _shouldPrioritizeImage() {
  return project.contentEmphasis.emphasizeImage &&
         project.hasPreviewContent;
}

String _getDescriptionClampLines() {
  if (project.contentEmphasis.emphasizeText) return '4';
  if (project.contentEmphasis.emphasizeImage) return '2';
  return '3'; // default
}
```

---

## 🧪 **CURRENT VALIDATION STATUS**

### **✅ Critical Tests (ALL PASSING)**

- ✅ **Project cards render without errors** - All projects display correctly
- ✅ **No missing `preferredSize` errors** - Migration successful
- ✅ **Accent cards display correctly** - No `ProjectSize` dependency errors
- ✅ **Page loads without crashes** - HomePage renders successfully
- ✅ **BentoBlock creation works** - No construction errors

### **✅ Build Status**

- ✅ **Compilation successful**: `dart analyze` - warnings only, no errors
- ✅ **Build successful**: `jaspr build` - exit code 0
- ✅ **No remaining legacy references**: All old system removed

### **🟡 Feature Tests (READY FOR IMPLEMENTATION)**

- 🟡 **Priority-based styling**: Basic styles work, enhanced styling pending Step 6
- 🟡 **Content emphasis functions**: Structure ready, visual effects pending Step 6
- 🟡 **Responsive layout**: Data model ready, CSS implementation pending Step 5

---

## 🎯 **SUCCESS CRITERIA FOR REMAINING STEPS**

### **Step 5 (Responsive Layout) Complete When:**

- [ ] Grid items use responsive span values from `ResponsiveLayout`
- [ ] CSS custom properties correctly applied
- [ ] Media queries respond to different screen sizes
- [ ] Mobile/tablet/desktop layouts work correctly
- [ ] No layout breaking on resize

### **Step 6 (Content Emphasis) Complete When:**

- [ ] Visual differences clear between emphasis types
- [ ] Image emphasis shows larger/prominent images
- [ ] Text emphasis shows more readable text layout
- [ ] Metrics emphasis highlights stats effectively
- [ ] Interactive emphasis draws attention to actions

---

## 📝 **IMPLEMENTATION NOTES FOR FUTURE AI AGENTS**

### **🔑 Key Architecture Decisions Made:**

1. **Extension Types Used**: All new types (`ProjectPriority`, `ContentEmphasis`, `ProjectType`) use Dart extension types for zero-cost abstraction

2. **CSS Custom Properties**: Responsive system uses CSS custom properties (`--mobile-col-span`) for better performance than multiple CSS classes

3. **Backward Compatibility**: Old project data will work with default values (`priority: 2`, `contentEmphasis: 'balanced'`)

4. **Type Safety**: All enums replaced with extension types that provide type-safe string/int operations

### **🛠️ Development Workflow:**

1. **Always test after changes**: `dart analyze && jaspr build`
2. **Check responsive behavior**: Test different screen sizes
3. **Validate visual emphasis**: Ensure different emphasis types are visually distinct
4. **Check data model**: Ensure YAML loading still works with new properties

### **📊 Current System Status:**

- **Priority System**: ✅ Fully functional (1=background, 2=standard, 3=featured, 4=hero)
- **Content Emphasis**: ✅ Data model ready, 🟡 CSS implementation pending
- **Responsive Layout**: ✅ Data model ready, 🟡 Grid implementation pending
- **Project Types**: ✅ Fully migrated to extension types
- **Visual Styling**: ✅ Basic priority styling working

### **🎨 Design System:**

The new system follows true bento design principles:

- **Visual Hierarchy**: Priority affects prominence and positioning
- **Content-First**: Emphasis adapts layout to content type
- **Responsive**: Different layouts for different screen sizes
- **Consistent**: Unified styling system across all components

---

## 🚀 **READY FOR IMPLEMENTATION**

The foundation is solid! Steps 5-6 are purely additive enhancements that won't break existing functionality. The migration from static size-based to dynamic priority + emphasis + responsive system is **complete and functional**.

Future AI agents can safely implement Steps 5-6 as independent features. 🎨
