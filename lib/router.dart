import 'package:flutter/cupertino.dart';
import 'package:xsoulspace/app_scaffold.dart';
import 'package:xsoulspace/common_imports.dart';
import 'package:xsoulspace/pack_app/pack_app.dart';

final appRouter = GoRouter(
  redirect: _handleRootRedirect,
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

String? _handleRootRedirect(
  final BuildContext context,
  final GoRouterState state,
) {
  final appStatus = context.read<AppNotifier>().value.status;
  final location = state.uri.toString();
  // Prevent anyone from navigating away from `/` if app is starting up.
  if (appStatus == AppStatus.loading && location != ScreenPaths.bootstrap) {
    return ScreenPaths.bootstrap;
  }

  debugPrint('Navigate to: ${state.uri}');
  return null; // do nothing
}
