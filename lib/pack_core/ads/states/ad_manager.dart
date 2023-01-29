import 'package:flutter/foundation.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:universal_io/io.dart';
import 'package:xsoulspace/envs.dart';
import 'package:xsoulspace/pack_core/ads/models/models.dart';

class AdManager implements Loadable, Disposable {
  AdPermissions permissions = AdPermissions.noAds;
  @override
  Future<void> onLoad() async {
    if (Envs.isMarketingMode) return;
    if (Envs.isDebugAds) {
      permissions = AdPermissions.allAdEnabled;
      return;
    }
    if (kIsWeb) {
      permissions = AdPermissions.webAds;
    } else if (Platform.isAndroid) {
      permissions = AdPermissions.noAds;
    }
  }

  @override
  void dispose() {}
}
