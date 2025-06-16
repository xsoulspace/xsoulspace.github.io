import 'package:jaspr/jaspr.dart';
import 'package:xsoulspace_web/components/models/bento_block_model.dart';

class AccentCard extends StatelessComponent {
  const AccentCard({required this.accent, super.key});

  final AccentBlock accent;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'accent-card',
      styles: Styles.raw({
        if (accent.backgroundColor != null)
          'background-color': accent.backgroundColor!,
        if (accent.imageUrl != null)
          'background-image': 'url(${accent.imageUrl!})',
      }),
      [
        div(classes: 'accent-card__content', [
          h3(classes: 'accent-card__title', [text(accent.title)]),
          if (accent.subtitle != null)
            p(classes: 'accent-card__subtitle', [text(accent.subtitle!)]),
        ]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.accent-card').styles(
      raw: const {
        'height': '100%',
        'width': '100%',
        'padding': '1.5rem',
        'display': 'flex',
        'flex-direction': 'column',
        'justify-content': 'flex-end',
        'border-radius': '1rem',
        'background-size': 'cover',
        'background-position': 'center',
        'color': '#FFFFFF',
        'position': 'relative',
        'overflow': 'hidden',
      },
    ),
    css('.accent-card::before').styles(
      raw: const {
        'content': '""',
        'position': 'absolute',
        'top': '0',
        'left': '0',
        'right': '0',
        'bottom': '0',
        'background':
            'linear-gradient(to top, rgba(0,0,0,0.7) 0%, rgba(0,0,0,0) 60%)',
      },
    ),
    css(
      '.accent-card__content',
    ).styles(raw: const {'position': 'relative', 'z-index': '1'}),
    css('.accent-card__title').styles(
      raw: const {
        'font-size': '1.75rem',
        'font-weight': '600',
        'margin': '0 0 0.25rem',
        'text-shadow': '0 2px 4px rgba(0,0,0,0.5)',
      },
    ),
    css('.accent-card__subtitle').styles(
      raw: const {
        'font-size': '1rem',
        'font-weight': '400',
        'margin': '0',
        'opacity': '0.9',
        'text-shadow': '0 1px 3px rgba(0,0,0,0.5)',
      },
    ),
  ];
}
