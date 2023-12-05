import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:xsoulspace/pack_app/about_screen.dart';
import 'package:xsoulspace/pack_app/home/footer.dart';
import 'package:xsoulspace/pack_app/project/project.dart';
import 'package:xsoulspace/pack_app/widgets/widgets.dart';

part 'home_state.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final state = useHomeScreenState(read: context.read);
    final uiTheme = UiTheme.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TopSafeArea(),
                uiTheme.verticalBoxes.extraLarge,
                const XSoulSpaceTitle(),
                uiTheme.verticalBoxes.extraLarge,
                uiTheme.verticalBoxes.extraLarge,
                uiTheme.verticalBoxes.extraLarge,
                if (kDebugMode)
                  SegmentedButton<int>(
                    onSelectionChanged: state.onSelectionChanged,
                    showSelectedIcon: false,
                    segments: const [
                      ButtonSegment(value: 0, label: Text('All')),
                      ButtonSegment(value: 1, label: Text('Apps')),
                      ButtonSegment(value: 2, label: Text('Games')),
                      ButtonSegment(value: 3, label: Text('Excel Addins')),
                    ],
                    selected: state.selectedTypes,
                  ),
                if (kDebugMode) ...[
                  ListTile(
                    title: const Text('Add Project'),
                    onTap: state.onAddProject,
                  ),
                  uiTheme.verticalBoxes.medium,
                ],
              ],
            ),
          ),
          const ProjectsList(),
          const SliverToBoxAdapter(
            child: FooterSection(
              onPrivacyPolicy: launchPrivacyPolicy,
              onTermsOfUse: launchTermsAndConditions,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const TextButton(
            onPressed: launchEmail,
            child: Text('Contacts'),
          ),
          const TextButton(
            onPressed: launchDiscordLink,
            child: Text('Community \n& Updates'),
          ),
          TextButton(
            onPressed: () => showAboutScreenDialog(context),
            child: const Text('About'),
          ),
        ],
      ),
    );
  }
}

class ProjectListDiDto {
  ProjectListDiDto.use(final Locator read) : apiServices = read();
  final ApiServices apiServices;
}

ProjectListState useProjectListState({
  required final Locator read,
}) =>
    use(
      LifeHook(
        debugLabel: 'ProjectListState',
        state: ProjectListState(diDto: ProjectListDiDto.use(read)),
      ),
    );

class ProjectListState extends LifeState {
  ProjectListState({
    required this.diDto,
  });

  final ProjectListDiDto diDto;
  bool loaded = false;
  final projects = <ProjectModel>[];
  @override
  void initState() {
    super.initState();
    unawaited(onLoad());
  }

  Future<void> onLoad() async {
    final queryResult = await diDto.apiServices.projects.projectQuery.get();
    projects.addAll(queryResult.docs.map((final e) => e.data()));
    if (mounted) {
      loaded = true;
      setState();
    }
  }
}

class ProjectsList extends HookWidget {
  const ProjectsList({super.key});

  @override
  Widget build(final BuildContext context) {
    final state = useProjectListState(read: context.read);
    if (state.loaded) {
      return SliverPadding(
        padding: const EdgeInsets.all(24),
        sliver: SliverList.builder(
          itemCount: state.projects.length,
          itemBuilder: (final context, final index) {
            final project = state.projects[index];
            return AdaptiveProjectTile(
              key: ValueKey(project.id),
              project: project,
            );
          },
        ),
      );
    } else {
      return const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator.adaptive()),
      );
    }
  }
}
