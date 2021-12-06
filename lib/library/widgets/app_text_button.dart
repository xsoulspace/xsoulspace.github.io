part of widgets;

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required final this.text,
    required final this.onTap,
    final Key? key,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: 0,
        onPressed: onTap,
        child: Text(
          text,
          style: theme.bodyText2?.copyWith(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
