import 'package:app_core/app_core.dart';
import 'package:app_design_core/app_design_core.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:xsoulspace/pack_app/pack_app.dart';
import 'package:xsoulspace/pack_core/navigation/app_router.dart';

class AppNavigator extends HookWidget {
  const AppNavigator({
    required this.navigatorKey,
    super.key,
  });
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(final BuildContext context) {
    context.watch<RouteState>();

    final keys = useState(AppPageBuilderKeys());
    final routerController = AppRouterController.use(context.read);
    final popper = useState(
      AppRouterPopper(
        routerController: routerController,
        keys: keys.value,
      ),
    );
    final pageBuilder =
        AppPageBuilder.use(keys: keys.value, read: context.read);
    final layoutBuilder = AppLayoutBuilder(pageBuilder: pageBuilder);
    return Navigator(
      key: navigatorKey,
      onPopPage: popper.value.onPopPage,
      pages: layoutBuilder.buildPages(),
    );
  }
}

class AppRouterPopper extends RouterPopper {
  const AppRouterPopper({
    required this.routerController,
    required this.keys,
  });
  final AppRouterController routerController;
  final AppPageBuilderKeys keys;
}

class AppPageBuilderKeys {
  final home = const ValueKey('home');
  final loading = const ValueKey('loading');
}

class AppPageBuilder extends RouterPageBuilder<AppRouterController> {
  AppPageBuilder.use({
    required this.keys,
    required super.read,
  }) : super.use();

  static final emptyPage = NavigatorPage(
    child: const EmptyScreen(),
    key: const ValueKey('empty-screen'),
  );

  final AppPageBuilderKeys keys;

  Page project() {
    final params = getParams(RouteArgumentsModel.fromJson);
    return NavigatorPage(
      child: const ProjectLinksScreen(),
      key: ValueKey('project-${params.projectId}'),
    );
  }

  Page projectLinks() {
    final params = getParams(RouteArgumentsModel.fromJson);
    return NavigatorPage(
      child: const ProjectScreen(),
      key: ValueKey('project-${params.projectId}-links'),
    );
  }

  Page loader() {
    return NavigatorPage(
      child: const LoadingScreen(),
      key: keys.loading,
    );
  }

  Page home() {
    return NavigatorPage(
      child: const HomeScreen(),
      key: keys.home,
    );
  }
}

class AppLayoutBuilder
    extends RouterLayoutBuilder<AppRouterController, AppPageBuilder> {
  AppLayoutBuilder({required super.pageBuilder});
  @override
  List<Page> buildPages() {
    final pages = <Page>[
      pageBuilder.loader(),
    ];
    if (pathTemplate == NavigationRoutes.home) {
      pages.add(pageBuilder.home());
    } else if (pathTemplate.startsWith(NavigationRoutes.project)) {
      pages.add(pageBuilder.project());

      if (pathTemplate == NavigationRoutes.projectLinks) {
        pages.add(pageBuilder.projectLinks());
      }
    }
    return pages;
  }
}
