part of widgets;

class ProjectPreviewCard extends StatelessWidget {
  const ProjectPreviewCard({
    required final this.project,
    required final this.onInstall,
    required final this.onLearnMore,
    final Key? key,
  }) : super(key: key);
  final Project project;
  final ValueChanged<Project> onLearnMore;
  final ValueChanged<Project> onInstall;
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final headline4 = theme.textTheme.headline4?.copyWith(color: Colors.white);
    return Container(
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              width: 400,
              height: 300,
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
                      style: headline4,
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
                          style: theme.textTheme.bodyText1
                              ?.copyWith(color: Colors.white),
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
                    CupertinoIconButton(
                      onPressed: () {},
                      icon: Icons.store,
                      text: 'See live',
                    ),
                    CupertinoIconButton(
                      onPressed: () => onLearnMore(project),
                      icon: Icons.store,
                      text: 'Learn more',
                    ),
                    CupertinoIconButton(
                      onPressed: () => onInstall(project),
                      icon: Icons.store,
                      text: 'Install in favourite store',
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
                  style:
                      theme.textTheme.overline?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
