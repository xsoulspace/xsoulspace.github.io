# ProjectModel Enhancement Implementation Plan

## 🎯 **Objective**

Enhance `lib/components/models/project_model.dart` to support sophisticated bento grid layouts with visual priority, content emphasis, responsive behavior, and flexible grid constraints.

## 📋 **Step-by-Step Implementation**

### **Step 1: Add Visual Priority System**

**File:** `lib/components/models/project_model.dart`  
**Location:** After line 35 (after PreviewType extension)  
**Why:** Controls WHERE and HOW PROMINENTLY projects appear in layout

```dart
/// Controls visual prominence and layout positioning priority
extension type const ProjectPriority(int value) {
  factory ProjectPriority.fromJson(final dynamic value) =>
      ProjectPriority(jsonDecodeInt(value));

  int toJson() => value;

  bool get isBackground => value == 1;  // Less prominent positioning
  bool get isStandard => value == 2;    // Normal prominence
  bool get isFeatured => value == 3;    // Better positioning
  bool get isHero => value == 4;        // Prime real estate

  static const background = ProjectPriority(1);
  static const standard = ProjectPriority(2);
  static const featured = ProjectPriority(3);
  static const hero = ProjectPriority(4);
}
```

### **Step 2: Add Content Emphasis System**

**File:** `lib/components/models/project_model.dart`  
**Location:** After ProjectPriority extension  
**Why:** Defines WHAT CONTENT is highlighted within each project block

```dart
/// Defines what content should be emphasized within a project block
extension type const ContentEmphasis(String value) {
  factory ContentEmphasis.fromJson(final dynamic value) =>
      ContentEmphasis(jsonDecodeString(value));

  String toJson() => value;

  bool get emphasizeImage => value == 'image';
  bool get emphasizeText => value == 'text';
  bool get emphasizeMetrics => value == 'metrics';
  bool get emphasizeInteractive => value == 'interactive';

  static const image = ContentEmphasis('image');
  static const text = ContentEmphasis('text');
  static const metrics = ContentEmphasis('metrics');
  static const interactive = ContentEmphasis('interactive');
  static const balanced = ContentEmphasis('balanced');
}
```

### **Step 3: Replace ProjectSize with ProjectType**

**File:** `lib/components/models/project_model.dart`  
**Location:** Replace existing ProjectSize extension (lines 16-34)  
**Why:** Use exact types from projects.yaml instead of size categories

```dart
/// Project types matching exactly what's in projects.yaml
extension type const ProjectType(String value) {
  factory ProjectType.fromJson(final dynamic value) =>
      ProjectType(jsonDecodeString(value));

  String toJson() => value;

  bool get isConcept => value == 'Concept';
  bool get isGame => value == 'Game';
  bool get isApp => value == 'App';
  bool get isBot => value == 'Bot';
  bool get isPackage => value == 'Package';
  bool get isUtility => value == 'Utility';
  bool get isAccent => value == 'Accent';
  bool get isWebAddin => value == 'Web Add-in';
  bool get isValue => value == 'Value';

  static const concept = ProjectType('Concept');
  static const game = ProjectType('Game');
  static const app = ProjectType('App');
  static const bot = ProjectType('Bot');
  static const package = ProjectType('Package');
  static const utility = ProjectType('Utility');
  static const accent = ProjectType('Accent');
  static const webAddin = ProjectType('Web Add-in');
  static const value = ProjectType('Value');
}
```

### **Step 4: Add Responsive Layout System**

**File:** `lib/components/models/project_model.dart`  
**Location:** After ContentEmphasis extension  
**Why:** Support different layouts for mobile/tablet/desktop

```dart
/// Device-specific layout preferences
extension type const ResponsiveLayout(Map<String, dynamic> value) {
  factory ResponsiveLayout.fromJson(final dynamic jsonData) {
    final map = jsonDecodeMap(jsonData);
    return ResponsiveLayout(map);
  }

  Map<String, dynamic> toJson() => value;

  int get mobileColSpan => jsonDecodeInt(value['mobile']?['colSpan']) ?? colSpan;
  int get mobileRowSpan => jsonDecodeInt(value['mobile']?['rowSpan']) ?? rowSpan;

  int get tabletColSpan => jsonDecodeInt(value['tablet']?['colSpan']) ?? colSpan;
  int get tabletRowSpan => jsonDecodeInt(value['tablet']?['rowSpan']) ?? rowSpan;

  int get desktopColSpan => jsonDecodeInt(value['desktop']?['colSpan']) ?? colSpan;
  int get desktopRowSpan => jsonDecodeInt(value['desktop']?['rowSpan']) ?? rowSpan;

  // Fallback to main span values if responsive not defined
  int get colSpan => jsonDecodeInt(value['colSpan']) ?? 1;
  int get rowSpan => jsonDecodeInt(value['rowSpan']) ?? 1;

  static const empty = ResponsiveLayout({});
}
```

### **Step 5: Update ProjectModel Properties**

**File:** `lib/components/models/project_model.dart`  
**Location:** In ProjectModel extension, after existing properties (around line 140)  
**Why:** Add new properties and update existing ones

```dart
// Add these NEW properties
ProjectPriority get priority => ProjectPriority.fromJson(value['priority'] ?? 2);
ContentEmphasis get contentEmphasis => ContentEmphasis.fromJson(value['contentEmphasis'] ?? 'balanced');
ResponsiveLayout get responsiveLayout => ResponsiveLayout.fromJson(value['responsiveLayout']);

// Enhanced grid constraints
int get minColSpan => jsonDecodeInt(value['minColSpan']) ?? 1;
int get maxColSpan => jsonDecodeInt(value['maxColSpan']) ?? 64;
int get minRowSpan => jsonDecodeInt(value['minRowSpan']) ?? 1;
int get maxRowSpan => jsonDecodeInt(value['maxRowSpan']) ?? 8;
bool get allowSizeVariation => jsonDecodeBool(value['allowSizeVariation']) ?? true;

// MODIFY this existing property
ProjectType get projectType => ProjectType.fromJson(value['type']);
```

### **Step 6: Remove Deprecated Property**

**File:** `lib/components/models/project_model.dart`  
**Location:** Around line 145  
**Why:** Remove preferredSize since we use direct colSpan/rowSpan control

```dart
// REMOVE this line:
// ProjectSize get preferredSize => ProjectSize.fromJson(value['preferredSize']);
```

### **Step 7: Update Computed Properties**

**File:** `lib/components/models/project_model.dart`  
**Location:** Replace existing computed properties (around line 155)  
**Why:** Use new ProjectType instead of string comparison

```dart
// REPLACE existing computed properties with:
bool get isLibrary => projectType.isPackage;
bool get isApp => projectType.isApp;
bool get isGame => projectType.isGame;
bool get isConcept => projectType.isConcept;
bool get isAccent => projectType.isAccent;
bool get isUtility => projectType.isUtility;
```

## 🧪 **Testing Requirements**

1. **Verify compilation:** All new extension types compile without errors
2. **Test data parsing:** Ensure existing projects.yaml data loads correctly
3. **Check defaults:** Verify default values work when properties are missing
4. **Validate types:** Confirm all project types from YAML are recognized

## 📝 **Usage Example**

After implementation, projects in YAML can use:

```yaml
- id: health
  title: "Health"
  type: "Concept"
  priority: 2 # Standard prominence
  contentEmphasis: "text" # Emphasize title/description
  colSpan: 16
  rowSpan: 12
  minColSpan: 8 # Minimum size constraints
  maxColSpan: 32
  responsiveLayout:
    mobile: { colSpan: 32, rowSpan: 8 }
    tablet: { colSpan: 16, rowSpan: 10 }
    desktop: { colSpan: 16, rowSpan: 12 }
```

## ⚠️ **Important Notes**

- All new properties have sensible defaults to maintain backward compatibility
- Existing colSpan/rowSpan properties remain unchanged
- ProjectType matches exact strings from projects.yaml
- ResponsiveLayout falls back to main colSpan/rowSpan if responsive values not provided
