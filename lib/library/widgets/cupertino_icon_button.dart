part of widgets;

class CupertinoIconButton extends StatelessWidget {
  const CupertinoIconButton({
    required final this.onPressed,
    required final this.text,
    required final this.icon,
    final this.size,
    final this.color,
    final Key? key,
  }) : super(key: key);
  final String text;
  final VoidCallback onPressed;
  final IconData icon;
  final double? size;
  final Color? color;
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: CupertinoButton(
        minSize: 0,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: size,
              color: color?? Colors.white,
            ),
            const SizedBox(width: 6),
            Text(
              text,
              style: theme.textTheme.bodyText2?.copyWith(
                color: color?? Colors.white,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
