import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_design_core/app_design_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:xsoulspace/pack_core/ads/ads.dart';
import 'package:xsoulspace/pack_core/pack_core.dart';

class GlobalSettingsInitializer extends StateInitializer {
  @override
  Future<void> onLoad(final BuildContext context) async {
    final read = context.read;
    final appSettingsNotifier = read<UserNotifier>();
    await appSettingsNotifier.onLoad();
  }
}

class GlobalStateInitializer extends StateInitializer {
  GlobalStateInitializer({required this.firebaseOptions});
  final FirebaseOptions firebaseOptions;
  @override
  Future<void> onLoad(final BuildContext context) async {
    final read = context.read;
    final adManager = read<AdManager>();
    final projectsNotifier = read<ProjectsNotifier>();
    final AnalyticsNotifier analyticsNotifier = read();
    final services = read<ApiServices>();
    final appRouterController = AppRouterController.use(read);
    await FirebaseInitializer().onDelayedLoad(firebaseOptions);
    await analyticsNotifier.onDelayedLoad();
    await adManager.onLoad();
    await projectsNotifier.onLoad();

    final UserNotifier settings = read();
    await analyticsNotifier.onDelayedLoad();

    if (settings.excelAvailable.value) {
      unawaited(
        analyticsNotifier.logAnalyticEvent(AnalyticEvents.usedInExcel),
      );
    } else {
      unawaited(
        analyticsNotifier.logAnalyticEvent(AnalyticEvents.usedInWeb),
      );
    }
  }
}
