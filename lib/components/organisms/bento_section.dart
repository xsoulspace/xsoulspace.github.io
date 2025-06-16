import 'package:jaspr/jaspr.dart';
import 'package:xsoulspace_web/components/models/bento_block_model.dart';
import 'package:xsoulspace_web/components/models/project_group_model.dart';
import 'package:xsoulspace_web/components/models/project_model.dart';

import 'bento_grid.dart';

class BentoSection extends StatelessComponent {
  const BentoSection({required this.group, super.key});

  final ProjectGroup group;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final sectionId = group.anchor
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
          p(classes: 'bento-section__title', [text(group.title)]),
        ]),
      ]),

      if (group.blocks.any(
        (block) =>
            block.type == BentoBlockType.accent &&
            block.accent!.size == ProjectSize.text,
      ))
        // TODO(arenukvern): create unique hand crafted layout for text block
        div(classes: 'bento-section__accent', [
          p(classes: 'bento-section__accent-text', [
            text(group.blocks.first.accent!.title),
          ]),
        ])
      else
        // True bento grid with asymmetrical layout
        BentoGrid(blocks: group.blocks, layoutType: group.layoutType),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css(
      '.bento-section',
    ).styles(raw: const {'position': 'relative', 'margin-right': '8rem'}),

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
        'justify-content': 'flex-end',
        'margin-bottom': '5rem',
        'padding-bottom': '1.5rem',
        'max-width': '1600px',
        'margin-left': 'auto',
        'padding-right': '2rem',
      },
    ),

    css('.bento-section__title-area').styles(
      raw: const {
        'display': 'flex',
        'flex-direction': 'column',
        'align-items': 'flex-end',
        'gap': '1rem',
        'text-align': 'center',
      },
    ),

    css('.bento-section__icon').styles(
      raw: const {
        'font-size': '3rem',
        'line-height': '1',
        'filter': 'drop-shadow(0 2px 4px rgba(78, 52, 46, 0.1))',
      },
    ),

    css('.bento-section__title').styles(
      raw: const {
        'font-size': '2rem',
        'margin': '0',
        'line-height': '1.2',
        'letter-spacing': '-0.02em',
        'font-weight': '300',
        'color': '#4E342E', // earthy-brown
        'background': 'linear-gradient(135deg, #4E342E 0%, #6B4E3D 100%)',
        'background-clip': 'text',
        '-webkit-background-clip': 'text',
        '-webkit-text-fill-color': 'transparent',
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
      css(
        '.bento-section__header',
      ).styles(raw: const {'padding-right': '1rem', 'margin-bottom': '1.5rem'}),
    ]),
  ];
}
