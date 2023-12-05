import 'package:xsoulspace/common_imports.dart';
import 'package:xsoulspace/pack_app/home/usage_options_dialog.dart';

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Builder(
                builder: (final context) {
                  switch (project.type) {
                    case ProjectType.game:
                      return const Icon(Icons.nature_people_rounded);
                    case ProjectType.app:
                      return const Icon(Icons.abc_rounded);
                    case ProjectType.excelAddin:
                      return const Icon(Icons.settings_applications_rounded);
                  }
                },
              ),
              uiTheme.horizontalBoxes.small,
              Flexible(child: Text(project.title, style: textTheme.titleLarge)),
            ],
          ),
          uiTheme.horizontalBoxes.medium,
          Flexible(
            child: Builder(
              builder: (final context) {
                String text;
                switch (project.status) {
                  case ProjectStatus.upcoming:
                    text = 'Upcoming';
                  case ProjectStatus.released:
                    text = 'Released on ${project.releasedAt?.formatYYMMDD()}. '
                        'Development continues.';
                  case ProjectStatus.legacy:
                    text = 'Released on ${project.releasedAt?.formatYYMMDD()} '
                        '\nDevelopment completed on '
                        '${project.completedAt?.formatYYMMDD()}.';
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
  Widget build(final BuildContext context) => SelectableText(
        "#${project.tags.map((final e) => e.replaceAll(' ', '_')).join(', #')}",
      );
}

class StoresInfo extends StatelessWidget {
  const StoresInfo({
    required this.project,
    super.key,
  });
  final ProjectModel project;
  @override
  Widget build(final BuildContext context) => TextButton(
        onPressed: () async =>
            showUsageOptionsDialog(context: context, project: project),
        child: const Text('Install in \nfavourite store'),
      );
}

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({
    required this.project,
    super.key,
  });
  final ProjectModel project;
  @override
  Widget build(final BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () async =>
                context.go(ScreenPaths.projectIdPrivacy(id: project.id)),
            child: const Text('Privacy Policy'),
          ),
          TextButton(
            onPressed: () async =>
                context.go(ScreenPaths.projectIdTerms(id: project.id)),
            child: const Text('Terms & Conditions'),
          ),
        ],
      );
}
