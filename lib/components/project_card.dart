import 'package:jaspr/jaspr.dart';
import 'package:xsoulspace_web/components/models/project_model.dart';

class ProjectCard extends StatelessComponent {
  const ProjectCard({required this.project, this.isLarge = false, super.key});

  final ProjectModel project;
  final bool isLarge;

  @override
  Iterable<Component> build(final BuildContext context) sync* {
    final cardClasses = [
      'project-card',
      if (isLarge) 'project-card-large',
    ].join(' ');

    yield div(classes: cardClasses, [
      // Card overlay for cinematic effect
      div(classes: 'card-overlay', []),

      div(classes: 'card-content', [
        // Project Type Badge
        div(classes: 'project-type ${_getTypeClass(project.type)}', [
          text(project.type.toUpperCase()),
        ]),

        // Project Title
        h3(classes: 'project-title', [text(project.title)]),

        // Project Description
        p(classes: 'project-description', [text(project.description)]),

        // Contributors Section
        div(classes: 'contributors', [
          p(classes: 'contributors-label', [text('Crafted by:')]),
          div(classes: 'contributors-list', [
            for (final contributor in project.contributors)
              span(classes: 'contributor-tag', [text(contributor)]),
          ]),
        ]),
      ]),

      // Enhanced Card Footer
      div(classes: 'card-footer', [
        div(classes: 'language-tags', [
          for (final lang in project.languages)
            span(classes: 'language-tag', [text(lang)]),
        ]),
        div(classes: 'footer-icons', [
          // Access point icon
          if (project.links.website.isNotEmpty ||
              project.links.telegram.isNotEmpty)
            a(
              classes: 'icon-link',
              href: project.links.website.isNotEmpty
                  ? project.links.website
                  : project.links.telegram,
              target: Target.blank,
              [i(classes: 'fas fa-external-link-alt', [])],
            ),
          // Legal info icon
          if (project.hasLicense || project.hasPrivacy || project.hasTerms)
            div(classes: 'icon-link legal-info', [
              i(classes: 'fas fa-info-circle', []),
            ]),
        ]),
      ]),
    ]);
  }

  String _getTypeClass(final String type) {
    switch (type.toLowerCase()) {
      case 'app':
        return 'project-type-app';
      case 'game':
        return 'project-type-game';
      case 'package':
      case 'library':
        return 'project-type-library';
      case 'bot':
      case 'utility':
      case 'web add-in':
        return 'project-type-utility';
      default:
        return 'project-type-default';
    }
  }

  @css
  static List<StyleRule> get styles => [
    // Enhanced base project card
    css('.project-card').styles(
      backgroundColor: const Color('#E8E2D8'), // soft-linen
      radius: BorderRadius.circular(0.75.rem), // Larger radius
      padding: Padding.all(2.rem), // More padding
      cursor: Cursor.pointer,
      transition: const Transition('all', duration: 400),
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(139, 69, 19, 0.15),
        width: 1.px,
      ),
      display: Display.flex,
      flexDirection: FlexDirection.column,
      justifyContent: JustifyContent.spaceBetween,
      position: Position.relative(),
      overflow: Overflow.hidden,
      minHeight: 280.px, // Minimum height for consistency
    ),

    // Card overlay for cinematic depth
    css('.card-overlay').styles(
      position: Position.absolute(
        top: 0.px,
        left: 0.px,
        right: 0.px,
        bottom: 0.px,
      ),
      backgroundImage: const ImageStyle.url(
        'linear-gradient(135deg, rgba(245, 241, 235, 0.1) 0%, rgba(230, 177, 122, 0.05) 100%)',
      ),
      opacity: 0,
      transition: const Transition('opacity', duration: 400),
      pointerEvents: PointerEvents.none,
    ),

    css('.project-card:hover').styles(
      backgroundColor: const Color('#E6B17A'), // creamy-amber
      transform: Transform.translate(y: (-4).px), // More pronounced lift
      shadow: BoxShadow.combine([
        BoxShadow(
          offsetX: 0.px,
          offsetY: 16.px,
          blur: 40.px,
          color: const Color.rgba(44, 24, 16, 0.2),
        ),
      ]),
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(139, 69, 19, 0.3),
        width: 1.px,
      ),
    ),

    css('.project-card:hover .card-overlay').styles(opacity: 1),

    // Large card variant with enhanced presence
    css('.project-card-large').styles(
      gridPlacement: GridPlacement(
        columnStart: LinePlacement.span(2),
        rowStart: LinePlacement.span(2),
      ),
      minHeight: 400.px, // Taller for large cards
    ),

    // Enhanced project type badges
    css('.project-type').styles(
      display: Display.inlineBlock,
      padding: Padding.symmetric(
        horizontal: 1.rem,
        vertical: 0.375.rem,
      ), // More padding
      radius: BorderRadius.circular(50.percent),
      fontSize: 0.75.rem,
      fontWeight: FontWeight.w600, // Bolder
      margin: Margin.only(bottom: 1.5.rem), // More space
      letterSpacing: 0.05.em,
      transition: const Transition('all', duration: 400),
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

    css('.project-type-utility').styles(
      backgroundColor: const Color('#e0e7ff'), // bg-indigo-100
      color: const Color('#3730a3'), // text-indigo-800
    ),

    css('.project-type-default').styles(
      backgroundColor: const Color('#f3f4f6'), // bg-gray-100
      color: const Color('#1f2937'), // text-gray-800
    ),

    // Enhanced project title
    css('.project-title').styles(
      fontSize: 1.375.rem, // Larger
      fontWeight: FontWeight.w500,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 1.rem),
      transition: const Transition('color', duration: 400),
      lineHeight: 1.3.rem,
    ),

    css('.project-card:hover .project-title').styles(
      color: const Color('#F5F1EB'), // warm-paper
    ),

    // Enhanced project description
    css('.project-description').styles(
      color: const Color('#9B8B7A'), // grain-muted
      fontSize: 0.9375.rem, // Slightly larger
      lineHeight: 1.7.rem, // Better line height
      margin: Margin.only(bottom: 2.rem), // More space
      transition: const Transition('color', duration: 400),
    ),

    css('.project-card:hover .project-description').styles(
      color: const Color('#F5F1EB'), // warm-paper
    ),

    // Enhanced contributors section
    css('.contributors').styles(margin: Margin.only(bottom: 1.5.rem)),

    css('.contributors-label').styles(
      fontSize: 0.8125.rem,
      color: const Color('#8B4513'), // warm-copper
      margin: Margin.only(bottom: 0.75.rem),
      transition: const Transition('color', duration: 400),
      fontWeight: FontWeight.w500,
    ),

    css('.project-card:hover .contributors-label').styles(
      color: const Color('#F5F1EB'), // warm-paper
    ),

    css('.contributors-list').styles(
      display: Display.flex,
      flexWrap: FlexWrap.wrap,
      gap: Gap.all(0.75.rem), // Increased gap
    ),

    css('.contributor-tag').styles(
      padding: Padding.symmetric(
        horizontal: 0.75.rem,
        vertical: 0.375.rem,
      ), // More padding
      backgroundColor: const Color('#F5F1EB'), // warm-paper
      radius: BorderRadius.circular(0.375.rem), // Larger radius
      fontSize: 0.8125.rem,
      color: const Color('#2C1810'), // deep-espresso
      transition: const Transition('all', duration: 400),
      fontWeight: FontWeight.w500,
    ),

    css('.project-card:hover .contributor-tag').styles(
      backgroundColor: const Color('#2C1810'), // deep-espresso
      color: const Color('#F5F1EB'), // warm-paper
    ),

    // Enhanced Card Footer
    css('.card-footer').styles(
      display: Display.flex,
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.center,
      margin: Margin.only(top: Unit.auto), // Push to bottom
      padding: Padding.only(top: 1.5.rem),
      border: Border.only(
        top: BorderSide.solid(
          color: const Color.rgba(139, 69, 19, 0.15),
          width: 1.px,
        ),
      ),
    ),

    css('.language-tags').styles(
      display: Display.flex,
      gap: Gap.all(0.5.rem),
      flexWrap: FlexWrap.wrap,
    ),

    css('.language-tag').styles(
      padding: Padding.symmetric(horizontal: 0.625.rem, vertical: 0.3125.rem),
      backgroundColor: const Color('#F5F1EB'), // warm-paper
      radius: BorderRadius.circular(0.375.rem),
      fontSize: 0.75.rem,
      color: const Color('#2C1810'), // deep-espresso
      border: Border.all(BorderSide(color: const Color.rgba(139, 69, 19, 0.2))),
      fontWeight: FontWeight.w500,
      transition: const Transition('all', duration: 400),
    ),

    css('.project-card:hover .language-tag').styles(
      backgroundColor: const Color('#2C1810'), // deep-espresso
      color: const Color('#F5F1EB'), // warm-paper
      border: Border.all(
        BorderSide(color: const Color.rgba(245, 241, 235, 0.3)),
      ),
    ),

    css('.footer-icons').styles(display: Display.flex, gap: Gap.all(1.rem)),

    css('.icon-link').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
      width: 2.5.rem,
      height: 2.5.rem,
      radius: BorderRadius.circular(50.percent),
      backgroundColor: const Color.rgba(139, 69, 19, 0.1),
      transition: const Transition('all', duration: 400),
      cursor: Cursor.pointer,
    ),

    css('.icon-link:hover').styles(
      backgroundColor: const Color('#8B4513'), // warm-copper
      transform: Transform.scale(1.1),
    ),

    css('.icon-link i').styles(
      fontSize: 1.rem,
      color: const Color('#8B4513'), // warm-copper
      transition: const Transition('color', duration: 400),
    ),

    css('.icon-link:hover i').styles(
      color: const Color('#F5F1EB'), // warm-paper
    ),

    css(
      '.project-card:hover .icon-link',
    ).styles(backgroundColor: const Color.rgba(245, 241, 235, 0.2)),

    css('.project-card:hover .icon-link i').styles(
      color: const Color('#F5F1EB'), // warm-paper
    ),

    // Legal info icon special styling
    css('.legal-info').styles(position: Position.relative()),

    // Responsive design
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css(
        '.project-card',
      ).styles(padding: Padding.all(1.5.rem), minHeight: 240.px),
      css('.project-card-large').styles(
        gridPlacement: GridPlacement(
          columnStart: LinePlacement.span(1),
          rowStart: LinePlacement.span(1),
        ),
        minHeight: 240.px,
      ),
      css('.project-title').styles(fontSize: 1.25.rem),
      css('.project-description').styles(fontSize: 0.875.rem),
    ]),

    css.media(MediaQuery.screen(minWidth: 1024.px), [
      css(
        '.project-card-large',
      ).styles(padding: Padding.all(2.5.rem), minHeight: 450.px),
      css('.project-card-large .project-title').styles(fontSize: 1.5.rem),
      css('.project-card-large .project-description').styles(fontSize: 1.rem),
    ]),
  ];
}
