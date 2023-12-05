import 'package:xsoulspace/common_imports.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.navigator,
    super.key,
  });
  final Widget navigator;
  @override
  Widget build(final BuildContext context) => navigator;
}

class ScreenScaffold extends StatelessWidget {
  const ScreenScaffold({
    required this.navigator,
    required this.isAppBarVisible,
    super.key,
  });
  final Widget navigator;
  final bool isAppBarVisible;
  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: isAppBarVisible
            ? AppBar(
                leading:
                    BackButton(onPressed: () => context.go(ScreenPaths.home)),
              )
            : null,
        body: navigator,
      );
}
