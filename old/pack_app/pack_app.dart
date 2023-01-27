library pack_app;

import 'dart:convert';
import 'dart:math' as math;

import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:xsoulspace/abstract/abstract.dart';
import 'package:xsoulspace/gen/assets.gen.dart';
import 'package:xsoulspace/library/theme/theme.dart';
import 'package:xsoulspace/library/utils/utils.dart';
import 'package:xsoulspace/library/widgets/widgets.dart';
import 'package:xsoulspace/pack_app/screens/app/app_scaffold.dart';
import 'package:xsoulspace/pack_apps/pack_apps.dart';
import 'package:xsoulspace/pack_excel_addins/pack_excel_addins.dart';
import 'package:xsoulspace/pack_games/pack_games.dart';
import 'package:xsoulspace/pack_libraries/pack_libraries.dart';
import 'package:xsoulspace/utils/utils.dart';

export 'screens/screens.dart';

part 'screens/about.dart';
part 'screens/app/app_loading.dart';
part 'screens/app/xsoulspace_app.dart';
part 'state/global_state_initializer.dart';
part 'widgets/card_button.dart';
part 'widgets/pinned_app_bar.dart';
part 'widgets/project_view.dart';
part 'widgets/projects_grid.dart';
part 'widgets/stores_flex.dart';
