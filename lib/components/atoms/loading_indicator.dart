import 'package:jaspr/jaspr.dart';
import 'package:jaspr/server.dart';

@client
class LoadingIndicator extends StatelessComponent {
  const LoadingIndicator({this.textMessage, super.key});

  final String? textMessage;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final loadingText = textMessage ?? 'Loading...';
    yield div(classes: 'loading-container', [
      div([], classes: 'loading-spinner'),
      p(classes: 'loading-text', [text(loadingText)]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // Loading state
    css('.loading-container').styles(
      raw: const {
        'display': 'flex',
        'flex-direction': 'column',
        'align-items': 'center',
        'justify-content': 'center',
        'min-height': '400px',
        'gap': '2rem',
      },
    ),

    css('.loading-spinner').styles(
      raw: const {
        'width': '48px',
        'height': '48px',
        'border': '4px solid #EDE7DD',
        'border-top': '4px solid #E07A5F',
        'border-radius': '50%',
        'animation': 'spin 1s linear infinite',
      },
    ),

    css('.loading-text').styles(
      raw: const {
        'font-size': '1.125rem',
        'color': '#6B4E3D',
        'font-weight': '500',
      },
    ),

    // Keyframe animation
    css('@keyframes spin').styles(
      raw: const {
        '0%': 'transform: rotate(0deg)',
        '100%': 'transform: rotate(360deg)',
      },
    ),
  ];
}
