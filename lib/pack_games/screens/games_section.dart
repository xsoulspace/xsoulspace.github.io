part of pack_games;

class GamesSection extends StatelessWidget {
  const GamesSection({
    required final this.screenLayout,
    required final this.onInstall,
    required final this.onLearnMore,
    final Key? key,
  }) : super(key: key);
  final ScreenLayout screenLayout;
  final ValueChanged<Project> onLearnMore;
  final ValueChanged<Project> onInstall;
  @override
  Widget build(final BuildContext context) {
    final apps = context.read<GamesProvider>().values;
    return ProjectsGrid(
      screenLayout: screenLayout,
      count: apps.length,
      builder: (final _, final i) {
        return ProjectPreviewCard(
          onInstall: onInstall,
          onLearnMore: onLearnMore,
          project: apps[i],
        );
      },
    );
  }
}
