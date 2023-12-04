import 'package:app_core/app_core.dart';
import 'package:app_design_core/app_design_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:xsoulspace/pack_app/project/crud_project.dart';
import 'package:xsoulspace/pack_app/widgets/project_tile_blocks.dart';

class AdaptiveProjectTile extends StatelessWidget {
  const AdaptiveProjectTile({
    required this.project,
    super.key,
  });
  final ProjectModel project;

  @override
  Widget build(final BuildContext context) {
    Widget child;
    if (Breakpoints.large.isActive(context)) {
      child = ProjectLargeTile(project: project);
    } else if (Breakpoints.medium.isActive(context)) {
      child = ProjectMiddleTile(project: project);
    } else {
      child = ProjectSmallTile(project: project);
    }
    final uiTheme = UiTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        if (kDebugMode)
          TextButton(
            onPressed: () async => showAddNewProject(context, project: project),
            child: const Text('Edit'),
          )
        else
          uiTheme.verticalBoxes.medium,
      ],
    );
  }
}

class OutlinedCard extends StatelessWidget {
  const OutlinedCard({
    required this.child,
    required this.padding,
    super.key,
  });
  final Widget child;
  final EdgeInsets padding;
  @override
  Widget build(final BuildContext context) => Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 0.3,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      );
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

    return OutlinedCard(
      padding: const EdgeInsets.symmetric(
        vertical: 48,
        horizontal: 24,
      ),
      child: Row(
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
                        child: AppNetworkImage(
                          imageUrl: project.imagesLinks.last,
                        ),
                        // io_video.AdaptiveVideoPlayer(
                        //   url: project.videosLinks.first,
                        //   constraints: const BoxConstraints(),
                        // ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TagsText(
                        project: project,
                      ),
                    ),
                    StoresInfo(project: project),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
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

    return OutlinedCard(
      padding: const EdgeInsets.symmetric(
        vertical: 48,
        horizontal: 24,
      ),

      // padding: const EdgeInsets.symmetric(
      //   vertical: 24,
      //   horizontal: 12,
      // ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: AppNetworkImage(
                    imageUrl: project.imagesLinks.first,
                    constraints: imageConstraints,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                uiTheme.verticalBoxes.medium,
                ProjectTitleText(project: project),
                uiTheme.verticalBoxes.medium,
                ProjectSubtitle(project: project),
                uiTheme.verticalBoxes.medium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TagsText(
                        project: project,
                      ),
                    ),
                    StoresInfo(project: project),
                  ],
                ),
              ],
            ),
          ),
          uiTheme.horizontalBoxes.large,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                // AspectRatio(
                //   aspectRatio: 16 / 9,
                //   child: io_video.AdaptiveVideoPlayer(
                //     constraints: videoConstraints,
                //     url: project.videosLinks.first,
                //   ),
                // ),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: AppNetworkImage(
                    imageUrl: project.imagesLinks[1],
                  ),
                ),
                uiTheme.verticalBoxes.small,
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: AppNetworkImage(
                    imageUrl: project.imagesLinks[2],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 0.3,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 150,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                // io_video.AdaptiveVideoPlayer(
                //   constraints: const BoxConstraints(maxWidth: 300),
                //   url: project.videosLinks.first,
                // ),
                AppNetworkImage(
                  imageUrl: project.imagesLinks.first,
                ),
                uiTheme.horizontalBoxes.medium,
                AppNetworkImage(
                  imageUrl: project.imagesLinks[1],
                ),
                uiTheme.horizontalBoxes.medium,
                AppNetworkImage(
                  imageUrl: project.imagesLinks[2],
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TagsText(
                  project: project,
                ),
              ),
              StoresInfo(project: project),
            ],
          ),
        ],
      ),
    );
  }
}
