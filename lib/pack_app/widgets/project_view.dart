part of pack_app;

class ProjectViewFooter extends StatelessWidget {
  const ProjectViewFooter({
    required this.project,
    final Key? key,
  }) : super(key: key);
  final Project project;
  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SizedBox(
        height: 80,
        child: FittedBox(
          child: StoresFlex(
            project: project,
          ),
        ),
      ),
    );
  }
}

class ProjectView extends StatelessWidget {
  const ProjectView({
    required this.width,
    required this.project,
    final Key? key,
  }) : super(key: key);
  final double width;
  final Project project;
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 550,
      ),
      child: SizedBox(
        width: width - 50,
        child: Column(
          children: [
            SelectableText(
              project.name,
              style: theme.textTheme.headline5,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                project.fullDescription ?? '',
                style: theme.textTheme.bodyText2?.copyWith(
                  fontSize: 16,
                  // letterSpacing: 0.8,
                  height: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: SeeLiveButton(
                project: project,
                color: theme.primaryColor,
              ),
            ),
            const Spacer(),
            const SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
