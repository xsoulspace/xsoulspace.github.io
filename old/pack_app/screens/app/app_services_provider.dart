import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:xsoulspace/pack_apps/pack_apps.dart';
import 'package:xsoulspace/pack_excel_addins/pack_excel_addins.dart';
import 'package:xsoulspace/pack_games/pack_games.dart';
import 'package:xsoulspace/pack_libraries/pack_libraries.dart';

class AppServicesProvider extends StatelessWidget {
  const AppServicesProvider({
    required this.child,
    final Key? key,
  }) : super(key: key);
  final Widget child;
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
          return child;
        },
      ),
    );
  }
}
