import 'package:jaspr/jaspr.dart';
import 'package:xsoulspace_web/components/molecules/sticky_nav.dart';

/// A full-screen overlay that presents navigation items in a bento-style grid.
/// Designed for mobile navigation.
class MobileMenuOverlay extends StatelessComponent {
  const MobileMenuOverlay({
    required this.items,
    required this.onClose,
    super.key,
  });

  /// The list of navigation items to display.
  final List<NavItem> items;

  /// Callback triggered when the close button is pressed.
  final VoidCallback onClose;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'menu-overlay',
      events: {'click': (e) => onClose()},
      [
        div(
          classes: 'menu-overlay__content',
          events: {'click': (e) => e.stopPropagation()},
          [
            // Header with title and close button
            header(classes: 'menu-overlay__header', [
              span([text('Navigation')]),
              button(
                classes: 'menu-overlay__close-btn',
                events: {'click': (e) => onClose()},
                [i(classes: 'fas fa-times', [])],
              ),
            ]),
            // Bento grid for navigation items
            div(classes: 'menu-overlay__grid', [
              for (final item in items)
                a(
                  href: '#${item.targetId}',
                  classes: 'menu-overlay__grid-item',
                  events: {'click': (e) => onClose()},
                  [
                    span([text(item.title)]),
                  ],
                ),
            ]),
          ],
        ),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.menu-overlay').styles(
      raw: const {
        'position': 'fixed',
        'top': '0',
        'left': '0',
        'width': '100%',
        'height': '100%',
        'background-color': 'rgba(250, 246, 240, 0.8)',
        'backdrop-filter': 'blur(10px)',
        'z-index': '100',
        'display': 'flex',
        'align-items': 'center',
        'justify-content': 'center',
      },
    ),
    css('.menu-overlay__content').styles(
      raw: const {
        'background-color': '#FAF6F0',
        'border-radius': '1rem',
        'padding': '1.5rem',
        'width': 'calc(100% - 2rem)',
        'max-width': '500px',
        'box-shadow': '0 8px 32px rgba(0, 0, 0, 0.1)',
        'border': '1px solid #D4C4B0',
      },
    ),
    css('.menu-overlay__header').styles(
      raw: const {
        'display': 'flex',
        'justify-content': 'space-between',
        'align-items': 'center',
        'margin-bottom': '1.5rem',
        'font-size': '1.25rem',
        'font-weight': '500',
        'color': '#4E342E',
      },
    ),
    css('.menu-overlay__close-btn').styles(
      raw: const {
        'background': 'none',
        'border': 'none',
        'font-size': '1.5rem',
        'color': '#8B7355',
        'cursor': 'pointer',
      },
    ),
    css('.menu-overlay__grid').styles(
      raw: const {
        'display': 'grid',
        'grid-template-columns': '1fr 1fr',
        'gap': '1rem',
      },
    ),
    css('.menu-overlay__grid-item').styles(
      raw: const {
        'display': 'flex',
        'align-items': 'center',
        'justify-content': 'center',
        'background-color': '#F5F1EB',
        'border-radius': '0.75rem',
        'padding': '1.5rem 1rem',
        'text-align': 'center',
        'font-weight': '500',
        'color': '#6B4E3D',
        'text-decoration': 'none',
        'border': '1px solid #D4C4B0',
        'transition': 'all 0.2s ease-in-out',
      },
    ),
    css('.menu-overlay__grid-item:hover').styles(
      raw: const {
        'transform': 'translateY(-4px)',
        'box-shadow': '0 4px 12px rgba(0, 0, 0, 0.08)',
        'background-color': '#EDE7DD',
      },
    ),
  ];
}
