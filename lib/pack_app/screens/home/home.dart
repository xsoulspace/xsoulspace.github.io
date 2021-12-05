part of pack_app;

class HomeScreen extends HookWidget {
  const HomeScreen({
    final this.isProjectOpened = true,
    final this.isPagePopupOpened = false,
    final Key? key,
  }) : super(key: key);
  final bool isProjectOpened;
  final bool isPagePopupOpened;
  static const maxWidth = 1100.0;
  static const appBarBottomPadding = 40.0;

  @override
  Widget build(final BuildContext context) {
    final scrollController = useScrollController();
    final isProjectPopupOpen = useIsBool(initial: isProjectOpened);
    final isPagePopupOpen = useIsBool(initial: isPagePopupOpened);

    final screenLayout = ScreenLayout.of(context);
    final appBarPadding = screenLayout.small
        ? const EdgeInsets.all(14)
        : const EdgeInsets.symmetric(horizontal: 14, vertical: 88);
    final double topToPinnedBarHeight =
        screenLayout.small ? 14 : 88 * 2 + appBarBottomPadding + 120;
    const divider = SliverToBoxAdapter(
      child: SizedBox(
        width: 40,
        height: 10,
      ),
    );
    final appsProvider = context.read<AppsProvider>();
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            primary: false,
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Assets.sections.headerSection.image(
                  height: screenLayout.small ? 600 : 960,
                  fit: BoxFit.fitHeight,
                  // color: Colors.green,
                ),
              ),
              const SliverFillRemaining(),
            ],
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (final scrollInfo) {
              scrollController.jumpTo(scrollInfo.metrics.pixels);
              return false;
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const TopSafeArea(),
                      TopBar(
                        padding: appBarPadding,
                      ),
                      const SizedBox(height: 90),
                    ],
                  ),
                ),
                PinnedAppBar(
                  topPadding: topToPinnedBarHeight,
                  pinned: !isProjectPopupOpen.value,
                  actions: [
                    ActionItem(
                      onTap: () {},
                      title: 'Apps',
                      color: Colors.white.withOpacity(0.85),
                    ),
                    ActionItem(
                      onTap: () {},
                      title: 'Games',
                      color: Colors.white.withOpacity(0.85),
                    ),
                    ActionItem(
                      onTap: () {},
                      title: 'Libraries',
                      color: Colors.white.withOpacity(0.85),
                    ),
                    ActionItem(
                      onTap: () {},
                      title: 'Excel Addins',
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: screenLayout.small ? 210 : 420),
                ),
                AppsSection(
                  screenLayout: screenLayout,
                  onInstall: (final _) {},
                  onLearnMore: (final _) {},
                ),
                divider,
                GamesSection(
                  screenLayout: screenLayout,
                  onInstall: (final _) {},
                  onLearnMore: (final _) {},
                ),
                divider,
                LibrariesSection(
                  screenLayout: screenLayout,
                  onInstall: (final _) {},
                  onLearnMore: (final _) {},
                ),
                divider,
                ExcelAddinsSection(
                  screenLayout: screenLayout,
                  onInstall: (final _) {},
                  onLearnMore: (final _) {},
                ),
                const SliverToBoxAdapter(
                  child: FooterSection(),
                ),
              ],
            ),
          ),
          if (isProjectPopupOpen.value)
            GlassDialog(
              footer: ProjectViewFooter(
                project: appsProvider.values.first,
              ),
              bodyBuilder: (final width) {
                return ProjectView(
                  width: width,
                );
              },
              onClose: () {
                isProjectPopupOpen.value = false;
              },
            ),
        ],
      ),
    );
  }
}
