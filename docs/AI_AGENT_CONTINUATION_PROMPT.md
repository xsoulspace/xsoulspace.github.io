# AI Agent Continuation Prompt: Dynamic Bento Layout Phase 4 & 5

## 🎯 Mission Objective

Continue implementation of the Dynamic Bento Layout system for the Jaspr web application. You are picking up work in **Phase 4 (Animation & Performance)** with the hover cascade system partially complete.

## 📋 Current State Analysis

### ✅ What's Already Working

- **DynamicBentoGrid**: Fully functional with responsive breakpoints and project categorization
- **MicroBento & StandardBento**: Enhanced with hover callbacks (`onHover` parameter) and mouse event handlers
- **Hover Cascade Logic**: Grid properly manages neighbor dimming when bentos are hovered
- **All Three Bento Types**: MicroBento, StandardBento, and ExpandedBento components are complete
- **Home Page Integration**: Dynamic grid successfully replaced static BentoGrid

### 🔧 Immediate Issues to Fix

1. **ExpandedBento Missing Hover Integration**: The `ExpandedBento` component lacks the `onHover` callback parameter and mouse event handlers that were added to MicroBento and StandardBento.

2. **Hover Cascade Testing Needed**: Verify the complete hover system works across all three bento types.

## 🚀 Your Next Tasks (Priority Order)

### **TASK 1: Complete ExpandedBento Hover Integration** ⭐ HIGH PRIORITY

**Objective**: Add hover callback system to ExpandedBento to complete the cascade system.

**Steps**:

1. Examine `lib/components/expanded_bento.dart`
2. Add `onHover` callback parameter: `final void Function(bool isHovered)? onHover;`
3. Add mouse event handlers: `_handleMouseEnter()` and `_handleMouseLeave()`
4. Update the `Events.on` binding to include `mouseenter` and `mouseleave` events
5. Follow the exact pattern used in MicroBento and StandardBento components

**Reference Pattern** (from MicroBento):

```dart
// Parameter
final void Function(bool isHovered)? onHover;

// Event handlers
void _handleMouseEnter() => onHover?.call(true);
void _handleMouseLeave() => onHover?.call(false);

// Event binding
Events.on(
  click: _handleClick,
  mouseenter: _handleMouseEnter,
  mouseleave: _handleMouseLeave,
)
```

### **TASK 2: Test Hover Cascade System** ⭐ HIGH PRIORITY

**Objective**: Verify the complete hover system works correctly.

**Steps**:

1. Run the application and test hover interactions on all bento types
2. Verify neighbor dimming works when hovering over any bento
3. Check that hover states are properly communicated to the DynamicBentoGrid
4. Ensure no console errors or performance issues

### **TASK 3: Implement CSS Animation Timing** ⭐ MEDIUM PRIORITY

**Objective**: Add staggered entrance animations with library-first priority.

**Technical Context**:

- Jaspr doesn't support Flutter's AnimationController/TickerProviderStateMixin
- Use CSS-based animations with `@css` annotations
- Implement timing through CSS animation-delay properties

**Steps**:

1. Examine `lib/components/models/bento_config.dart` for AnimationTimings
2. Add CSS animation classes for entrance effects
3. Implement staggered timing: Libraries first (100ms intervals), then other projects (200ms intervals)
4. Add entrance animations to all three bento components

**Animation Strategy**:

```dart
// In bento components, add entrance animation CSS
@css
static final styles = [
  css('.bento-entrance')
    .opacity(0)
    .transform('translateY(20px)')
    .animation('bentoEntrance 0.6s ease-out forwards'),

  css('@keyframes bentoEntrance')
    .from(opacity: 0, transform: 'translateY(20px)')
    .to(opacity: 1, transform: 'translateY(0)'),
];
```

### **TASK 4: Add Search & Filter UI** ⭐ MEDIUM PRIORITY

**Objective**: Create search bar and filter controls for Phase 5 features.

**Steps**:

1. Create `lib/components/search_filter_bar.dart` component
2. Add real-time search functionality with project name/description filtering
3. Add category-based filter buttons (Library, Game, App, etc.)
4. Integrate with DynamicBentoGrid to filter displayed projects
5. Add search highlighting in bento components

**UI Requirements**:

- Search input with debounced filtering (300ms delay)
- Category filter chips with active/inactive states
- Clear filters button
- Results count display
- Responsive design for mobile/desktop

### **TASK 5: Performance Optimization** ⭐ LOW PRIORITY

**Objective**: Ensure 60fps performance and optimize for large datasets.

**Steps**:

1. Add lazy loading for preview content (images/videos)
2. Implement virtual scrolling for large project collections
3. Add performance monitoring and frame rate validation
4. Optimize CSS animations for GPU acceleration

## 🔍 Key Files to Work With

### Primary Files:

- `lib/components/expanded_bento.dart` - **NEEDS HOVER INTEGRATION**
- `lib/components/dynamic_bento_grid.dart` - Grid orchestration
- `lib/components/models/bento_config.dart` - Animation configuration

### Reference Files:

- `lib/components/micro_bento.dart` - **REFERENCE for hover pattern**
- `lib/components/standard_bento.dart` - **REFERENCE for hover pattern**
- `lib/pages/home_page.dart` - Integration point

### New Files to Create:

- `lib/components/search_filter_bar.dart` - Search and filter UI
- `lib/services/search_service.dart` - Search logic (optional)

## 🎨 Design Guidelines

### Color Palette (Cinematic Theme):

- **Primary Background**: `#2C1810` (Dark brown)
- **Secondary**: `#8B4513` (Saddle brown)
- **Accent**: `#F5F1EB` (Warm white)
- **Hover Effects**: Subtle scale (1.02x) and shadow enhancement

### Animation Principles:

- **Entrance**: Staggered timing, libraries first
- **Hover**: Smooth 200-300ms transitions
- **Expansion**: 400ms duration with easing
- **Performance**: 60fps target, GPU-accelerated transforms

### Responsive Breakpoints:

- **Mobile**: < 768px (1 column)
- **Tablet**: 768-1024px (2 columns)
- **Desktop**: 1024-1280px (3 columns)
- **Large**: > 1280px (4 columns)

## 🚨 Critical Technical Constraints

### Jaspr Limitations:

- **No AnimationController**: Use CSS animations instead
- **Limited CSS Properties**: Some properties require workarounds (see implementation plan)
- **StatelessComponent Preferred**: Better performance than StatefulComponent
- **Extension Types**: Use for type-safe data modeling

### Code Quality Requirements:

- Follow existing extension type patterns
- Maintain type safety throughout
- Use `@css` annotations for styling
- Implement proper error handling
- Add accessibility features (ARIA labels, keyboard navigation)

## 📊 Success Criteria

### Functional Requirements:

- [ ] All three bento types support hover callbacks
- [ ] Hover cascade system works smoothly across the grid
- [ ] Search and filter functionality is responsive and intuitive
- [ ] Entrance animations create engaging user experience

### Performance Requirements:

- [ ] Hover interactions respond within 100ms
- [ ] Animations maintain 60fps
- [ ] Search filtering completes within 200ms
- [ ] No memory leaks during extended use

### Accessibility Requirements:

- [ ] Keyboard navigation works for all interactive elements
- [ ] Screen readers can access all content
- [ ] Focus indicators are visible and logical
- [ ] Color contrast meets WCAG AA standards

## 🔧 Debugging Tips

### Common Issues:

1. **Hover Events Not Firing**: Check `Events.on` binding includes `mouseenter`/`mouseleave`
2. **CSS Animations Not Working**: Verify `@css` annotation and keyframe syntax
3. **Performance Issues**: Use browser dev tools to check for excessive repaints
4. **Type Errors**: Ensure extension types are properly imported and used

### Testing Strategy:

1. Test on multiple screen sizes (mobile, tablet, desktop)
2. Verify hover interactions with mouse and touch devices
3. Test search functionality with various query types
4. Validate accessibility with screen reader tools

## 📝 Documentation Requirements

After completing tasks, update:

- `docs/DYNAMIC_BENTO_IMPLEMENTATION_PLAN.md` - Mark completed tasks
- Add code comments for complex logic
- Document any new patterns or workarounds discovered

## 🎯 Final Goal

Complete Phase 4 & 5 to deliver a fully functional, performant, and accessible dynamic bento layout system that enhances the user experience of browsing the project portfolio.

**Ready to continue? Start with TASK 1: Complete ExpandedBento Hover Integration** 🚀
