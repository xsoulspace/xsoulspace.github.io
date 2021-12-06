part of pack_app;

class StoresFlex extends StatelessWidget {
  const StoresFlex({
    required final this.project,
    final this.axis = Axis.horizontal,
    final this.showGithub = true,
    final this.padding,
    final Key? key,
  }) : super(key: key);
  final Project project;
  final Axis axis;
  final bool showGithub;
  final EdgeInsets? padding;
  @override
  Widget build(final BuildContext context) {
    final badges = [
      BadgeButton(
        src: project.links.googlePlayLink,
        badgeImage: Assets.badges.googlePlay.image(),
      ),
      BadgeButton(
        src: project.links.appleStoreLink,
        badgeImage: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Assets.badges.appleStore.svg(
            height: 34,
          ),
        ),
      ),
      BadgeButton(
        src: project.links.snapstoreLink,
        badgeImage: Assets.badges.snapstore.svg(
          height: 33,
        ),
      ),
      if (showGithub)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: BadgeButton(
            src: project.links.githubLink,
            badgeImage: Assets.icons.github.gitHubMark64px.image(
              width: 22,
              height: 22,
            ),
          ),
        ),
    ];
    Widget child;
    if (axis == Axis.horizontal) {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: badges,
      );
    } else {
      child = Column(
        mainAxisSize: MainAxisSize.min,
        children: badges,
      );
    }
    if (padding != null) {
      child = Padding(padding: padding!, child: child);
    }
    return child;
  }
}

class BadgeButton extends StatelessWidget {
  const BadgeButton({
    final this.src,
    final this.badgeImage,
    final Key? key,
  }) : super(key: key);
  final String? src;
  final Widget? badgeImage;
  @override
  Widget build(final BuildContext context) {
    if (src == null || src!.isEmpty) return const SizedBox();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: CupertinoButton(
        minSize: 0,
        padding: EdgeInsets.zero,
        onPressed: () => launchURL(src),
        child: SizedBox(
          height: 50,
          child: badgeImage,
        ),
      ),
    );
  }
}
