import 'package:jaspr/jaspr.dart';
import 'package:xsoulspace_web/components/models/project_model.dart';

import 'project_card.dart';

class BentoGrid extends StatelessComponent {
  const BentoGrid({required this.projects, super.key});

  final List<ProjectModel> projects;

  @override
  Iterable<Component> build(final BuildContext context) sync* {
    yield section(classes: 'bento-grid-section', [
      // Enhanced Section Header
      div(classes: 'section-header', [
        h2(classes: 'section-title', [text('Creative Universe')]),
        p(classes: 'section-subtitle', [
          text(
            'Each project tells a story of ethical innovation, creative collaboration, and the pursuit of meaningful technology that serves humanity.',
          ),
        ]),
      ]),

      // Bento Grid Layout
      div(classes: 'bento-grid', [
        for (final (index, project) in projects.indexed)
          ProjectCard(
            project: project,
            isLarge:
                index == 0 ||
                (index > 0 && index % 7 == 0), // Strategic large cards
          ),
      ]),

      // Enhanced Ethical Principles Section
      div(classes: 'ethical-principles', [
        h2(classes: 'principles-title', [text('Our Ethical Foundation')]),
        p(classes: 'principles-subtitle', [
          text(
            'The values that guide every line of code, every design decision, and every collaboration.',
          ),
        ]),
        div(classes: 'principles-grid', [
          div(classes: 'principle-card', [
            div(classes: 'principle-icon', [text('🌱')]),
            h3(classes: 'principle-title', [text('Sustainability')]),
            p(classes: 'principle-description', [
              text(
                'Building technology that considers long-term environmental and social impact, creating solutions that endure and evolve responsibly.',
              ),
            ]),
          ]),
          div(classes: 'principle-card', [
            div(classes: 'principle-icon', [text('🤝')]),
            h3(classes: 'principle-title', [text('Transparency')]),
            p(classes: 'principle-description', [
              text(
                'Open communication, clear documentation, and honest practices in all our work, fostering trust through radical transparency.',
              ),
            ]),
          ]),
          div(classes: 'principle-card', [
            div(classes: 'principle-icon', [text('✨')]),
            h3(classes: 'principle-title', [text('Innovation')]),
            p(classes: 'principle-description', [
              text(
                'Pushing boundaries while maintaining ethical standards and human-centered design, creating the future we want to live in.',
              ),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // Enhanced Section Header
    css('.section-header').styles(
      textAlign: TextAlign.center,
      margin: Margin.only(bottom: 5.rem, left: Unit.auto, right: Unit.auto),
      maxWidth: 56.rem,
    ),

    css('.section-title').styles(
      fontSize: 2.5.rem, // Larger title
      fontWeight: FontWeight.w200, // Lighter weight for elegance
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 1.5.rem),
      letterSpacing: (-0.01).em,
      lineHeight: 1.2.rem,
    ),

    css('.section-subtitle').styles(
      fontSize: 1.125.rem, // Slightly larger
      color: const Color('#8B4513'), // warm-copper
      lineHeight: 1.7.rem, // Better line height
      fontWeight: FontWeight.w400,
    ),

    // Enhanced Bento Grid Layout
    css('.bento-grid').styles(
      display: Display.grid,
      gridTemplate: GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1))]),
      ),
      gap: Gap.all(2.rem), // Increased gap
      autoRows: [
        TrackSize.minmax(TrackSize(220.px), TrackSize.auto),
      ], // Taller minimum
      margin: Margin.only(bottom: 8.rem),
    ),

    // Enhanced Contributor Spotlight
    css('.contributor-spotlight').styles(
      backgroundColor: const Color('#E8E2D8'), // soft-linen
      radius: BorderRadius.circular(0.75.rem), // Larger radius
      padding: Padding.all(2.rem), // More padding
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(139, 69, 19, 0.1),
        width: 1.px,
      ),
      transition: const Transition('all', duration: 400),
    ),

    css('.contributor-spotlight:hover').styles(
      transform: Transform.translate(y: (-2).px),
      shadow: BoxShadow.combine([
        BoxShadow(
          offsetX: 0.px,
          offsetY: 8.px,
          blur: 25.px,
          color: const Color.rgba(44, 24, 16, 0.1),
        ),
      ]),
    ),

    css('.contributor-title').styles(
      fontSize: 1.375.rem, // Larger
      fontWeight: FontWeight.w400,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 1.5.rem),
    ),

    css('.contributor-avatar').styles(
      width: 5.rem, // Larger avatar
      height: 5.rem,
      backgroundColor: const Color('#8B4513'), // warm-copper
      radius: BorderRadius.circular(50.percent),
      margin: Margin.only(bottom: 1.5.rem),
      display: Display.flex,
      alignItems: AlignItems.center,
      justifyContent: JustifyContent.center,
    ),

    css('.contributor-name').styles(
      fontWeight: FontWeight.w500,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 0.75.rem),
      fontSize: 1.125.rem,
    ),

    css('.contributor-bio').styles(
      fontSize: 0.9375.rem, // Slightly larger
      color: const Color('#9B8B7A'), // grain-muted
      margin: Margin.only(bottom: 1.5.rem),
      lineHeight: 1.6.rem,
    ),

    css('.contributor-stats').styles(
      fontSize: 0.8125.rem,
      color: const Color('#8B4513'), // warm-copper
      fontWeight: FontWeight.w500,
    ),

    // Enhanced Ethical Principles Section
    css('.ethical-principles').styles(
      margin: Margin.only(top: 8.rem, left: Unit.auto, right: Unit.auto),
      textAlign: TextAlign.center,
      maxWidth: 72.rem, // Wider container
    ),

    css('.principles-title').styles(
      fontSize: 2.25.rem, // Larger
      fontWeight: FontWeight.w200, // Lighter weight
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 1.rem),
      letterSpacing: (-0.01).em,
    ),

    css('.principles-subtitle').styles(
      fontSize: 1.125.rem,
      color: const Color('#8B4513'), // warm-copper
      margin: Margin.only(bottom: 3.rem, left: Unit.auto, right: Unit.auto),
      maxWidth: 48.rem,
      lineHeight: 1.7.rem,
    ),

    css('.principles-grid').styles(
      display: Display.grid,
      gridTemplate: GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1))]),
      ),
      gap: Gap.all(2.5.rem), // Increased gap
      maxWidth: 64.rem, // Wider
      margin: Margin.symmetric(horizontal: Unit.auto),
    ),

    css('.principle-card').styles(
      backgroundColor: const Color('#E8E2D8'), // soft-linen
      radius: BorderRadius.circular(0.75.rem), // Larger radius
      padding: Padding.all(2.5.rem), // More padding
      border: Border(
        style: BorderStyle.solid,
        color: const Color.rgba(139, 69, 19, 0.1),
        width: 1.px,
      ),
      transition: const Transition('all', duration: 400),
      textAlign: TextAlign.center,
    ),

    css('.principle-card:hover').styles(
      transform: Transform.translate(y: (-3).px),
      shadow: BoxShadow.combine([
        BoxShadow(
          offsetX: 0.px,
          offsetY: 12.px,
          blur: 30.px,
          color: const Color.rgba(44, 24, 16, 0.12),
        ),
      ]),
      backgroundColor: const Color('#E6B17A'), // creamy-amber on hover
    ),

    css('.principle-icon').styles(
      fontSize: 3.rem, // Larger icon
      margin: Margin.only(bottom: 1.5.rem),
      display: Display.block,
    ),

    css('.principle-title').styles(
      fontSize: 1.25.rem,
      fontWeight: FontWeight.w500,
      color: const Color('#2C1810'), // deep-espresso
      margin: Margin.only(bottom: 1.rem),
      transition: const Transition('color', duration: 400),
    ),

    css('.principle-card:hover .principle-title').styles(
      color: const Color('#F5F1EB'), // warm-paper on hover
    ),

    css('.principle-description').styles(
      color: const Color('#9B8B7A'), // grain-muted
      fontSize: 0.9375.rem,
      lineHeight: 1.7.rem, // Better line height
      transition: const Transition('color', duration: 400),
    ),

    css('.principle-card:hover .principle-description').styles(
      color: const Color('#F5F1EB'), // warm-paper on hover
    ),

    // Responsive design
    css.media(MediaQuery.screen(minWidth: 768.px), [
      css('.section-title').styles(fontSize: 3.5.rem),
      css('.section-subtitle').styles(fontSize: 1.25.rem),
      css('.bento-grid').styles(
        gridTemplate: GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
        gap: Gap.all(2.5.rem),
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
      css('.principles-title').styles(fontSize: 2.75.rem),
      css('.principles-subtitle').styles(fontSize: 1.25.rem),
    ]),

    css.media(MediaQuery.screen(minWidth: 1024.px), [
      css('.section-title').styles(fontSize: 4.rem),
      css('.bento-grid').styles(
        gridTemplate: GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
      ),
      css('.principles-title').styles(fontSize: 3.rem),
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
