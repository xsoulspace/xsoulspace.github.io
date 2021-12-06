part of pack_libraries;

class LibrariesSection extends StatelessWidget {
  const LibrariesSection({
    required final this.screenLayout,
    required final this.onLearnMore,
    final Key? key,
  }) : super(key: key);
  final ScreenLayout screenLayout;
  final ValueChanged<Project> onLearnMore;
  @override
  Widget build(final BuildContext context) {
    final apps = context.read<LibrariesProvider>().values;
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
