import 'package:app_core/app_core.dart';
import 'package:app_design_core/app_design_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart' as url_launcher_string;
import 'package:xsoulspace/gen/assets.gen.dart';

Future<void> showUsageOptionsDialog({
  required final ProjectModel project,
  required final BuildContext context,
}) async =>
    showDialog(
      context: context,
      builder: (final context) => Dialog(
        child: UsageOptionsDialog(
          project: project,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
          showGithub: false,
          axis: Axis.vertical,
        ),
      ),
    );

class UsageOptionsDialog extends StatelessWidget {
  const UsageOptionsDialog({
    required this.project,
    this.axis = Axis.horizontal,
    this.showGithub = true,
    this.padding,
    super.key,
  });
  final ProjectModel project;
  final Axis axis;
  final bool showGithub;
  final EdgeInsets? padding;
  @override
  Widget build(final BuildContext context) {
    final uiTheme = UiTheme.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final badges = [
      Text(
        project.title,
        style: textTheme.headlineMedium,
      ),
      uiTheme.verticalBoxes.large,
      BadgeButton(
        src: project.usageOptions.googlePlayLink,
        badgeImage: Assets.badges.googlePlay.image(),
      ),
      BadgeButton(
        src: project.usageOptions.appleStoreLink,
        badgeImage: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Assets.badges.appleStore.svg(
            height: 34,
          ),
        ),
      ),
      BadgeButton(
        src: project.usageOptions.snapStoreLink,
        badgeImage: Assets.badges.snapstore.svg(
          height: 33,
        ),
      ),
      if (showGithub)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: BadgeButton(
            src: project.usageOptions.githubLink,
            badgeImage: Assets.icons.github.gitHubMark64px.image(
              width: 22,
              height: 22,
            ),
          ),
        ),
      BadgeButton(
        src: project.usageOptions.itchIoLink,
        badgeImage: const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Text('Live on Itch.io'),
        ),
      ),
      BadgeButton(
        src: project.usageOptions.ownSiteLink,
        badgeImage: const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Text('Live on website'),
        ),
      ),
      uiTheme.verticalBoxes.large,
      FilledButton.tonal(
        onPressed: () => Navigator.pop(context),
        child: const Text('Close'),
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
    this.src,
    this.badgeImage,
    super.key,
  });
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
        onPressed: () async => url_launcher_string.launchUrlString(src!),
        child: SizedBox(
          height: 50,
          child: badgeImage,
        ),
      ),
    );
  }
}
