import 'package:jaspr/jaspr.dart';
import 'package:xsoulspace_web/components/models/project_group_model.dart';

import 'bento_grid.dart';

class BentoSection extends StatelessComponent {
  const BentoSection({required this.group, super.key});

  final ProjectGroup group;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final sectionId = group.title
        .toLowerCase()
        .replaceAll(', ', '-')
        .replaceAll(' & ', '-')
        .replaceAll(' ', '-');

    final sectionClasses = [
      'bento-section',
      if (group.layoutType == 'showcase') 'bento-section--showcase',
    ].join(' ');

    yield section(classes: sectionClasses, id: sectionId, [
      // Group header with visual identity
      header(classes: 'bento-section__header', [
        div(classes: 'bento-section__title-area', [
          span(classes: 'bento-section__icon', [text(group.icon)]),
          div(classes: 'bento-section__text', [
            h2(classes: 'bento-section__title', [text(group.title)]),
            p(classes: 'bento-section__subtitle', [text(group.subtitle)]),
          ]),
        ]),
      ]),

      // True bento grid with asymmetrical layout
      BentoGrid(blocks: group.blocks, layoutType: group.layoutType),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // Remove the outer box - use margins for spacing instead
    css('.bento-section').styles(
      raw: const {
        'position': 'relative',
        'padding': '4rem 0', // Vertical spacing between sections
      },
    ),

    // Showcase-specific overrides for viewport fitting
    css('.bento-section--showcase').styles(
      raw: const {
        'min-height': '80vh', // Reduced height
        'display': 'flex',
        'flex-direction': 'column',
        'justify-content': 'center',
      },
    ),

    // Section header styling
    css('.bento-section__header').styles(
      raw: const {
        'display': 'flex',
        'align-items': 'center',
        'margin-bottom': '2.5rem',
        'padding-bottom': '1.5rem',
        'border-bottom': '2px solid #EDE7DD',
        'max-width': '1600px',
        'margin-left': 'auto',
        'margin-right': 'auto',
        'padding-left': '2rem',
        'padding-right': '2rem',
      },
    ),

    css('.bento-section__title-area').styles(
      raw: const {'display': 'flex', 'align-items': 'center', 'gap': '1.5rem'},
    ),

    css('.bento-section__icon').styles(
      raw: const {
        'font-size': '3rem',
        'line-height': '1',
        'filter': 'drop-shadow(0 2px 4px rgba(78, 52, 46, 0.1))',
      },
    ),

    css('.bento-section__text').styles(
      raw: const {
        'display': 'flex',
        'flex-direction': 'column',
        'gap': '0.5rem',
      },
    ),

    css('.bento-section__title').styles(
      raw: const {
        'font-size': '2rem',
        'font-weight': '600',
        'color': '#4E342E',
        'margin': '0',
        'line-height': '1.2',
        'letter-spacing': '-0.02em',
      },
    ),

    css('.bento-section__subtitle').styles(
      raw: const {
        'font-size': '1.125rem',
        'font-weight': '400',
        'color': '#6B4E3D',
        'margin': '0',
        'line-height': '1.4',
      },
    ),

    css('.bento-section__count').styles(
      raw: const {
        'background': 'linear-gradient(135deg, #EDE7DD 0%, #D4C4B0 100%)',
        'color': '#4E342E',
        'padding': '0.75rem 1.5rem',
        'border-radius': '2rem',
        'font-weight': '600',
        'font-size': '1rem',
        'box-shadow': 'inset 0 1px 3px rgba(78, 52, 46, 0.1)',
      },
    ),

    // Responsive adjustments for section padding
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      css('.bento-section').styles(
        raw: const {
          'padding': '2rem 0', // Reduced vertical padding
        },
      ),
      css('.bento-section__header').styles(
        raw: const {
          'padding-left': '1rem',
          'padding-right': '1rem',
          'margin-bottom': '1.5rem',
        },
      ),
    ]),
  ];
}
