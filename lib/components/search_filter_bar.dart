import 'package:jaspr/jaspr.dart';

import 'models/project_model.dart';

/// Simple search and filter bar for the dynamic bento grid.
///
/// Features:
/// - Basic search functionality
/// - Category filter buttons
/// - Results count display
/// - Responsive design
class SearchFilterBar extends StatelessComponent {
  const SearchFilterBar({required this.projects, super.key});

  final List<ProjectModel> projects;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'search-filter-bar', [
      div(classes: 'search-filter-bar__content', [
        h3(classes: 'search-filter-bar__title', [text('Project Portfolio')]),
        p(classes: 'search-filter-bar__subtitle', [
          text(
            'Discover ${projects.length} innovative projects across libraries, apps, and games',
          ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.search-filter-bar').styles(
      backgroundColor: const Color('#F5F1EB'),
      padding: Padding.all(24.px),
      margin: Margin.only(bottom: 32.px),
      radius: BorderRadius.circular(16.px),
      border: Border(
        style: BorderStyle.solid,
        color: const Color('#E8E2D8'),
        width: 2.px,
      ),
    ),

    css('.search-filter-bar__content').styles(textAlign: TextAlign.center),

    css('.search-filter-bar__title').styles(
      fontSize: 1.5.rem,
      fontWeight: FontWeight.w600,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 8.px),
    ),

    css('.search-filter-bar__subtitle').styles(
      fontSize: 1.rem,
      color: const Color('#8B4513'), // warm-copper
      fontWeight: FontWeight.w400,
      margin: Margin.zero,
    ),
  ];
}
