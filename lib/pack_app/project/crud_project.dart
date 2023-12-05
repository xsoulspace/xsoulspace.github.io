import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';

Future<void> showAddNewProject(
  final BuildContext context, {
  final ProjectModel? project,
}) async =>
    showDialog(
      context: context,
      builder: (final context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: CrudProjectDialog(project: project),
        ),
      ),
    );

class CrudProjectDiDto {
  CrudProjectDiDto.use(final Locator read) : apiServices = read();
  final ApiServices apiServices;
}

CrudProjectState useCrudProjectState({
  required final Locator read,
  final ProjectModel? project,
}) =>
    use(
      ContextfulLifeHook(
        debugLabel: 'CrudProjectState',
        state: CrudProjectState(
          diDto: CrudProjectDiDto.use(read),
          project: project,
        ),
      ),
    );

class CrudProjectState extends ContextfulLifeState {
  CrudProjectState({
    required this.project,
    required this.diDto,
  });
  final CrudProjectDiDto diDto;
  final ProjectModel? project;
  final title = TextEditingController();
  final subtitle = TextEditingController();
  final shortDescription = TextEditingController();

  ProjectStatus status = ProjectStatus.upcoming;
  void onProjectStatusChanged(final ProjectStatus? newStatus) {
    if (newStatus == null) return;
    status = newStatus;
    setState();
  }

  ProjectType type = ProjectType.app;
  void onProjectTypeChanged(final ProjectType? newType) {
    if (newType == null) return;
    type = newType;
    setState();
  }

  DateTime? releasedAt;
  Future<void> onChangeReleaseDate() async {
    final newDate = await showDatePicker(
      context: getContext(),
      initialDate: releasedAt ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 5000)),
      lastDate: DateTime.now(),
    );
    if (newDate == null) return;
    releasedAt = newDate;
    setState();
  }

  DateTime? completedAt;
  Future<void> onChangeCompletedDate() async {
    final newDate = await showDatePicker(
      context: getContext(),
      initialDate: completedAt ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 5000)),
      lastDate: DateTime.now(),
    );
    if (newDate == null) return;
    completedAt = newDate;
    setState();
  }

  final Set<String> tags = {};
  final Set<String> imagesLinks = {};
  final Set<String> videosLinks = {};

  void onDeleteImageLink(final String value) {
    if (value.isEmpty) return;
    imagesLinks.remove(value);
    setState();
  }

  void onAddImageLink(final String value) {
    if (value.isEmpty) return;
    imagesLinks.add(value);
    setState();
  }

  void onDeleteVideosLink(final String value) {
    if (value.isEmpty) return;
    videosLinks.remove(value);
    setState();
  }

  void onAddVideosLink(final String value) {
    if (value.isEmpty) return;
    videosLinks.add(value);
    setState();
  }

  void onDeleteTag(final String value) {
    if (value.isEmpty) return;
    tags.remove(value);
    setState();
  }

  void onAddTag(final String value) {
    if (value.isEmpty) return;
    tags.add(value);
    setState();
  }

  final markdownPrivacyPolicy = TextEditingController();
  final markdownTermsAndConditions = TextEditingController();
  final markdownChangelog = TextEditingController();

  /// ********************************************
  /// *      LINKS START
  /// ********************************************
  final githubLink = TextEditingController();
  final snapStoreLink = TextEditingController();
  final googlePlayLink = TextEditingController();
  final appleStoreLink = TextEditingController();
  final windowsStoreLink = TextEditingController();
  final ruStoreLink = TextEditingController();
  final huaweiAppGalleryLink = TextEditingController();
  final ownSiteLink = TextEditingController();
  final itchIoLink = TextEditingController();
  final yandexGamesLink = TextEditingController();
  @override
  void initState() {
    super.initState();
    final project = this.project;
    if (project != null) {
      title.text = project.title;
      subtitle.text = project.subtitle;
      shortDescription.text = project.shortDescription;
      markdownPrivacyPolicy.text = project.markdownPrivacyPolicy;
      markdownTermsAndConditions.text = project.markdownTermsAndConditions;
      markdownChangelog.text = project.markdownChangelog;
      githubLink.text = project.usageOptions.githubLink;
      snapStoreLink.text = project.usageOptions.snapStoreLink;
      googlePlayLink.text = project.usageOptions.googlePlayLink;
      appleStoreLink.text = project.usageOptions.appleStoreLink;
      windowsStoreLink.text = project.usageOptions.windowsStoreLink;
      ruStoreLink.text = project.usageOptions.ruStoreLink;
      huaweiAppGalleryLink.text = project.usageOptions.huaweiAppGalleryLink;
      ownSiteLink.text = project.usageOptions.ownSiteLink;
      itchIoLink.text = project.usageOptions.itchIoLink;
      yandexGamesLink.text = project.usageOptions.yandexGamesLink;
      status = project.status;
      type = project.type;
      releasedAt = project.releasedAt;
      completedAt = project.completedAt;
      tags.addAll(project.tags);
      imagesLinks.addAll(project.imagesLinks);
      videosLinks.addAll(project.videosLinks);
      if (mounted) setState();
    }
  }

  Future<void> onSave() async {
    final newProject = ProjectModel(
      id: project?.id ?? createId(),
      title: title.text,
      subtitle: subtitle.text,
      shortDescription: shortDescription.text,
      markdownPrivacyPolicy: markdownPrivacyPolicy.text,
      markdownTermsAndConditions: markdownTermsAndConditions.text,
      markdownChangelog: markdownChangelog.text,
      status: status,
      type: type,
      completedAt: completedAt,
      imagesLinks: imagesLinks.toList(),
      releasedAt: releasedAt,
      tags: tags.toList(),
      videosLinks: videosLinks.toList(),
      usageOptions: UsageOptionsModel(
        githubLink: githubLink.text,
        snapStoreLink: snapStoreLink.text,
        googlePlayLink: googlePlayLink.text,
        appleStoreLink: appleStoreLink.text,
        windowsStoreLink: windowsStoreLink.text,
        ruStoreLink: ruStoreLink.text,
        huaweiAppGalleryLink: huaweiAppGalleryLink.text,
        ownSiteLink: ownSiteLink.text,
        itchIoLink: itchIoLink.text,
        yandexGamesLink: yandexGamesLink.text,
      ),
    );
    await diDto.apiServices.projects.upsertProject(newProject);
    Navigator.pop(getContext());
  }

  @override
  void dispose() {
    title.dispose();
    subtitle.dispose();
    shortDescription.dispose();
    markdownPrivacyPolicy.dispose();
    markdownTermsAndConditions.dispose();
    markdownChangelog.dispose();
    githubLink.dispose();
    snapStoreLink.dispose();
    googlePlayLink.dispose();
    appleStoreLink.dispose();
    windowsStoreLink.dispose();
    ruStoreLink.dispose();
    huaweiAppGalleryLink.dispose();
    ownSiteLink.dispose();
    itchIoLink.dispose();
    yandexGamesLink.dispose();
    super.dispose();
  }
}

class CrudProjectDialog extends HookWidget {
  const CrudProjectDialog({
    required this.project,
    super.key,
  });
  final ProjectModel? project;

  @override
  Widget build(final BuildContext context) {
    final state = useCrudProjectState(read: context.read, project: project);
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.8,
      child: ListView(
        children: [
          const Text('CRUD'),
          TextButton(
            onPressed: state.onChangeReleaseDate,
            child: Text('Released: ${state.releasedAt}'),
          ),
          TextButton(
            onPressed: state.onChangeCompletedDate,
            child: Text('Completed: ${state.completedAt}'),
          ),
          ChipsCreator(
            labelText: 'ImageLinks',
            onDelete: state.onDeleteImageLink,
            onAdd: state.onAddImageLink,
            values: state.imagesLinks,
          ),
          ChipsCreator(
            labelText: 'VideosLinks',
            onDelete: state.onDeleteVideosLink,
            onAdd: state.onAddVideosLink,
            values: state.videosLinks,
          ),
          ChipsCreator(
            labelText: 'tags',
            onDelete: state.onDeleteTag,
            onAdd: state.onAddTag,
            values: state.tags,
          ),
          DropdownButton(
            value: state.status,
            items: ProjectStatus.values
                .map(
                  (final e) => DropdownMenuItem(
                    value: e,
                    key: ValueKey(e),
                    child: Text(e.name),
                  ),
                )
                .toList(),
            onChanged: state.onProjectStatusChanged,
          ),
          DropdownButton(
            value: state.type,
            items: ProjectType.values
                .map(
                  (final e) => DropdownMenuItem(
                    value: e,
                    key: ValueKey(e),
                    child: Text(e.name),
                  ),
                )
                .toList(),
            onChanged: state.onProjectTypeChanged,
          ),
          TextField(
            controller: state.title,
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'title',
                ),
          ),
          TextField(
            controller: state.subtitle,
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'subtitle',
                ),
          ),
          TextField(
            controller: state.shortDescription,
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'shortDescription',
                ),
          ),
          TextField(
            controller: state.markdownPrivacyPolicy,
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'markdownPrivacyPolicy',
                ),
          ),
          TextField(
            controller: state.markdownTermsAndConditions,
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'markdownTermsAndConditions',
                ),
          ),
          TextField(
            controller: state.markdownChangelog,
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'markdownChangelog',
                ),
          ),
          TextField(
            controller: state.githubLink,
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'githubLink',
                ),
          ),
          TextField(
            controller: state.snapStoreLink,
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'snapStoreLink',
                ),
          ),
          TextField(
            controller: state.googlePlayLink,
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'googlePlayLink',
                ),
          ),
          TextField(
            controller: state.appleStoreLink,
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'appleStoreLink',
                ),
          ),
          TextField(
            controller: state.windowsStoreLink,
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'windowsStoreLink',
                ),
          ),
          TextField(
            controller: state.ruStoreLink,
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'ruStoreLink',
                ),
          ),
          TextField(
            controller: state.huaweiAppGalleryLink,
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'huaweiAppGalleryLink',
                ),
          ),
          TextField(
            controller: state.ownSiteLink,
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'ownSiteLink',
                ),
          ),
          TextField(
            controller: state.itchIoLink,
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'itchIoLink',
                ),
          ),
          TextField(
            controller: state.yandexGamesLink,
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(
                  labelText: 'yandexGamesLink',
                ),
          ),
          TextButton(onPressed: state.onSave, child: const Text('Save')),
        ],
      ),
    );
  }
}

class ChipsCreator extends HookWidget {
  const ChipsCreator({
    required this.values,
    required this.onDelete,
    required this.onAdd,
    required this.labelText,
    super.key,
  });
  final Set<String> values;
  final ValueChanged<String> onDelete;
  final ValueChanged<String> onAdd;
  final String labelText;
  @override
  Widget build(final BuildContext context) {
    final textFieldController = useTextEditingController();
    final theme = Theme.of(context);
    void onAddValue([final String? value]) {
      onAdd(textFieldController.text);
      textFieldController.clear();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: textFieldController,
          onEditingComplete: onAddValue,
          onSubmitted: onAddValue,
          decoration: const InputDecoration()
              .applyDefaults(theme.inputDecorationTheme)
              .copyWith(
                labelText: labelText,
                suffix: IconButton(
                  onPressed: onAddValue,
                  icon: const Icon(Icons.add),
                ),
              ),
        ),
        Wrap(
          children: values
              .map(
                (final e) => InputChip(
                  label: Text(e),
                  key: ValueKey(e),
                  onDeleted: () {
                    onDelete(e);
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
