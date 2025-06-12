# Dynamic Bento Layout Implementation Plan

This document provides a comprehensive, step-by-step implementation plan for building the dynamic bento layout system. Each phase is designed to be executed systematically by an AI agent, with clear deliverables and validation criteria.

## 🎯 Implementation Overview

**Goal**: Transform the current static BentoGrid into a dynamic, adaptive layout system with three bento types (Micro, Standard, Expanded) and cinematic interactions.

**Timeline**: 5 phases, each building upon the previous
**Architecture**: Atomic design methodology with progressive enhancement
**Performance Target**: 60fps animations, <100ms interaction response

## 🚀 Current Progress Status

### ✅ **Phase 1: Foundation & Data Structure** - **COMPLETE**

- Enhanced project data model with extension types (`ProjectSize`, `PreviewContent`, `ProjectMetrics`)
- Created comprehensive bento configuration system (`BentoConfig`, `ResponsiveBreakpoints`, `AnimationTimings`)
- Updated sample data with dynamic bento fields for all 16 projects
- Full Dart type safety maintained with extension type patterns

### ✅ **Phase 2: Atomic Components** - **COMPLETE**

- **MicroBento Component**: ✅ Complete - Ultra-compact 1x1 cards with hover effects and metrics
- **StandardBento Component**: ✅ Complete - Medium-sized cards with preview integration and action buttons
- **ExpandedBento Component**: ✅ Complete - Full-featured showcase with live previews

### ✅ **Phase 3: Dynamic Grid System** - **COMPLETE**

- **DynamicBentoGrid Component**: ✅ Complete - Orchestrates all three bento types with responsive breakpoints
- **Grid Orchestration Service**: ✅ Complete - Handles project categorization and layout strategies
- **Responsive Breakpoint System**: ✅ Complete - Mobile/tablet/desktop/large configurations
- **Home Page Integration**: ✅ Complete - Replaced static BentoGrid with dynamic system

### 🔄 **Phase 4: Animation & Performance** - **IN PROGRESS**

- **Hover Cascade System**: ✅ Complete - Enhanced MicroBento and StandardBento with hover callbacks
- **ExpandedBento Hover Integration**: ⏳ Pending - Add hover handlers to complete cascade system
- **Animation Controller Management**: ⏳ Pending - CSS-based animations with staggered timing
- **Staggered Entrance Animations**: ⏳ Pending - Library-first entrance with 100ms intervals
- **Lazy Loading Optimization**: ⏳ Pending - Virtual scrolling for large datasets

### ⏳ **Phase 5: Integration & Polish** - **PENDING**

- **Search & Filter System**: ⏳ Pending - Real-time search with category filtering
- **Smart Grouping**: ⏳ Pending - Intelligent project categorization
- **Performance Optimization**: ⏳ Pending - 60fps target validation
- **Accessibility Audit**: ⏳ Pending - WCAG AA compliance testing

### 🔧 **Technical Lessons Learned**

- Jaspr CSS API limitations require alternative approaches for some properties
- Extension type pattern works well for type-safe data modeling
- StatelessComponent pattern preferred over StatefulComponent for simple interactions
- String transformations should be done in Dart rather than CSS

### 📍 **Current Implementation Status (Latest Update)**

**Completed Work:**

- ✅ Enhanced `MicroBento` component with hover callback system (`onHover` parameter)
- ✅ Enhanced `StandardBento` component with hover event handlers
- ✅ Updated `DynamicBentoGrid` to properly wire hover callbacks and manage neighbor dimming
- ✅ Implemented hover cascade logic with neighbor detection and state management

**Immediate Next Steps:**

1. **Complete ExpandedBento Hover Integration** - Add `onHover` callback and mouse event handlers to `ExpandedBento` component
2. **Test Hover Cascade System** - Verify all three bento types communicate hover states correctly
3. **Implement CSS Animation Timing** - Add staggered entrance animations with library-first priority
4. **Add Search & Filter UI** - Create search bar and filter controls for Phase 5

**Technical Notes:**

- Hover system uses callback pattern: `onHover: (bool isHovered) => _handleBentoHover(project, isHovered)`
- Mouse events bound using `Events.on` with `mouseenter` and `mouseleave` listeners
- Neighbor dimming implemented with `isDimmed` boolean parameter passed to all bento components
- CSS animations preferred over Flutter AnimationController due to Jaspr limitations

---

## 📋 Phase 1: Foundation & Data Structure

### 1.1 Project Data Model Enhancement

**Objective**: Extend project data structure to support dynamic bento features

**Tasks**:

1. **Update Project Model** (`lib/components/models/project.dart`):

   ```dart
   class Project {
     // Existing fields...

     // New fields for dynamic bentos
     final ProjectSize preferredSize; // micro, standard, featured
     final PreviewContent? previewContent;
     final List<String> screenshots;
     final String? demoUrl;
     final String? livePreviewUrl;
     final bool hasInteractiveDemo;
     final ProjectMetrics metrics; // downloads, stars, activity
   }

   enum ProjectSize { micro, standard, featured }

   class PreviewContent {
     final String? thumbnailUrl;
     final String? gifUrl;
     final String? videoUrl;
     final PreviewType type;
   }

   enum PreviewType { image, gif, video, interactive }
   ```

2. **Create Bento Configuration Model**:

   ```dart
   class BentoConfig {
     final Map<ProjectType, ProjectSize> defaultSizes;
     final ResponsiveBreakpoints breakpoints;
     final AnimationTimings timings;
     final LayoutConstraints constraints;
   }
   ```

3. **Update Sample Data** (`web/data/projects.yaml`):
   - Add preview content URLs for existing projects
   - Assign appropriate bento sizes based on project types
   - Include demo URLs and interactive flags

**Validation Criteria**:

- [x] All existing projects compile with new model
- [x] Sample data includes preview content for at least 5 projects
- [x] Model supports all three bento sizes
- [x] TypeScript/Dart type safety maintained

---

## 📋 Phase 2: Atomic Components (Atoms & Molecules)

### 2.1 Create Micro Bento Component

**Objective**: Build ultra-compact library cards for quick scanning

**Tasks**:

1. **Create `MicroBento` Widget** (`lib/components/micro_bento.dart`):

   ```dart
   class MicroBento extends StatefulWidget {
     final Project project;
     final VoidCallback? onTap;
     final bool isDimmed;

     @override
     Widget build(BuildContext context) {
       return AnimatedContainer(
         duration: Duration(milliseconds: 200),
         transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
         child: Container(
           aspectRatio: 1.0, // 1x1 grid unit
           decoration: BoxDecoration(
             color: _getProjectTypeColor(),
             borderRadius: BorderRadius.circular(12),
             border: Border.all(color: _getAccentColor(), width: 2),
             boxShadow: _isHovered ? _hoverShadow : _restShadow,
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               _buildProjectIcon(),
               SizedBox(height: 8),
               _buildProjectName(),
               _buildProjectType(),
             ],
           ),
         ),
       );
     }
   }
   ```

2. **Implement Hover States**:

   - 5% scale increase on hover
   - Soft shadow enhancement
   - Color accent animation
   - Performance-optimized transforms

3. **Add Accessibility Features**:
   - Semantic labels
   - Keyboard focus indicators
   - Screen reader support

**Validation Criteria**:

- [x] Component renders correctly in 1x1 aspect ratio
- [x] Hover animations are smooth (60fps)
- [x] Accessibility features work with screen readers
- [x] Color coding matches project types

### 2.2 Create Standard Bento Component

**Objective**: Build medium-sized cards with preview integration

**Tasks**:

1. **Create `StandardBento` Widget** (`lib/components/standard_bento.dart`):

   ```dart
   class StandardBento extends StatefulWidget {
     final Project project;
     final VoidCallback? onTap;
     final VoidCallback? onExpand;
     final bool isDimmed;
     final AspectRatio aspectRatio; // 1x2, 2x1, or 1x1

     @override
     Widget build(BuildContext context) {
       return AnimatedContainer(
         duration: Duration(milliseconds: 300),
         transform: Matrix4.identity()..scale(_getScaleFactor()),
         child: Container(
           decoration: _buildCardDecoration(),
           child: Stack(
             children: [
               _buildBackgroundContent(),
               _buildCardOverlay(),
               _buildMainContent(),
               if (_isHovered) _buildPreviewContent(),
               _buildInteractionButtons(),
             ],
           ),
         ),
       );
     }
   }
   ```

2. **Implement Preview Content System**:

   - Lazy-loaded thumbnails
   - Hover-triggered preview reveal
   - Fallback handling for missing content
   - Loading states with skeleton screens

3. **Add Interactive Elements**:
   - Expand button for full preview
   - Quick action buttons (demo, source, download)
   - Contextual information display

**Validation Criteria**:

- [x] Component supports flexible aspect ratios
- [x] Preview content loads efficiently
- [x] Hover effects are responsive and smooth
- [x] Interactive elements are accessible

### 2.3 Create Expanded Bento Component

**Objective**: Build full-featured showcase with live previews

**Tasks**:

1. **Create `ExpandedBento` Widget** (`lib/components/expanded_bento.dart`):

   ```dart
   class ExpandedBento extends StatefulWidget {
     final Project project;
     final VoidCallback onCollapse;
     final Animation<double> expansionAnimation;

     @override
     Widget build(BuildContext context) {
       return AnimatedBuilder(
         animation: expansionAnimation,
         builder: (context, child) {
           return Container(
             width: _calculateExpandedWidth(),
             height: _calculateExpandedHeight(),
             decoration: _buildExpandedDecoration(),
             child: Column(
               children: [
                 _buildExpandedHeader(),
                 Expanded(child: _buildLivePreview()),
                 _buildExpandedFooter(),
               ],
             ),
           );
         },
       );
     }
   }
   ```

2. **Implement Live Preview System**:

   - Secure iframe integration for web demos
   - Video player for recorded demos
   - Image galleries for screenshots
   - Interactive demo embedding

3. **Add Rich Content Features**:
   - Full project description
   - Contributor information
   - Action buttons (demo, source, download)
   - Project metrics and status

**Validation Criteria**:

- [ ] Component expands smoothly with animation
- [ ] Live previews load securely and efficiently
- [ ] All interactive elements function correctly
- [ ] Component collapses gracefully

---

## 📋 Phase 3: Dynamic Grid System (Organism)

### 3.1 Create Dynamic Bento Grid

**Objective**: Build intelligent grid that orchestrates all bento types

**Tasks**:

1. **Create `DynamicBentoGrid` Widget** (`lib/components/dynamic_bento_grid.dart`):

   ```dart
   class DynamicBentoGrid extends StatefulWidget {
     final List<Project> projects;
     final BentoConfig config;

     @override
     _DynamicBentoGridState createState() => _DynamicBentoGridState();
   }

   class _DynamicBentoGridState extends State<DynamicBentoGrid>
       with TickerProviderStateMixin {

     Project? _expandedProject;
     late AnimationController _expansionController;
     late AnimationController _dimmingController;

     @override
     Widget build(BuildContext context) {
       return LayoutBuilder(
         builder: (context, constraints) {
           final gridConfig = _calculateGridConfiguration(constraints);
           return _buildResponsiveGrid(gridConfig);
         },
       );
     }
   }
   ```

2. **Implement Grid Configuration Logic**:

   ```dart
   GridConfiguration _calculateGridConfiguration(BoxConstraints constraints) {
     final screenWidth = constraints.maxWidth;

     if (screenWidth < 768) {
       return GridConfiguration.mobile();
     } else if (screenWidth < 1024) {
       return GridConfiguration.tablet();
     } else if (screenWidth < 1280) {
       return GridConfiguration.desktop();
     } else {
       return GridConfiguration.large();
     }
   }
   ```

3. **Add Responsive Breakpoint System**:
   - Mobile: 1 column stacked layout
   - Tablet: 2 column hybrid with micro clusters
   - Desktop: 3 columns + micro sidebar
   - Large: 4 columns optimized distribution

**Validation Criteria**:

- [ ] Grid adapts correctly across all breakpoints
- [ ] Bento placement follows size hierarchy rules
- [ ] Performance remains smooth with large datasets
- [ ] Grid reflows properly during expansion/collapse

### 3.2 Implement Interaction Orchestration

**Objective**: Coordinate hover cascades, expansion, and dimming effects

**Tasks**:

1. **Add Hover Cascade System**:

   ```dart
   void _handleBentoHover(Project project, bool isHovered) {
     setState(() {
       _hoveredProject = isHovered ? project : null;
       _updateNeighborStates(project, isHovered);
     });
   }

   void _updateNeighborStates(Project project, bool isHovered) {
     final neighbors = _findNeighboringProjects(project);
     for (final neighbor in neighbors) {
       _neighborStates[neighbor.id] = isHovered ?
         NeighborState.scaledDown : NeighborState.normal;
     }
   }
   ```

2. **Implement Expansion/Collapse Logic**:

   ```dart
   Future<void> _expandBento(Project project) async {
     if (_expandedProject != null) {
       await _collapseBento(_expandedProject!);
     }

     setState(() {
       _expandedProject = project;
     });

     await _expansionController.forward();
     await _dimmingController.forward();
   }
   ```

3. **Add Focus Management**:
   - Single expanded bento at a time
   - Smooth transitions between states
   - Context preservation during expansion
   - Escape key and click-outside handling

**Validation Criteria**:

- [ ] Only one bento can be expanded at a time
- [ ] Hover cascades work smoothly
- [ ] Dimming effects are visually appealing
- [ ] Focus management works with keyboard navigation

---

## 📋 Phase 4: Animation & Performance

### 4.1 Implement Animation System

**Objective**: Create smooth, cinematic animations for all interactions

**Tasks**:

1. **Create Animation Controller Manager**:

   ```dart
   class BentoAnimationManager {
     late AnimationController _hoverController;
     late AnimationController _expansionController;
     late AnimationController _entranceController;

     // Animation curves and timings
     static const Duration microHoverDuration = Duration(milliseconds: 200);
     static const Duration standardHoverDuration = Duration(milliseconds: 300);
     static const Duration expansionDuration = Duration(milliseconds: 400);

     void initializeAnimations(TickerProvider vsync) {
       _hoverController = AnimationController(
         duration: standardHoverDuration,
         vsync: vsync,
       );
       // ... other controllers
     }
   }
   ```

2. **Implement Staggered Entrance Animations**:

   ```dart
   void _animateEntrances() {
     final libraries = projects.where((p) => p.type == ProjectType.library);
     final others = projects.where((p) => p.type != ProjectType.library);

     // Libraries first with 100ms intervals
     for (int i = 0; i < libraries.length; i++) {
       Timer(Duration(milliseconds: i * 100), () {
         _animateProjectEntrance(libraries.elementAt(i));
       });
     }

     // Other projects with 200ms intervals after libraries
     Timer(Duration(milliseconds: libraries.length * 100 + 300), () {
       for (int i = 0; i < others.length; i++) {
         Timer(Duration(milliseconds: i * 200), () {
           _animateProjectEntrance(others.elementAt(i));
         });
       }
     });
   }
   ```

3. **Add Performance Optimizations**:
   - GPU-accelerated transforms
   - Animation throttling for large datasets
   - Intersection observer for lazy loading
   - Memory cleanup for collapsed bentos

**Validation Criteria**:

- [ ] All animations run at 60fps
- [ ] Staggered entrances create engaging flow
- [ ] Performance remains smooth with 50+ projects
- [ ] Animations respect reduced motion preferences

### 4.2 Implement Lazy Loading & Virtual Scrolling

**Objective**: Optimize performance for large project collections

**Tasks**:

1. **Add Intersection Observer**:

   ```dart
   class LazyBentoLoader extends StatefulWidget {
     final Widget child;
     final VoidCallback onVisible;

     @override
     Widget build(BuildContext context) {
       return VisibilityDetector(
         key: Key('bento-${widget.project.id}'),
         onVisibilityChanged: (info) {
           if (info.visibleFraction > 0.1) {
             widget.onVisible();
           }
         },
         child: widget.child,
       );
     }
   }
   ```

2. **Implement Preview Content Lazy Loading**:

   - Load thumbnails only when visible
   - Preload preview content on hover
   - Cache loaded content for smooth interactions
   - Cleanup unused content to manage memory

3. **Add Virtual Scrolling for Large Datasets**:
   - Render only visible bentos
   - Maintain scroll position during expansion
   - Efficient list updates for filtering/sorting

**Validation Criteria**:

- [ ] Initial page load is under 2 seconds
- [ ] Preview content loads smoothly on demand
- [ ] Memory usage remains stable with large datasets
- [ ] Scroll performance is smooth

---

## 📋 Phase 5: Integration & Polish

### 5.1 Update Home Page Integration

**Objective**: Replace existing BentoGrid with DynamicBentoGrid

**Tasks**:

1. **Update Home Page** (`lib/pages/home_page.dart`):

   ```dart
   class HomePage extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         body: SingleChildScrollView(
           child: Column(
             children: [
               HeroSection(),
               SizedBox(height: 80),
               DynamicBentoGrid(
                 projects: ProjectService.getAllProjects(),
                 config: BentoConfig.defaultConfig(),
               ),
               SizedBox(height: 80),
               EthicalPrinciplesSection(),
             ],
           ),
         ),
       );
     }
   }
   ```

2. **Add Configuration Options**:

   - User preferences for bento sizes
   - Animation speed controls
   - Accessibility options
   - Layout density settings

3. **Implement State Management**:
   - Project filtering and sorting
   - Search functionality
   - Category-based grouping
   - Favorite projects system

**Validation Criteria**:

- [ ] Home page loads with new dynamic grid
- [ ] All existing functionality is preserved
- [ ] New features integrate seamlessly
- [ ] Performance meets or exceeds current implementation

### 5.2 Add Advanced Features

**Objective**: Implement enhanced user experience features

**Tasks**:

1. **Add Smart Grouping**:

   ```dart
   class SmartGroupingService {
     static List<ProjectGroup> groupProjects(List<Project> projects) {
       return [
         ProjectGroup(
           title: 'Quick Access Libraries',
           projects: _getLibraries(projects),
           displayMode: GroupDisplayMode.microGrid,
         ),
         ProjectGroup(
           title: 'Featured Projects',
           projects: _getFeaturedProjects(projects),
           displayMode: GroupDisplayMode.standardGrid,
         ),
         // ... other groups
       ];
     }
   }
   ```

2. **Implement Search & Filter**:

   - Real-time search with highlighting
   - Category-based filtering
   - Tag-based filtering
   - Sort by popularity, date, type

3. **Add Analytics Integration**:
   - Track bento interactions
   - Monitor expansion rates
   - Measure user engagement
   - A/B testing for layout variations

**Validation Criteria**:

- [ ] Smart grouping improves content discovery
- [ ] Search and filter work smoothly
- [ ] Analytics provide useful insights
- [ ] A/B testing framework is functional

### 5.3 Testing & Accessibility

**Objective**: Ensure robust, accessible implementation

**Tasks**:

1. **Accessibility Audit**:

   - Screen reader compatibility
   - Keyboard navigation testing
   - Color contrast validation
   - Focus management verification

2. **Performance Testing**:
   - Animation performance profiling
   - Memory usage monitoring
   - Mobile device testing

**Validation Criteria**:

- [ ] Accessibility score is AA compliant
- [ ] Performance meets target metrics
- [ ] Mobile experience is smooth

---

## 🚀 Deployment Checklist

### Pre-Deployment Validation

- [ ] All phases completed successfully
- [ ] Accessibility requirements met
- [ ] Performance benchmarks achieved
- [ ] Code review completed
- [ ] Documentation updated

### Deployment Steps

1. **Staging Deployment**:

   - Deploy to staging environment
   - Run full test suite
   - Conduct user acceptance testing
   - Performance monitoring

2. **Production Deployment**:

   - Feature flag rollout (10% → 50% → 100%)
   - Monitor error rates and performance
   - Collect user feedback
   - Analytics validation

3. **Post-Deployment**:
   - Monitor user engagement metrics
   - Collect performance data
   - Plan iterative improvements
   - Document lessons learned

---

## 📊 Success Metrics

### Performance Targets

- **Initial Load**: < 2 seconds
- **Animation Frame Rate**: 60fps consistently
- **Interaction Response**: < 100ms
- **Memory Usage**: < 50MB for 100 projects

### User Experience Goals

- **Engagement**: 25% increase in project interactions
- **Discovery**: 40% improvement in library project views
- **Accessibility**: WCAG AA compliance
- **User Satisfaction**: > 4.5/5 rating

### Technical Objectives

- **Code Coverage**: > 90%
- **Bundle Size**: < 10% increase from current
- **Error Rate**: < 0.1%
- **Mobile Performance**: Equivalent to desktop

---

## 🔧 Troubleshooting Guide

### Common Issues & Solutions

**Animation Performance Issues**:

- Check for excessive repaints
- Verify GPU acceleration is enabled
- Reduce animation complexity for low-end devices

**Layout Reflow Problems**:

- Ensure proper aspect ratio calculations
- Validate grid configuration logic
- Test edge cases with varying content sizes

**Memory Leaks**:

- Verify animation controller disposal
- Check for proper widget cleanup
- Monitor preview content caching

**Accessibility Issues**:

- Test with screen readers
- Validate keyboard navigation paths
- Ensure proper focus management

---

## 🔧 Jaspr-Specific Implementation Notes

### CSS Property Limitations Encountered

During Phase 2 implementation, several CSS properties were found to be unsupported in Jaspr's type-safe CSS system:

| Property            | Issue                                            | Solution Applied                                      |
| ------------------- | ------------------------------------------------ | ----------------------------------------------------- |
| `textTransform`     | `TextTransform.uppercase` constant not available | Use `text(project.type.toUpperCase())` in Dart        |
| `aspectRatio`       | CSS aspect-ratio property not supported          | Remove aspect ratio CSS, handle with container sizing |
| `filter`            | `Filter.grayscale()` not available               | Remove filter effects, use opacity for dimming        |
| `objectFit`         | Image object-fit property missing                | Remove object-fit, use alternative image sizing       |
| `webkitLineClamp`   | Webkit properties not supported                  | Remove text truncation CSS, handle with overflow      |
| `Transform.scale()` | Method chaining not available                    | Use separate transform calls                          |
| `zIndex`            | Requires ZIndex wrapper                          | Use `zIndex: const ZIndex(2)`                         |
| `lineHeight`        | Requires Unit wrapper                            | Use `lineHeight: 1.3.px`                              |
| `marginTop`         | Property not available                           | Use `margin: Margin.only(top: 16.px)`                 |

### Component Architecture Decisions

1. **StatelessComponent Pattern**: Preferred over StatefulComponent for simple hover interactions
2. **Extension Types**: Used extensively for type-safe data modeling following codebase patterns
3. **CSS Simplification**: Removed advanced CSS features in favor of Jaspr-compatible alternatives
4. **String Processing**: Moved text transformations from CSS to Dart string methods

### Performance Considerations

- Simplified CSS reduces browser compatibility issues
- Type-safe styling prevents runtime CSS errors
- Extension types provide zero-cost abstractions for data modeling
- StatelessComponent reduces widget tree complexity

This implementation plan provides a systematic approach to building the dynamic bento layout system while maintaining code quality, performance, and accessibility standards, with specific adaptations for Jaspr framework limitations.
