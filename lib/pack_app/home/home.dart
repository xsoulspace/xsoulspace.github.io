import 'package:app_core/app_core.dart';
import 'package:app_design_core/app_design_core.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
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
                Text(
                  'XSoulSpace',
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium,
                ),
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
                const ProjectsList(),
                const FooterSection(
                  onPrivacyPolicy: launchPrivacyPolicy,
                  onTermsOfUse: launchTermsAndConditions,
                ),
              ],
            ),
          )
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

class ProjectsList extends StatelessWidget {
  const ProjectsList({super.key});

  @override
  Widget build(final BuildContext context) {
    final apiServices = context.read<ApiServices>();
    return FirestoreListView<ProjectModel>(
      query: apiServices.projects.projectQuery,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(24),
      itemBuilder: (final context, final snapshot) {
        final project = snapshot.data();
        return AdaptiveProjectTile(
          key: ValueKey(project.id),
          project: project,
        );
      },
    );
  }
}
