import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core.dart';
import '../data_sources/data_sources.dart';

class GlobalStatesInitializerDto {
  GlobalStatesInitializerDto({
    required this.context,
  })  :
        // projectsNotifier = context.read(),
        userNotifier = context.read(),
        appNotifier = context.read(),
        localDbDataSource = context.read(),
        // projectsRepository = context.read(),
        assetBundle = DefaultAssetBundle.of(context);
  final BuildContext context;
  final LocalDbDataSource localDbDataSource;
  final AssetBundle assetBundle;
  // final ProjectsNotifier projectsNotifier;
  final UserNotifier userNotifier;
  final AppNotifier appNotifier;
  // final ProjectsRepository projectsRepository;
}

class GlobalStatesInitializer implements StateInitializer {
  GlobalStatesInitializer({
    required this.dto,
    required this.servicesInitializer,
    required this.router,
  });
  final GlobalStatesInitializerDto dto;
  final GoRouter router;
  final GlobalServicesInitializer servicesInitializer;
  @override
  Future<void> onLoad() async {
    final initializer = UserInitializer(
      dto: GlobalStatesInitializerDto(context: dto.context),
    );
    await servicesInitializer.onLoad();
    await dto.localDbDataSource.onLoad();
    await dto.userNotifier.onLoad(initializer);

    // final isConnected = await PlatformInfo.isConnected;
    dto.appNotifier.updateAppStatus(
      AppStatus.online,
      // isConnected ? AppStatus.online : AppStatus.offline,
    );
    if (dto.userNotifier.hasCompletedOnboarding) {
      router.go(ScreenPaths.home);
    } else {
      router.go(ScreenPaths.home);
      // router.go(ScreenPaths.intro);
    }
    unawaited(_loadPost());
  }

  /// ********************************************
  /// *      CONTENT LOADING START
  /// ********************************************
  Future<void> _loadPost() async {}
}
