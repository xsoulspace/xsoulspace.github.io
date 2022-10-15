import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:xsoul_core/xsoul_core.dart';
import 'package:xsoulspace/pack_app/navigation/navigation.dart';
import 'package:xsoulspace/pack_app/pack_app.dart';

class AppNavigator extends HookWidget {
  const AppNavigator({
    required this.navigatorKey,
    final Key? key,
  }) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(final BuildContext context) {
    context.watch<RouteState>();

    final keys = useState(AppPageBuilderKeys());
    final pageBuilder =
        AppPageBuilder.use(keys: keys.value, read: context.read);
    final layoutBuilder = AppLayoutBuilder(pageBuilder: pageBuilder);

    return Navigator(
      key: navigatorKey,
      onPopPage: const RouterPopper().onPopPage,
      pages: layoutBuilder.buildPages(),
    );
  }
}

class AppPageBuilderKeys {
  final home = const ValueKey('home');
  final app = const ValueKey('app');
  final game = const ValueKey('game');
  final eaddin = const ValueKey('eaddin');
  final contacts = const ValueKey('contacts');
}

class AppPageBuilder extends RouterPageBuilder<AppRouterController> {
  AppPageBuilder.use({
    required this.keys,
    required super.read,
  }) : super.use();

  final AppPageBuilderKeys keys;

  Page home() => NavigatorPage(
        child: const HomeScreen(),
        key: keys.home,
      );

  Page game() {
    return NavigatorPage(
      child: const WbwGameWidget(),
      key: keys.game,
    );
  }

  Page app() {
    return NavigatorPage(
      child: const SettingsScreen(),
      key: keys.app,
    );
  }

  Page eaddin() {
    return NavigatorPage(
      child: const SettingsScreen(),
      key: keys.eaddin,
    );
  }

  Page contacts() {
    return NavigatorPage(
      child: const SettingsScreen(),
      key: keys.contacts,
    );
  }
}

class AppLayoutBuilder
    extends RouterLayoutBuilder<AppRouterController, AppPageBuilder> {
  AppLayoutBuilder({required super.pageBuilder});
  @override
  List<Page> buildPages() {
    final pages = <Page>[
      pageBuilder.home(),
    ];

    return pages;
  }
}
