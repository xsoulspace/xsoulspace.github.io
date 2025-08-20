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
        'justify-content': 'center',
        'border-radius': '0.75rem',
        'background-size': 'cover',
        'background-position': 'center',
        'color': 'var(--unglazed-bisque)',
        'position': 'relative',
        'overflow': 'hidden',
        'border': '1px solid var(--clay-border)',
        'box-shadow': '0 4px 12px rgba(78, 52, 46, 0.1)',
        'transition': 'all 300ms ease',
      },
    ),

    css('.accent-card:hover').styles(
      raw: const {
        'transform': 'translateY(-2px)',
        'box-shadow': '0 8px 24px rgba(78, 52, 46, 0.15)',
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
            'linear-gradient(135deg, rgba(78, 52, 46, 0.8) 0%, rgba(78, 52, 46, 0.4) 60%, transparent 100%)',
        'backdrop-filter': 'blur(1px)',
      },
    ),

    css('.accent-card__content').styles(
      raw: const {
        'position': 'relative',
        'z-index': '1',
        'background':
            'linear-gradient(135deg, rgba(245, 241, 235, 0.1) 0%, transparent 100%)',
        'backdrop-filter': 'blur(8px)',
        'border-radius': '0.5rem',
        'padding': '1rem',
        'border': '1px solid rgba(212, 196, 176, 0.3)',
      },
    ),

    css('.accent-card__title').styles(
      raw: const {
        'font-size': '1.75rem',
        'font-weight': '600',
        'text-align': 'center',
        'margin': '0 0 0.25rem',
        'text-shadow': '0 2px 8px rgba(78, 52, 46, 0.8)',
        'color': 'var(--unglazed-bisque)',
        'line-height': '1.2',
      },
    ),

    css('.accent-card__subtitle').styles(
      raw: const {
        'font-size': '1rem',
        'font-weight': '400',
        'margin': '0',
        'opacity': '0.95',
        'text-shadow': '0 1px 4px rgba(78, 52, 46, 0.6)',
        'color': 'var(--unglazed-bisque)',
        'text-align': 'center',
        'line-height': '1.4',
      },
    ),
  ];
}
