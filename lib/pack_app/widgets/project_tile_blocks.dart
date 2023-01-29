import 'package:app_core/app_core.dart';
import 'package:app_design_core/app_design_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
