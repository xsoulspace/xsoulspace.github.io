part of pack_app;

class XSoulSpaceApp extends StatelessWidget {
  const XSoulSpaceApp({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return AppStateProvider(
      builder: (final _) => const AppScaffold(),
    );
  }
}
