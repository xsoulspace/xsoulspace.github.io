part of widgets;

class SeeLiveButton extends StatelessWidget {
  const SeeLiveButton({
    required this.project,
    this.color,
    final Key? key,
  }) : super(key: key);
  final Project project;
  final Color? color;
  @override
  Widget build(final BuildContext context) {
    return CupertinoIconButton(
      color: color,
      onPressed: () {
        launchURL(project.links.liveSiteLink);
      },
      icon: Icons.play_arrow_rounded,
      text: 'See live',
    );
  }
}
