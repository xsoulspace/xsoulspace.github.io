// The entrypoint for the **server** environment.
//
// The [main] method will only be executed on the server during pre-rendering.
// To run code on the client, use the @client annotation.

// Server-specific jaspr import.
import 'package:jaspr/server.dart';
// This file is generated automatically by Jaspr, do not remove or edit.
import 'package:xsoulspace_web/jaspr_options.dart';

// Imports the [App] component.
import 'app.dart';

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(options: defaultJasprOptions);

  // Starts the app.
  //
  // [Document] renders the root document structure (<html>, <head> and <body>)
  // with the provided parameters and components.
  runApp(
    Document(
      title: 'xsoulspace - Ethical Creative Projects',
      styles: globalStyles,
      head: [
        meta(name: 'yandex-verification', content: '7618c3a6ff6de26c'),
        meta(
          name: 'google-site-verification',
          content: 'gWgffyKg41ENwTFc84BNu5j436iT87r7K_f8b11ZgKY',
        ),
        meta(
          name: 'google-site-verification',
          content: 'hmvjrobZbQA4I0VycUNAT-XTz0r1MZfIY0D2bbCkY1Q',
        ),

        meta(charset: 'utf-8'),
        meta(
          name: 'viewport',
          content: 'width=device-width, initial-scale=1.0',
        ),
        meta(
          name: 'description',
          content:
              'A cinematic showcase of ethical creative projects, games, libraries, and tools',
        ),
        meta(
          name: 'keywords',
          content:
              'creative projects, ethical technology, games, libraries, open source',
        ),
        meta(name: 'author', content: 'xsoulspace'),
        // Open Graph / Facebook
        meta(attributes: {'property': 'og:type'}, content: 'website'),
        meta(
          attributes: {'property': 'og:url'},
          content: 'https://xsoulspace.dev/',
        ),
        meta(
          attributes: {'property': 'og:title'},
          content: 'xsoulspace - Ethical Creative Projects',
        ),
        meta(
          attributes: {'property': 'og:description'},
          content:
              'A cinematic showcase of ethical creative projects, where every story matters',
        ),
        // Google Fonts
        link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
        link(
          rel: 'preconnect',
          href: 'https://fonts.gstatic.com',
          attributes: {'crossorigin': ''},
        ),
        link(
          rel: 'stylesheet',
          href:
              'https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap',
        ),
        // Font Awesome
        link(
          rel: 'stylesheet',
          href:
              'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css',
        ),
        // Favicon
        link(rel: 'icon', type: 'image/svg+xml', href: '/favicon.svg'),
      ],
      body: const App(),
    ),
  );
}

/// Global styles for the application using Jaspr's native CSS system
@css
List<StyleRule> get globalStyles => [
  // Base styles
  css('html, body').styles(
    width: 100.percent,
    minHeight: 100.vh,
    padding: Padding.zero,
    margin: Margin.zero,
    fontFamily: const FontFamily.list([
      FontFamily('Inter'),
      FontFamilies.sansSerif,
    ]),
    boxSizing: BoxSizing.borderBox,
  ),

  css('*, *::before, *::after').styles(boxSizing: BoxSizing.inherit),

  // Typography
  css(
    'h1',
  ).styles(margin: Margin.unset, fontSize: 4.rem, fontWeight: FontWeight.w300),

  css('h2').styles(margin: Margin.unset, fontWeight: FontWeight.w300),

  css('h3').styles(margin: Margin.unset, fontWeight: FontWeight.w500),

  css('p').styles(margin: Margin.unset),

  // Responsive design
  css.media(MediaQuery.screen(minWidth: 768.px), [
    css('h1').styles(fontSize: 6.rem),
  ]),
];
