import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:xsoul_core/xsoul_core.dart';
import 'package:xsoulspace/library/theme/theme.dart';
import 'package:xsoulspace/pack_app/navigation/navigation.dart';
import 'package:xsoulspace/pack_app/pack_app.dart';
import 'package:xsoulspace/pack_app/screens/app/app_services_provider.dart';

part 'app_scaffold_state.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return AppServicesProvider(
      child: RouterScaffold(
        builder: (final context, final parser) => AppScaffoldBuilder(
          routeParser: parser,
        ),
      ),
    );
  }
}

class RouterScaffold extends HookWidget {
  const RouterScaffold({
    required this.builder,
    final Key? key,
  }) : super(key: key);
  final Widget Function(BuildContext context, TemplateRouteParser parser)
      builder;
  @override
  Widget build(final BuildContext context) {
    final state = useAppScaffoldState();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RouteState>(
          create: (final context) => state.routeState,
        ),
        Provider<AppRouterController>(
          create: (final context) => AppRouterController.use(context.read),
        ),
      ],
      builder: (final context, final child) =>
          builder(context, state.routeParser),
    );
  }
}

class AppScaffoldBuilder extends HookWidget {
  const AppScaffoldBuilder({required this.routeParser, super.key});
  final TemplateRouteParser routeParser;

  @override
  Widget build(final BuildContext context) {
    final state = useAppScaffoldBodyState(context.read);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      theme: lightThemeData,
      routerDelegate: state.routerDelegate,
      routeInformationParser: routeParser,
      builder: (final context, final child) {
        return StateLoader(
          initializer: GlobalStateInitializer(),
          loader: const AppLoadingScreen(),
          child: child!,
        );
      },
    );
  }
}
