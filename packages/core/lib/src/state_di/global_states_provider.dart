import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core.dart';
import '../data_repositories/data_repositories.dart';
import '../data_sources/data_sources.dart';

class GlobalStatesProvider extends StatelessWidget {
  const GlobalStatesProvider({
    required this.builder,
    super.key,
  });
  final WidgetBuilder builder;
  @override
  Widget build(final BuildContext context) => MultiProvider(
        providers: [
          Provider<LocalDbDataSource>(
            create: (final context) => SharedPreferencesDbDataSourceImpl(),
          ),
          Provider(create: ApiServices.create),
          Provider(create: UserRepository.provide),
          // Provider(create: ProjectsRepository.provide),
          // ChangeNotifierProvider(create: ProjectsNotifier.provide),
          ChangeNotifierProvider(create: UserNotifier.provide),
          ChangeNotifierProvider(create: AppNotifier.provide),
        ],
        child: Builder(builder: builder),
      );
}
