import 'dart:async';

import 'package:app_design_core/app_design_core.dart';
import 'package:xsoulspace/firebase_options.dart';
import 'package:xsoulspace/pack_core/app/app_services_provider.dart';
import 'package:xsoulspace/pack_core/global_states/global_states.dart';

Future<void> bootstrap(
  final Widget Function({
    required AppServicesProviderDiDto servicesDiDto,
  }) builder,
) async {
  initWebView();
  final firebaseIntializer = GlobalStateNotifiers.getFirebaseIntializer();
  await firebaseIntializer.onLoad(DefaultFirebaseOptions.currentPlatform);

  final analyticsNotifier = GlobalStateNotifiers.getAnalytics();

  return runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final userNotifier = GlobalStateNotifiers.getUser();
      await analyticsNotifier.onLoad();
      final servicesDiDto = AppServicesProviderDiDto(
        analyticsNotifier: analyticsNotifier,
        userNotifier: userNotifier,
      );
      runApp(builder(servicesDiDto: servicesDiDto));
    },
    analyticsNotifier.recordError,
  );
}
