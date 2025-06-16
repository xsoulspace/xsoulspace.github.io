import 'package:jaspr/jaspr.dart';

class NavItem {
  const NavItem({required this.title, required this.targetId});
  final String title;
  final String targetId;
}

/// A sidebar navigation that sticks to the viewport as the user scrolls.
class StickyNav extends StatelessComponent {
  const StickyNav({required this.items, super.key});

  final List<NavItem> items;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield nav(classes: 'sticky-nav', [
      ul(classes: 'sticky-nav__list', [
        for (final item in items)
          li(classes: 'sticky-nav__item', [
            a(href: '#${item.targetId}', classes: 'sticky-nav__link', [
              span(classes: 'sticky-nav__line', []),
              span(classes: 'sticky-nav__text', [text(item.title)]),
            ]),
          ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.sticky-nav').styles(
      raw: const {
        'position': 'sticky',
        'top': '50vh',
        'transform': 'translateY(-50%)',
        'align-self': 'start',
      },
    ),
    css('.sticky-nav__list').styles(
      raw: const {
        'list-style': 'none',
        'margin': '0',
        'padding': '0',
        'display': 'flex',
        'flex-direction': 'column',
      },
    ),
    css('.sticky-nav__item').styles(raw: const {'width': 'fit-content'}),
    css('.sticky-nav__link').styles(
      raw: const {
        'display': 'flex',
        'padding-bottom': '0.5rem',
        'padding-top': '0.5rem',
        'align-items': 'center',
        'gap': '1rem',
        'text-decoration': 'none',
        'color': '#6B4E3D',
        'font-weight': '500',
        'font-size': '1rem',
        'transition': 'all 0.2s ease-in-out',
      },
    ),
    css(
      '.sticky-nav__link:hover',
    ).styles(raw: const {'color': '#E07A5F', 'transform': 'translateX(4px)'}),
    css(
      '.sticky-nav__link:hover .sticky-nav__line',
    ).styles(raw: const {'width': '40px', 'background-color': '#E07A5F'}),
    css('.sticky-nav__line').styles(
      raw: const {
        'display': 'inline-block',
        'width': '24px',
        'height': '2px',
        'background-color': '#D4C4B0',
        'transition': 'all 0.2s ease-in-out',
      },
    ),
  ];
}
