import 'package:flutter/cupertino.dart';
import 'package:xsoulspace/app_scaffold.dart';
import 'package:xsoulspace/common_imports.dart';
import 'package:xsoulspace/other/privacy_policy_screen.dart';
import 'package:xsoulspace/other/terms_of_use_screen.dart';
import 'package:xsoulspace/pack_app/pack_app.dart';

final appRouter = GoRouter(
  redirect: GoRouterGuard.guard,
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      builder: (final context, final router, final navigator) =>
          AppScaffold(navigator: navigator),
      routes: [
        AppRoute(
          ScreenPaths.bootstrap,
          (final _) => const LoadingScreen(),
        ),
        ShellRoute(
          builder: (final context, final state, final navigator) =>
              ScreenScaffold(
            isAppBarVisible: state.fullPath?.startsWith('/home/p') == true,
            navigator: navigator,
          ),
          routes: [
            AppRoute(
              ScreenPaths.home,
              (final _) => const HomeScreen(),
            ),
            AppRoute(
              '/home/p/:projectId',
              (final _) => const LoadingScreen(),
            ),
            AppRoute(
              '/home/p/:projectId/privacy',
              (final state) => PrivacyPolicyScreen(
                id: state.pathParameters['projectId'] ?? '',
              ),
            ),
            AppRoute(
              '/home/p/:projectId/terms',
              (final state) => TermsOfUseScreen(
                id: state.pathParameters['projectId'] ?? '',
              ),
            ),
            AppRoute(
              '/home/p/:projectId/links',
              (final _) => const LoadingScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

/// Custom GoRoute sub-class to make the router declaration easier to read
class AppRoute extends GoRoute {
  AppRoute(
    final String path,
    final Widget Function(GoRouterState s) builder, {
    final List<GoRoute> routes = const [],
    this.useFade = false,
  }) : super(
          path: path,
          name: path,
          routes: routes,
          pageBuilder: (final context, final state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );
            if (useFade) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder: (
                  final context,
                  final animation,
                  final secondaryAnimation,
                  final child,
                ) =>
                    FadeTransition(opacity: animation, child: child),
              );
            }
            return CupertinoPage(child: pageContent);
          },
        );
  final bool useFade;
}

class GoRouterGuard {
  GoRouterGuard._();
  static final _instance = GoRouterGuard._();
  static const home = '/home';
  static const loading = '/loading';
  String? _initialRoute;
  bool _isInitialRouteHandled = false;
  bool _isFirstRouteHandled = false;
  static FutureOr<String?> guard(
    final BuildContext context,
    final GoRouterState state,
  ) =>
      _instance._guard(context, state);
  FutureOr<String?> _guard(
    final BuildContext context,
    final GoRouterState state,
  ) async {
    print({'url': state.fullPath, 'matchedLocation': state.matchedLocation});
    final currentRoute = state.fullPath ?? '';
    if (!_isFirstRouteHandled) {
      _isFirstRouteHandled = true;
      if (_initialRoute == null && ![home, loading].contains(currentRoute)) {
        print({'setting initial router': state.matchedLocation});
        _initialRoute ??= state.matchedLocation;
      }
    }
    final appStatus = context.read<AppNotifier>().value.status;
    final location = state.uri.toString();
    // Prevent anyone from navigating away from `/` if app is starting up.
    if (appStatus == AppStatus.loading && location != ScreenPaths.bootstrap) {
      return ScreenPaths.bootstrap;
    }
    if (appStatus == AppStatus.loading) return ScreenPaths.bootstrap;

    debugPrint('Navigate to: ${state.uri}');
    if (!_isInitialRouteHandled &&
        _initialRoute != null &&
        _initialRoute?.isNotEmpty == true) {
      _isInitialRouteHandled = true;
      print({'returning initial router': _initialRoute});
      return _initialRoute;
    }
    return null;
  }
}
