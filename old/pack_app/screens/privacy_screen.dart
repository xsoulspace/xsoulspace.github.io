import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:xsoulspace/abstract/abstract.dart';
import 'package:xsoulspace/pack_app/navigation/models/models.dart';
import 'package:xsoulspace/pack_apps/pack_apps.dart';
import 'package:xsoulspace/utils/utils.dart';

class _PrivacyScreenDiDto {
  _PrivacyScreenDiDto.use(final Locator read)
      : appsProvider = read(),
        gamesProvider = read(),
        eaddinsProvider = read(),
        routeState = read();
  final AppsProvider appsProvider;
  final AppsProvider gamesProvider;
  final AppsProvider eaddinsProvider;
  final RouteState routeState;
}

_PrivacyScreenState _usePrivacyScreenState({
  required final Locator read,
}) =>
    use(
      LifeHook(
        debugLabel: '_PrivacyScreenState',
        state: _PrivacyScreenState(diDto: _PrivacyScreenDiDto.use(read)),
      ),
    );

class _PrivacyScreenState extends LifeState {
  _PrivacyScreenState({
    required this.diDto,
  });

  final _PrivacyScreenDiDto diDto;
  late AppRouteParameters routeArgs;
  Project? project;
  bool loading = true;
  @override
  void initState() {
    super.initState();

    routeArgs = AppRouteParameters.fromJson(diDto.routeState.route.parameters);
    if (routeArgs.isApp) {
      project = diDto.appsProvider.state[routeArgs.appCode];
    } else if (routeArgs.isGame) {
      project = diDto.gamesProvider.state[routeArgs.gameCode];
    } else if (routeArgs.isEAddin) {
      project = diDto.eaddinsProvider.state[routeArgs.excelAddinCode];
    } else {
      // TODO(arenukvern): description
      throw UnimplementedError();
    }
    loading = false;
    setState();
  }
}

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final state = _usePrivacyScreenState(read: context.read);
    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder: (final context) {
          if (state.loading) {
            return const CircularProgressIndicator.adaptive();
          }
          final project = state.project;
          if (project == null) {
            return const Center(
              child: Text('Project Not Found'),
            );
          }
          return Column(
            children: const [
              //
            ],
          );
        },
      ),
    );
  }
}
