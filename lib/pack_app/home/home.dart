import 'package:app_core/app_core.dart';
import 'package:app_design_core/app_design_core.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/foundation.dart';
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
          if (kDebugMode) ...[
            ListTile(
              title: const Text('Add Project'),
              onTap: state.onAddProject,
            ),
            uiTheme.verticalBoxes.medium,
          ],
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

class ProjectLargeTile extends HookWidget {
  const ProjectLargeTile({
    required this.project,
    super.key,
  });
  final ProjectModel project;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final uiTheme = UiTheme.of(context);
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        AppNetworkImage(
          imageUrl: project.imagesLinks.first,
          constraints: BoxConstraints(
            maxHeight: size.height * 0.8,
            maxWidth: size.width * 0.5,
          ),
        ),
        uiTheme.horizontalBoxes.medium,
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ProjectTitleText(project: project),
                uiTheme.verticalBoxes.large,
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (final context, final index) {
                    if (index == 3) {
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        child: AdaptiveVideoPlayer(
                          url: project.videosLinks.first,
                          constraints: const BoxConstraints(),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: AppNetworkImage(
                        imageUrl: project.imagesLinks[index],
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 16 / 9,
                  ),
                ),
                uiTheme.verticalBoxes.large,
                ProjectSubtitle(project: project),
                uiTheme.verticalBoxes.medium,
                Row(
                  children: [
                    Flexible(
                      child: TagsText(
                        project: project,
                      ),
                    ),
                    uiTheme.horizontalBoxes.large,
                    StoresInfo(project: project),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProjectMiddleTile extends HookWidget {
  const ProjectMiddleTile({
    required this.project,
    super.key,
  });
  final ProjectModel project;
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final uiTheme = UiTheme.of(context);
    final size = MediaQuery.of(context).size;
    final imageConstraints = BoxConstraints(
      maxWidth: size.width * 0.45,
      maxHeight: (size.height * 0.8) / 2,
    );
    final videoConstraints = BoxConstraints(
      maxWidth: size.width * 0.45,
      maxHeight: (size.height * 0.8) / 3,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppNetworkImage(
                imageUrl: project.imagesLinks.first,
                constraints: imageConstraints,
              ),
              uiTheme.verticalBoxes.medium,
              ProjectTitleText(project: project),
              uiTheme.verticalBoxes.medium,
              ProjectSubtitle(project: project),
              uiTheme.verticalBoxes.medium,
              Row(
                children: [
                  Flexible(
                    child: TagsText(
                      project: project,
                    ),
                  ),
                  uiTheme.horizontalBoxes.large,
                  StoresInfo(project: project),
                ],
              )
            ],
          ),
        ),
        uiTheme.horizontalBoxes.large,
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: AdaptiveVideoPlayer(
                  constraints: videoConstraints,
                  url: project.videosLinks.first,
                ),
              ),
              uiTheme.verticalBoxes.small,
              AppNetworkImage(
                imageUrl: project.imagesLinks[1],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProjectSmallTile extends HookWidget {
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
        uiTheme.verticalBoxes.medium,
        ProjectTitleText(project: project),
        uiTheme.verticalBoxes.medium,
        ProjectSubtitle(project: project),
        uiTheme.verticalBoxes.medium,
        Row(
          children: [
            Flexible(
              child: TagsText(
                project: project,
              ),
            ),
            uiTheme.horizontalBoxes.large,
            StoresInfo(project: project),
          ],
        )
      ],
    );
  }
}

class ProjectSubtitle extends StatelessWidget {
  const ProjectSubtitle({
    required this.project,
    super.key,
  });
  final ProjectModel project;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return SelectableText(
      project.subtitle,
      style: textTheme.titleMedium,
    );
  }
}

class ProjectTitleText extends HookWidget {
  const ProjectTitleText({
    required this.project,
    super.key,
  });
  final ProjectModel project;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final uiTheme = UiTheme.of(context);
    final focusNode = useFocusNode();

    return SelectableRegion(
      selectionControls: materialTextSelectionControls,
      focusNode: focusNode,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Text(project.title, style: textTheme.titleLarge),
          uiTheme.horizontalBoxes.medium,
          Flexible(
            child: Builder(
              builder: (final context) {
                String text;
                switch (project.status) {
                  case ProjectStatus.upcoming:
                    text = 'Upcoming';
                    break;
                  case ProjectStatus.released:
                    text = 'Released on ${project.releasedAt?.formatYYMMDD()}. '
                        'Development continues.';
                    break;
                  case ProjectStatus.legacy:
                    text = 'Released on ${project.releasedAt?.formatYYMMDD()} '
                        '\nDevelopment completed on '
                        '${project.completedAt?.formatYYMMDD()}.';
                    break;
                }
                return Text(text, style: textTheme.labelSmall);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TagsText extends StatelessWidget {
  const TagsText({
    required this.project,
    super.key,
  });
  final ProjectModel project;
  @override
  Widget build(final BuildContext context) {
    return SelectableText(
      "#${project.tags.map((final e) => e.replaceAll(' ', '_')).join(', #')}",
    );
  }
}

class StoresInfo extends StatelessWidget {
  const StoresInfo({
    required this.project,
    super.key,
  });
  final ProjectModel project;
  @override
  Widget build(final BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text('Install in \nfavourite store'),
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
