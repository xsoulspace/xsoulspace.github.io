import 'package:app_core/app_core.dart';
import 'package:flutter/widgets.dart';
// ignore: implementation_imports
import 'package:provider/provider.dart';
import 'package:xsoulspace/pack_core/ads/ads.dart';
import 'package:xsoulspace/pack_core/global_states/global_states.dart';

class AppServicesProviderDiDto {
  AppServicesProviderDiDto({
    required this.analyticsNotifier,
    required this.userNotifier,
  });
  final AnalyticsNotifier analyticsNotifier;
  final UserNotifier userNotifier;
}

class AppServicesProvider extends StatelessWidget {
  const AppServicesProvider({
    required this.diDto,
    required this.builder,
    super.key,
  });
  final WidgetBuilder builder;
  final AppServicesProviderDiDto diDto;
  @override
  Widget build(final BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: diDto.userNotifier.useMockData,
      builder: (final context, final useMockData, final child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (final context) => diDto.analyticsNotifier,
            ),
            ChangeNotifierProvider<ApiServiceInitializer>(
              create: (final context) => ApiServiceInitializer(baseUrl: ''),
            ),
            Provider<ApiServices>(
              create: ApiServices.create,
            ),
            Provider(create: (final context) => AdManager()),
            ChangeNotifierProvider(
              create: (final context) => GlobalStateNotifiers.getUser(),
            ),
            ChangeNotifierProvider(create: ProjectsNotifier.create)
          ],
          builder: (final context, final child) => builder(context),
        );
      },
    );
  }
}
