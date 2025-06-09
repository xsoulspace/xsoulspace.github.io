import 'package:jaspr/jaspr.dart';

class ProjectCard extends StatelessComponent {
  const ProjectCard({
    required this.title,
    required this.description,
    required this.type,
    required this.contributors,
    super.key,
    this.isLarge = false,
  });
  final String title;
  final String description;
  final String type;
  final List<String> contributors;
  final bool isLarge;

  @override
  Iterable<Component> build(final BuildContext context) sync* {
    final cardClasses = [
      'project-card',
      if (isLarge) 'project-card-large',
    ].join(' ');

    yield div(
      classes: cardClasses,
      [
        // Project Type Badge
        div(
          classes: 'project-type ${_getTypeClass(type)}',
          [text(type.toUpperCase())],
        ),

        // Project Title
        h3(
          classes: 'project-title',
          [text(title)],
        ),

        // Project Description
        p(
          classes: 'project-description',
          [text(description)],
        ),

        // Contributors
        div(
          classes: 'contributors',
          [
            p(
              classes: 'contributors-label',
              [text('Contributors:')],
            ),
            div(
              classes: 'contributors-list',
              [
                for (final contributor in contributors)
                  span(
                    classes: 'contributor-tag',
                    [text(contributor)],
                  ),
              ],
            ),
          ],
        ),

        // Project Stats (for large cards)
        if (isLarge)
          div(
            classes: 'project-stats',
            [
              div(
                classes: 'project-stats-content',
                [
                  span([text('Stars: 1.2k')]),
                  span([text('Forks: 243')]),
                  span([text('Issues: 12')]),
                ],
              ),
            ],
          ),
      ],
    );
  }

  String _getTypeClass(final String type) {
    switch (type.toLowerCase()) {
      case 'app':
        return 'project-type-app';
      case 'game':
        return 'project-type-game';
      case 'library':
        return 'project-type-library';
      default:
        return 'project-type-default';
    }
  }

  @css
  static List<StyleRule> get styles => [
        // Base project card
        css('.project-card').styles(
          backgroundColor: const Color('#E8E2D8'), // soft-linen
          radius: BorderRadius.circular(0.5.rem),
          padding: Padding.all(1.5.rem),
          cursor: Cursor.pointer,
          transition: const Transition('all', duration: 300),
          border: Border(
            style: BorderStyle.solid,
            color: const Color.rgba(139, 69, 19, 0.1),
            width: 1.px,
          ),
        ),

        css('.project-card:hover').styles(
          backgroundColor: const Color('#E6B17A'), // creamy-amber
          transform: Transform.translate(y: (-2).px),
          shadow: BoxShadow.combine([
            BoxShadow(
              offsetX: 0.px,
              offsetY: 8.px,
              blur: 25.px,
              color: const Color.rgba(44, 24, 16, 0.15),
            ),
          ]),
        ),

        // Large card variant
        css('.project-card-large').styles(
          gridPlacement: GridPlacement(
            columnStart: LinePlacement.span(2),
            rowStart: LinePlacement.span(2),
          ),
        ),

        // Project type badges
        css('.project-type').styles(
          display: Display.inlineBlock,
          padding: Padding.symmetric(horizontal: 0.75.rem, vertical: 0.25.rem),
          radius: BorderRadius.circular(50.percent),
          fontSize: 0.75.rem, // text-xs
          fontWeight: FontWeight.w500,
          margin: Margin.only(bottom: 1.rem),
        ),

        css('.project-type-app').styles(
          backgroundColor: const Color('#dbeafe'), // bg-blue-100
          color: const Color('#1e40af'), // text-blue-800
        ),

        css('.project-type-game').styles(
          backgroundColor: const Color('#f3e8ff'), // bg-purple-100
          color: const Color('#6b21a8'), // text-purple-800
        ),

        css('.project-type-library').styles(
          backgroundColor: const Color('#dcfce7'), // bg-green-100
          color: const Color('#166534'), // text-green-800
        ),

        css('.project-type-default').styles(
          backgroundColor: const Color('#f3f4f6'), // bg-gray-100
          color: const Color('#1f2937'), // text-gray-800
        ),

        // Project title
        css('.project-title').styles(
          fontSize: 1.25.rem, // text-xl
          fontWeight: FontWeight.w500,
          color: const Color('#2C1810'), // deep-espresso
          margin: Margin.only(bottom: 0.75.rem),
          transition: const Transition('color', duration: 300),
        ),

        css('.project-card:hover .project-title').styles(
          color: const Color('#F5F1EB'), // warm-paper
        ),

        // Project description
        css('.project-description').styles(
          color: const Color('#9B8B7A'), // grain-muted
          fontSize: 0.875.rem, // text-sm
          lineHeight: 1.625.rem, // leading-relaxed
          margin: Margin.only(bottom: 1.5.rem),
          transition: const Transition('color', duration: 300),
        ),

        css('.project-card:hover .project-description').styles(
          color: const Color('#F5F1EB'), // warm-paper
        ),

        // Contributors section
        css('.contributors-label').styles(
          fontSize: 0.75.rem, // text-xs
          color: const Color('#8B4513'), // warm-copper
          margin: Margin.only(bottom: 0.5.rem),
          transition: const Transition('color', duration: 300),
        ),

        css('.project-card:hover .contributors-label').styles(
          color: const Color('#F5F1EB'), // warm-paper
        ),

        css('.contributors-list').styles(
          display: Display.flex,
          flexWrap: FlexWrap.wrap,
          gap: Gap.all(0.5.rem),
        ),

        css('.contributor-tag').styles(
          padding: Padding.symmetric(horizontal: 0.5.rem, vertical: 0.25.rem),
          backgroundColor: const Color('#F5F1EB'), // warm-paper
          radius: BorderRadius.circular(0.25.rem),
          fontSize: 0.75.rem, // text-xs
          color: const Color('#2C1810'), // deep-espresso
          transition: const Transition('all', duration: 300),
        ),

        css('.project-card:hover .contributor-tag').styles(
          backgroundColor: const Color('#2C1810'), // deep-espresso
          color: const Color('#F5F1EB'), // warm-paper
        ),

        // Project stats (for large cards)
        css('.project-stats').styles(
          margin: Margin.only(top: 1.5.rem),
          padding: Padding.only(top: 1.5.rem),
          border: Border.only(
            top: BorderSide.solid(
              color: const Color('#9B8B7A'), // grain-muted
              width: 1.px,
            ),
          ),
        ),

        css('.project-stats-content').styles(
          display: Display.flex,
          justifyContent: JustifyContent.spaceBetween,
          fontSize: 0.75.rem, // text-xs
          color: const Color('#8B4513'), // warm-copper
          transition: const Transition('color', duration: 300),
        ),

        css('.project-card:hover .project-stats-content').styles(
          color: const Color('#F5F1EB'), // warm-paper
        ),

        // Responsive design
        css.media(MediaQuery.screen(maxWidth: 768.px), [
          css('.project-card-large').styles(
            gridPlacement: GridPlacement(
              columnStart: LinePlacement.span(1),
              rowStart: LinePlacement.span(1),
            ),
          ),
        ]),
      ];
}
