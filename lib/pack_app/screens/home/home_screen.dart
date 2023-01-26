import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:provider/provider.dart';
import 'package:xsoulspace/abstract/abstract.dart';
import 'package:xsoulspace/library/utils/utils.dart';
import 'package:xsoulspace/library/widgets/widgets.dart';
import 'package:xsoulspace/pack_app/pack_app.dart';
import 'package:xsoulspace/pack_app/screens/home/footer.dart';
import 'package:xsoulspace/pack_app/screens/home/top_bar.dart';
import 'package:xsoulspace/pack_apps/pack_apps.dart';
import 'package:xsoulspace/pack_games/pack_games.dart';

part 'home_screen_state.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({
    this.isPagePopupOpened = false,
    super.key,
  });
  final bool isPagePopupOpened;
  static const maxWidth = 1100.0;
  static const appBarBottomPadding = 40.0;

  @override
  Widget build(final BuildContext context) {
    final state = _useHomeScreenState(read: context.read);

    void toAnchorPoint(final GlobalKey key) {
      final renderObj = key.currentContext!.findRenderObject();
      if (renderObj == null) {
        return;
      }
      final vp = RenderAbstractViewport.of(renderObj);
      if (vp == null) {
        return;
      }
      final scrollableState = Scrollable.of(state.appsKey.currentContext!);
      // Get its offset
      scrollableState.position.ensureVisible(
        renderObj,
        duration: const Duration(milliseconds: 300),
      );
    }

    final isProjectPopupOpen = useIsBool();
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

    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            primary: false,
            controller: state.backgroundScrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  height: screenLayout.small ? 600 : 800,
                  decoration: BoxDecoration(color: theme.colorScheme.primary),
                ),
              ),
              const SliverFillRemaining(),
            ],
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (final scrollInfo) {
              state.backgroundScrollController
                  .jumpTo(scrollInfo.metrics.pixels);
              return false;
            },
            child: CustomScrollView(
              controller: state.scrollController,
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
                        toAnchorPoint(state.appsKey);
                      },
                      title: 'Apps',
                      color: theme.colorScheme.onPrimary.withOpacity(0.85),
                    ),
                    ActionItem(
                      onTap: () {
                        toAnchorPoint(state.gamesKey);
                      },
                      title: 'Games',
                      color: theme.colorScheme.onPrimary.withOpacity(0.85),
                    ),
                    // TODO(arenukvern): enable when sections will be ready
                    // ActionItem(
                    //   onTap: () {},
                    //   title: 'Libraries',
                    //   color: Colors.white.withOpacity(0.85),
                    // ),
                    ActionItem(
                      onTap: () {},
                      title: 'Excel Addins',
                      color: theme.colorScheme.onPrimary.withOpacity(0.85),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: screenLayout.small ? 110 : 240),
                ),
                SliverToBoxAdapter(
                  key: state.appsKey,
                  child: SizedBox(height: screenLayout.small ? 100 : 240),
                ),
                AppsSection(
                  screenLayout: screenLayout,
                  onLearnMore: onLearnMore,
                ),
                divider,
                SliverToBoxAdapter(
                  key: state.gamesKey,
                  child: const SizedBox(height: 210),
                ),
                GamesSection(
                  screenLayout: screenLayout,
                  onLearnMore: onLearnMore,
                ),
                divider,
                const SliverToBoxAdapter(child: SizedBox(height: 110)),
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
                      state.scrollController.animateTo(
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
