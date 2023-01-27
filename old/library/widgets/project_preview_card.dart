part of widgets;

class ProjectPreviewCard extends StatelessWidget {
  const ProjectPreviewCard({
    required this.project,
    required this.onLearnMore,
    final Key? key,
  }) : super(key: key);
  final Project project;
  final ValueChanged<Project> onLearnMore;
  static const installInStoreTitle = 'Install in favourite store';
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    const color = Colors.black87;
    final title = theme.textTheme.headline3?.copyWith(color: color);

    return Container(
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(),
              // width: 400,
              // height: 300,
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    SelectableText(
                      project.name,
                      textAlign: TextAlign.center,
                      style: title,
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: SelectableText(
                          project.description,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyText1?.copyWith(
                            color: color,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  runSpacing: 16,
                  spacing: 16,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (project.links.liveSiteLink.isNotEmpty)
                      SeeLiveButton(
                        color: color,
                        project: project,
                      ),
                    CupertinoIconButton(
                      color: color,
                      onPressed: () => onLearnMore(project),
                      icon: Icons.arrow_forward_ios_rounded,
                      size: 18,
                      text: 'Learn more',
                    ),
                    if (project.links.isInStores)
                      CupertinoIconButton(
                        color: color,
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (final context) {
                              return CupertinoAlertDialog(
                                title: Text(project.name),
                                content: StoresFlex(
                                  project: project,
                                  padding: const EdgeInsets.only(top: 15),
                                  showGithub: false,
                                  axis: Axis.vertical,
                                ),
                                actions: [
                                  CupertinoDialogAction(
                                    isDefaultAction: true,
                                    onPressed: () =>
                                        Navigator.maybePop(context),
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icons.store,
                        text: installInStoreTitle,
                      ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                SelectableText(
                  project.hashtags.map((final e) => '#$e').join('       '),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.overline?.copyWith(
                    color: color,
                    fontSize: 14,
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
