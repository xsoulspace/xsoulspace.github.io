part of pack_app;

class HomeScreen extends HookWidget {
  const HomeScreen({
    final this.isPagePopupOpened = false,
    final Key? key,
  }) : super(key: key);
  final bool isPagePopupOpened;
  static const maxWidth = 1100.0;
  static const appBarBottomPadding = 40.0;
  static final appsKey = GlobalKey();
  static final gamesKey = GlobalKey();
  void toAnchorPoint(final GlobalKey key) {
    final renderObj = key.currentContext!.findRenderObject();
    if (renderObj == null) {
      return;
    }
    final vp = RenderAbstractViewport.of(renderObj);
    if (vp == null) {
      return;
    }
    final scrollableState = Scrollable.of(appsKey.currentContext!);
    // Get its offset
    scrollableState!.position.ensureVisible(
      renderObj,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final backgroundScrollController = useScrollController();
    final scrollController = useScrollController();
    final isProjectPopupOpen = useIsBool();
    final isPagePopupOpen = useIsBool(initial: isPagePopupOpened);
    final currentProject = useState<Project?>(null);
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
    void onLearnMore(final Project project) {
      currentProject.value = project;
      isProjectPopupOpen.value = true;
    }

    void onAbout() {
      showCupertinoModalPopup(
        context: context,
        builder: (final context) {
          return CupertinoAlertDialog(
            title: const Text('Hello!'),
            content: const AboutScreen(),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.maybePop(context),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            primary: false,
            controller: backgroundScrollController,
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
              backgroundScrollController.jumpTo(scrollInfo.metrics.pixels);
              return false;
            },
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const TopSafeArea(),
                      TopBar(
                        padding: appBarPadding,
                        onAbout: onAbout,
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
                      onTap: () {
                        toAnchorPoint(appsKey);
                      },
                      title: 'Apps',
                      color: Colors.white.withOpacity(0.85),
                    ),
                    ActionItem(
                      onTap: () {
                        toAnchorPoint(gamesKey);
                      },
                      title: 'Games',
                      color: Colors.white.withOpacity(0.85),
                    ),
                    // TODO(arenukvern): enable when sections will be ready
                    // ActionItem(
                    //   onTap: () {},
                    //   title: 'Libraries',
                    //   color: Colors.white.withOpacity(0.85),
                    // ),
                    // ActionItem(
                    //   onTap: () {},
                    //   title: 'Excel Addins',
                    //   color: Colors.white.withOpacity(0.85),
                    // ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: screenLayout.small ? 210 : 420),
                ),
                SliverToBoxAdapter(key: appsKey),
                AppsSection(
                  screenLayout: screenLayout,
                  onLearnMore: onLearnMore,
                ),
                divider,
                SliverToBoxAdapter(key: gamesKey),
                GamesSection(
                  screenLayout: screenLayout,
                  onLearnMore: onLearnMore,
                ),
                divider,
                // TODO(arenukvern): enable when sections will be ready
                // LibrariesSection(
                //   screenLayout: screenLayout,
                //   onInstall: (final _) {},
                //   onLearnMore: (final _) {},
                // ),
                // divider,
                // ExcelAddinsSection(
                //   screenLayout: screenLayout,
                //   onInstall: (final _) {},
                //   onLearnMore: (final _) {},
                // ),
                SliverToBoxAdapter(
                  child: FooterSection(
                    onHome: () {
                      scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 450),
                        curve: Curves.easeInOut,
                      );
                    },
                    onAbout: onAbout,
                    onContacts: launchEmail,
                    onPrivacyPolicy: () {},
                    onTermsOfUse: () {},
                  ),
                ),
              ],
            ),
          ),
          if (isProjectPopupOpen.value)
            GlassDialog(
              footer: ProjectViewFooter(
                project: currentProject.value!,
              ),
              bodyBuilder: (final width) {
                return ProjectView(
                  width: width,
                  project: currentProject.value!,
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
