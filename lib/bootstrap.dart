import 'dart:async';

import 'package:app_design_core/app_design_core.dart';
import 'package:xsoulspace/firebase_options.dart';
import 'package:xsoulspace/pack_core/app/app_services_provider.dart';
import 'package:xsoulspace/pack_core/global_states/global_states.dart';

Future<void> bootstrap(
  final Widget Function({
    required AppServicesProviderDiDto servicesDiDto,
  })
      builder,
) async {
  WidgetsFlutterBinding.ensureInitialized();
  initWebView();
  final firebaseIntializer = GlobalStateNotifiers.getFirebaseIntializer();
  await firebaseIntializer.onLoad(DefaultFirebaseOptions.currentPlatform);

  // await Flame.device.fullScreen();
  final analyticsNotifier = GlobalStateNotifiers.getAnalytics();
  final userNotifier = GlobalStateNotifiers.getUser();
  await analyticsNotifier.onLoad();
  final servicesDiDto = AppServicesProviderDiDto(
    analyticsNotifier: analyticsNotifier,
    userNotifier: userNotifier,
  );
  runZonedGuarded(
    () => runApp(builder(servicesDiDto: servicesDiDto)),
    analyticsNotifier.recordError,
  );
}
