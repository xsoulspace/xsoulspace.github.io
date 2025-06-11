import 'package:jaspr/jaspr.dart';
import 'package:xsoulspace_web/components/models/project_model.dart';

import 'project_card.dart';

class BentoGrid extends StatelessComponent {
  const BentoGrid({required this.projects, super.key});

  final List<ProjectModel> projects;

  @override
  Iterable<Component> build(final BuildContext context) sync* {
    yield section(classes: 'bento-grid-section', [
      // Section Header
      div(classes: 'section-header', [
        h2(classes: 'section-title', [text('Creative Projects')]),
        p(classes: 'section-subtitle', [
          text(
            'Each project tells a story of ethical innovation and creative collaboration',
          ),
        ]),
      ]),

      // Bento Grid Layout
      div(classes: 'bento-grid', [
        for (final (index, project) in projects.indexed)
          ProjectCard(
            project: project,
            isLarge: index == 0, // Make the first project large
          ),
      ]),

      // Ethical Principles Section
      div(classes: 'ethical-principles', [
        h2(classes: 'principles-title', [text('Our Ethical Foundation')]),
        div(classes: 'principles-grid', [
          div(classes: 'principle-card', [
            h3(classes: 'principle-title', [text('🌱 Sustainability')]),
            p(classes: 'principle-description', [
              text(
                'Building technology that considers long-term environmental and social impact',
              ),
            ]),
          ]),
          div(classes: 'principle-card', [
            h3(classes: 'principle-title', [text('🤝 Transparency')]),
            p(classes: 'principle-description', [
              text(
                'Open communication, clear documentation, and honest practices in all our work',
              ),
            ]),
          ]),
          div(classes: 'principle-card', [
            h3(classes: 'principle-title', [text('✨ Innovation')]),
            p(classes: 'principle-description', [
              text(
                'Pushing boundaries while maintaining ethical standards and human-centered design',
              ),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // Section Header
    css(
      '.section-header',
    ).styles(textAlign: TextAlign.center, margin: Margin.only(bottom: 4.rem)),

    css('.section-title').styles(
      fontSize: 2.25.rem, // text-4xl
      fontWeight: FontWeight.w300,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 1.rem),
    ),

    css('.section-subtitle').styles(
      fontSize: 1.25.rem, // text-xl
      color: const Color('#8B4513'), // warm-copper
      maxWidth: 42.rem, // max-w-2xl
      margin: Margin.symmetric(horizontal: Unit.auto),
      lineHeight: 1.625.rem, // leading-relaxed
    ),

    // Bento Grid Layout
    css('.bento-grid').styles(
      display: Display.grid,
      gridTemplate: GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1))]),
      ),
      gap: Gap.all(1.5.rem),
      autoRows: [TrackSize.minmax(TrackSize(200.px), TrackSize.auto)],
    ),

    // Contributor Spotlight
    css('.contributor-spotlight').styles(
      backgroundColor: const Color('#E8E2D8'), // soft-linen
      radius: BorderRadius.circular(0.5.rem),
      padding: Padding.all(1.5.rem),
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(139, 69, 19, 0.1),
        width: 1.px,
      ),
    ),

    css('.contributor-title').styles(
      fontSize: 1.25.rem, // text-xl
      fontWeight: FontWeight.w500,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 1.rem),
    ),

    css('.contributor-avatar').styles(
      width: 4.rem, // w-16
      height: 4.rem, // h-16
      backgroundColor: const Color('#8B4513'), // warm-copper
      radius: BorderRadius.circular(50.percent),
      margin: Margin.only(bottom: 1.rem),
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
    ),

    css('.contributor-name').styles(
      fontWeight: FontWeight.w500,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 0.5.rem),
    ),

    css('.contributor-bio').styles(
      fontSize: 0.875.rem, // text-sm
      color: const Color('#9B8B7A'), // grain-muted
      margin: Margin.only(bottom: 1.rem),
    ),

    css('.contributor-stats').styles(
      fontSize: 0.75.rem, // text-xs
      color: const Color('#8B4513'), // warm-copper
    ),

    // Ethical Principles Section
    css(
      '.ethical-principles',
    ).styles(margin: Margin.only(top: 6.rem), textAlign: TextAlign.center),

    css('.principles-title').styles(
      fontSize: 1.875.rem, // text-3xl
      fontWeight: FontWeight.w300,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 2.rem),
    ),

    css('.principles-grid').styles(
      display: Display.grid,
      gridTemplate: GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1))]),
      ),
      gap: Gap.all(2.rem),
      maxWidth: 56.rem, // max-w-4xl
      margin: Margin.symmetric(horizontal: Unit.auto),
    ),

    css('.principle-card').styles(
      backgroundColor: const Color('#E8E2D8'), // soft-linen
      radius: BorderRadius.circular(0.5.rem),
      padding: Padding.all(1.5.rem),
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(139, 69, 19, 0.1),
        width: 1.px,
      ),
      transition: const Transition('all', duration: 300),
    ),

    css('.principle-card:hover').styles(
      transform: Transform.translate(y: (-1).px),
      shadow: BoxShadow.combine([
        BoxShadow(
          offsetX: 0.px,
          offsetY: 4.px,
          blur: 12.px,
          color: const Color.rgba(44, 24, 16, 0.1),
        ),
      ]),
    ),

    css('.principle-title').styles(
      fontSize: 1.125.rem, // text-lg
      fontWeight: FontWeight.w500,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 0.75.rem),
    ),

    css('.principle-description').styles(
      color: const Color('#9B8B7A'), // grain-muted
      fontSize: 0.875.rem, // text-sm
      lineHeight: 1.625.rem, // leading-relaxed
    ),

    // Responsive design
    css.media(MediaQuery.screen(minWidth: 768.px), [
      css('.section-title').styles(fontSize: 3.rem), // md:text-5xl
      css('.bento-grid').styles(
        gridTemplate: GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
      ),
      css('.principles-grid').styles(
        gridTemplate: GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
      ),
    ]),

    css.media(MediaQuery.screen(minWidth: 1024.px), [
      css('.bento-grid').styles(
        gridTemplate: GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
      ),
    ]),

    css.media(MediaQuery.screen(minWidth: 1280.px), [
      css('.bento-grid').styles(
        gridTemplate: GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
      ),
    ]),
  ];
}
