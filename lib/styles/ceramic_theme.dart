import 'package:jaspr/jaspr.dart';

/// Ceramic theme styles for the UI kit components
/// Implements the design guidelines with raw CSS

@css
final ceramicTheme = [
  // Color tokens as CSS custom properties
  css(':root').styles(
    raw: const {
      // Primary ceramic palette
      '--unglazed-bisque': '#FAF6F0',
      '--warm-ceramic': '#F5F1EB',
      '--soft-clay': '#EDE7DD',
      '--earthy-brown': '#4E342E',
      '--warm-umber': '#6B4E3D',
      '--muted-taupe': '#8B7355',
      '--terracotta': '#E07A5F',
      '--sage-glaze': '#81B29A',
      '--sandstone': '#F2CC8F',
      '--clay-border': '#D4C4B0',

      // Category accent colors
      '--warm-coral': '#D4756B',
      '--soft-mint': '#A8C4A2',

      // Status colors
      '--active-bg': '#E8F5E8',
      '--active-text': '#2D5A2D',
      '--beta-bg': '#FFF4E6',
      '--beta-text': '#B45309',
      '--archive-bg': '#F3F4F6',
      '--archive-text': '#6B7280',
      '--featured-bg': '#FDF2F8',
      '--featured-text': '#BE185D',
    },
  ),

  // Typography styles
  css('.brand-title').styles(
    raw: const {
      'font-size': '2rem',
      'font-weight': '300',
      'color': 'var(--earthy-brown)',
    },
  ),

  css('.brand-subtitle').styles(
    raw: const {
      'font-size': '0.875rem',
      'font-weight': '400',
      'color': 'var(--warm-umber)',
      'margin-top': '0.25rem',
    },
  ),

  css('.nav-category').styles(
    raw: const {
      'font-size': '0.875rem',
      'font-weight': '500',
      'color': 'var(--earthy-brown)',
      'margin-bottom': '0.75rem',
    },
  ),

  css('.nav-item').styles(
    raw: const {
      'font-size': '0.8125rem',
      'font-weight': '400',
      'color': 'var(--muted-taupe)',
    },
  ),

  css('.section-title').styles(
    raw: const {
      'font-size': '1.5rem',
      'font-weight': '500',
      'color': 'var(--earthy-brown)',
    },
  ),

  css('.card-title').styles(
    raw: const {
      'font-size': '1.125rem',
      'font-weight': '500',
      'color': 'var(--earthy-brown)',
    },
  ),

  css('.card-subtitle').styles(
    raw: const {
      'font-size': '0.875rem',
      'font-weight': '400',
      'color': 'var(--warm-umber)',
    },
  ),

  css('.card-description').styles(
    raw: const {
      'font-size': '0.8125rem',
      'font-weight': '400',
      'color': 'var(--muted-taupe)',
    },
  ),

  css('.card-meta').styles(
    raw: const {
      'font-size': '0.75rem',
      'font-weight': '400',
      'color': 'var(--muted-taupe)',
    },
  ),

  // Layout components
  css('.sidebar-nav').styles(
    raw: const {
      'width': '280px',
      'background-color': 'var(--soft-clay)',
      'padding': '1.5rem',
      'position': 'fixed',
      'height': '100vh',
      'box-shadow': '2px 0 8px rgba(78, 52, 46, 0.08)',
      'z-index': '1000',
    },
  ),

  css('.main-content').styles(
    raw: const {
      'margin-left': '280px',
      'padding': '2rem',
      'background-color': 'var(--unglazed-bisque)',
      'min-height': '100vh',
    },
  ),

  // Project cards
  css('.project-card').styles(
    raw: const {
      'background-color': 'var(--warm-ceramic)',
      'border': '1px solid var(--clay-border)',
      'border-radius': '0.5rem',
      'padding': '1rem',
      'box-shadow': '0 4px 12px rgba(78, 52, 46, 0.1)',
      'transition': 'all 0.3s ease',
      'cursor': 'pointer',
    },
  ),

  css('.project-card:hover').styles(
    raw: const {
      'box-shadow': '0 8px 24px rgba(78, 52, 46, 0.15)',
      'transform': 'translateY(-2px)',
    },
  ),

  // Badges
  css('.status-badge').styles(
    raw: const {
      'padding': '0.25rem 0.5rem',
      'border-radius': '0.375rem',
      'font-size': '0.75rem',
      'font-weight': '500',
      'display': 'inline-block',
    },
  ),

  css('.badge-active').styles(
    raw: const {
      'background-color': 'var(--active-bg)',
      'color': 'var(--active-text)',
    },
  ),

  css('.badge-beta').styles(
    raw: const {
      'background-color': 'var(--beta-bg)',
      'color': 'var(--beta-text)',
    },
  ),

  css('.badge-archive').styles(
    raw: const {
      'background-color': 'var(--archive-bg)',
      'color': 'var(--archive-text)',
    },
  ),

  css('.badge-featured').styles(
    raw: const {
      'background-color': 'var(--featured-bg)',
      'color': 'var(--featured-text)',
    },
  ),

  // Category badges
  css('.category-badge').styles(
    raw: const {
      'padding': '0.25rem 0.5rem',
      'border-radius': '0.375rem',
      'font-size': '0.75rem',
      'font-weight': '500',
      'display': 'inline-block',
    },
  ),

  css('.category-apps-games').styles(
    raw: const {
      'background-color': 'rgba(224, 122, 95, 0.1)',
      'color': 'var(--terracotta)',
    },
  ),

  css('.category-dart-flutter').styles(
    raw: const {
      'background-color': 'rgba(129, 178, 154, 0.1)',
      'color': 'var(--sage-glaze)',
    },
  ),

  css('.category-office-excel').styles(
    raw: const {
      'background-color': 'rgba(242, 204, 143, 0.1)',
      'color': 'var(--sandstone)',
    },
  ),

  css('.category-gaming-values').styles(
    raw: const {
      'background-color': 'rgba(212, 117, 107, 0.1)',
      'color': 'var(--warm-coral)',
    },
  ),

  css('.category-community').styles(
    raw: const {
      'background-color': 'rgba(168, 196, 162, 0.1)',
      'color': 'var(--soft-mint)',
    },
  ),

  // Grid layouts
  css('.bento-section-grid').styles(
    raw: const {
      'display': 'grid',
      'grid-template-columns': 'repeat(auto-fit, minmax(300px, 1fr))',
      'gap': '1.5rem',
      'margin-top': '1rem',
    },
  ),

  css(
    '.project-card-grid',
  ).styles(raw: const {'display': 'grid', 'gap': '1.5rem'}),

  // Responsive breakpoints
  css('@media (max-width: 767px)').styles(
    raw: const {
      '.sidebar-nav': 'transform: translateX(-100%);',
      '.main-content': 'margin-left: 0;',
      '.bento-section-grid': 'grid-template-columns: 1fr;',
    },
  ),

  css('@media (min-width: 768px) and (max-width: 1023px)').styles(
    raw: const {
      '.bento-section-grid': 'grid-template-columns: repeat(2, 1fr);',
    },
  ),

  css('@media (min-width: 1024px) and (max-width: 1279px)').styles(
    raw: const {
      '.bento-section-grid': 'grid-template-columns: repeat(3, 1fr);',
    },
  ),

  css('@media (min-width: 1280px)').styles(
    raw: const {
      '.bento-section-grid': 'grid-template-columns: repeat(4, 1fr);',
    },
  ),
];
