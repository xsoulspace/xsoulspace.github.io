part of pack_app;

class ProjectViewFooter extends StatelessWidget {
  const ProjectViewFooter({
    required final this.project,
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
          child: StoresRow(
            project: project,
          ),
        ),
      ),
    );
  }
}

class ProjectView extends StatelessWidget {
  const ProjectView({
    required final this.width,
    final Key? key,
  }) : super(key: key);
  final double width;
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 550,
          ),
          child: SizedBox(
            width: width - 50,
            child: Column(
              children: [
                SelectableText(
                  'Last Answer',
                  style: theme.textTheme.headline5,
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SelectableText(
                    "You have a cool idea. You need to write it down fast. \n\nThen this app is for you. \n\nFollow questions, write as many answers as you can. \nAs a result, you will get a quick description of the idea. \n\nOr just write a quick note. \n\nThat's it!:) ",
                    style: theme.textTheme.bodyText2?.copyWith(
                      fontSize: 16,
                      // letterSpacing: 0.8,
                      height: 1.2,
                    ),
                  ),
                ),
                const Spacer(),
                const SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
