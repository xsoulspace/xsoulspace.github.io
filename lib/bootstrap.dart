import 'dart:async';

import 'package:core/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:xsoulspace/other/other.dart';

Future<void> bootstrap({
  required final FirebaseOptions? firebaseOptions,
}) async {
  final GlobalServicesInitializer initializer = GlobalServicesInitializerImpl(
    firebaseOptions: firebaseOptions,
  );
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await initializer.onLoad();
      runApp(const XSoulSpaceApp());
    },
    initializer.analyticsService.recordError,
  );
}
