part of pack_app;

class StoresRow extends StatelessWidget {
  const StoresRow({
    required final this.project,
    final Key? key,
  }) : super(key: key);
  final Project project;
  @override
  Widget build(final BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12,
      children: [
        BadgeButton(
          src: project.links.googlePlayLink,
          badgeImage: Assets.badges.googlePlay.image(),
        ),
        BadgeButton(
          src: project.links.appleStoreLink,
          badgeImage: Assets.badges.appleStore.svg(
            height: 34,
          ),
        ),
        BadgeButton(
          src: project.links.snapstoreLink,
          badgeImage: Assets.badges.snapstore.svg(
            height: 33,
          ),
        ),
        BadgeButton(
          src: project.links.liveSiteLink,
        ),
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
      ],
    );
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
    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed: () => launchURL(src),
      child: SizedBox(
        height: 50,
        child: badgeImage,
      ),
    );
  }
}
