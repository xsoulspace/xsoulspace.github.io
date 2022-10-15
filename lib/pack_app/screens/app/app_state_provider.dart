part of pack_app;

class AppStateProvider extends StatelessWidget {
  const AppStateProvider({
    required this.builder,
    final Key? key,
  }) : super(key: key);
  final WidgetBuilder builder;
  @override
  Widget build(final BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: createAppsProvider),
        ChangeNotifierProvider(create: createGamesProvider),
        ChangeNotifierProvider(create: createExcelAddinsProvider),
        ChangeNotifierProvider(create: createLibrariesProvider),
      ],
      child: Builder(
        builder: (final context) {
          return StateLoader(
            initializer: GlobalStateInitializer(
              context: context,
            ),
            loader: const AppLoadingScreen(),
            child: builder(context),
          );
        },
      ),
    );
  }
}
