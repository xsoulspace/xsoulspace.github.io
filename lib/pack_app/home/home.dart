import 'package:app_core/app_core.dart';
import 'package:app_design_core/app_design_core.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';

part 'home_state.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final state = useHomeScreenState(read: context.read);
    final uiTheme = UiTheme.of(context);

    return Scaffold(
      body: Column(
        children: [
          const TopSafeArea(),
          uiTheme.verticalBoxes.medium,
          const Text('XSoulSpace', textAlign: TextAlign.center),
          uiTheme.verticalBoxes.medium,
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
          ListTile(
            title: const Text('Add Project'),
            onTap: state.onAddProject,
          ),
          uiTheme.verticalBoxes.medium,
          AdaptiveProjectTile(project: ProjectModel.mock),
          const Expanded(
            child: ProjectsList(),
          )
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text('Contacts'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Community \n& Updates'),
          ),
          TextButton(
            onPressed: () {},
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
      itemBuilder: (final context, final snapshot) {
        final project = snapshot.data();
        return AdaptiveProjectTile(project: project);
      },
    );
  }
}

class AdaptiveProjectTile extends StatelessWidget {
  const AdaptiveProjectTile({
    required this.project,
    super.key,
  });
  final ProjectModel project;

  @override
  Widget build(final BuildContext context) {
    if (Breakpoints.large.isActive(context)) {
      return ProjectLargeTile(project: project);
    } else if (Breakpoints.medium.isActive(context)) {
      return ProjectMiddleTile(project: project);
    } else {
      return ProjectSmallTile(project: project);
    }
  }
}

class ProjectLargeTile extends StatelessWidget {
  const ProjectLargeTile({
    required this.project,
    super.key,
  });
  final ProjectModel project;

  @override
  Widget build(final BuildContext context) {
    return Row();
  }
}

class ProjectMiddleTile extends StatelessWidget {
  const ProjectMiddleTile({
    required this.project,
    super.key,
  });
  final ProjectModel project;

  @override
  Widget build(final BuildContext context) {
    return Row();
  }
}

class ProjectSmallTile extends StatelessWidget {
  const ProjectSmallTile({
    required this.project,
    super.key,
  });
  final ProjectModel project;
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final uiTheme = UiTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 250,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              AdaptiveVideoPlayer(
                constraints: const BoxConstraints(maxWidth: 300),
                url: project.videosLinks.first,
              ),
              uiTheme.horizontalBoxes.medium,
              AppNetworkImage(
                imageUrl: project.imagesLinks.first,
              ),
              uiTheme.horizontalBoxes.medium,
              AppNetworkImage(
                imageUrl: project.imagesLinks[1],
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(project.title, style: textTheme.titleMedium),
            Flexible(
              child: Builder(
                builder: (final context) {
                  String text;
                  switch (project.status) {
                    case ProjectStatus.upcoming:
                      text = 'Upcoming';
                      break;
                    case ProjectStatus.released:
                      text = 'Released on ${project.releasedAt}. '
                          'Development continues.';
                      break;
                    case ProjectStatus.legacy:
                      text = 'Released on ${project.releasedAt}. '
                          '\nDevelopment completed on ${project.completedAt}.';
                      break;
                  }
                  return Text(text, style: textTheme.bodySmall);
                },
              ),
            ),
          ],
        ),
        uiTheme.verticalBoxes.small,
        Text(project.subtitle),
        uiTheme.verticalBoxes.medium,
        Text(project.shortDescription),
        uiTheme.verticalBoxes.medium,
        Row(
          children: [
            Text("Tags: ${project.tags.join(', ')}"),
          ],
        )
      ],
    );
  }
}

void showAddNewProject(final BuildContext context) {
  showDialog(
    context: context,
    builder: (final context) {
      return const Dialog();
    },
  );
}
