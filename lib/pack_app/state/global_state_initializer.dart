part of pack_app;

class GlobalStateInitializer implements StateInitializer {
  GlobalStateInitializer({
    required final this.context,
  });
  final BuildContext context;

  @override
  Future<void> onLoad() async {
    final assets = DefaultAssetBundle.of(context);
    final projectsStr = await assets.loadString(Assets.json.projects);
    final projectsJson =
        List.castFrom<dynamic, Map<String, dynamic>>(jsonDecode(projectsStr));
    final projects = projectsJson.map(Project.fromJson);

    MapState.load<Project, AppsProvider>(
      context: context,
      values: projects.where((final e) => e.projectType == ProjectTypes.app),
    );
    MapState.load<Project, GamesProvider>(
      context: context,
      values: projects.where((final e) => e.projectType == ProjectTypes.game),
    );
    MapState.load<Project, LibrariesProvider>(
      context: context,
      values:
          projects.where((final e) => e.projectType == ProjectTypes.library),
    );
    MapState.load<Project, ExcelAddinsProvider>(
      context: context,
      values:
          projects.where((final e) => e.projectType == ProjectTypes.excelAddin),
    );
  }
}
