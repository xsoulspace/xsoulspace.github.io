part of pack_games;

class GamesSection extends StatelessWidget {
  const GamesSection({
    required this.screenLayout,
    required this.onLearnMore,
    final Key? key,
  }) : super(key: key);
  final ScreenLayout screenLayout;
  final ValueChanged<Project> onLearnMore;
  @override
  Widget build(final BuildContext context) {
    final apps = context.read<GamesProvider>().values;
    return ProjectsGrid(
      screenLayout: screenLayout,
      count: apps.length,
      builder: (final _, final i) {
        return ProjectPreviewCard(
          onLearnMore: onLearnMore,
          project: apps[i],
        );
      },
    );
  }
}
