import 'package:firebase_core/firebase_core.dart';

import '../../../core.dart';
import '../services/services.dart';

abstract class GlobalServicesInitializer implements Loadable {
  AnalyticsService get analyticsService;
}

class GlobalServicesInitializerMockImpl extends GlobalServicesInitializer {
  @override
  final AnalyticsService analyticsService = AnalyticsServiceImpl();

  @override
  Future<void> onLoad() async {}
}

class GlobalServicesInitializerImpl extends GlobalServicesInitializer {
  GlobalServicesInitializerImpl({
    this.firebaseOptions,
  });

  @override
  final AnalyticsService analyticsService = AnalyticsServiceImpl();

  final FirebaseOptions? firebaseOptions;
  FirebaseInitializer? _firebaseInitializer;

  @override
  Future<void> onLoad() async {
    final effectiveFirebaseOptions = firebaseOptions;
    if (effectiveFirebaseOptions != null) {
      Future<void> addAnalytics() async {
        final firebaseInitializer =
            FirebaseInitializerImpl(firebaseOptions: effectiveFirebaseOptions);
        await firebaseInitializer.onLoad();
        analyticsService
          ..upsertPlugin(FirebaseCrashlyticsPlugin())
          ..upsertPlugin(FirebaseAnalyticsPlugin());
        await firebaseInitializer.onDelayedLoad();
        _firebaseInitializer = firebaseInitializer;
      }

      await addAnalytics();
    }
    await analyticsService.onLoad();
  }
}
