part of widgets;

class CardButton extends StatelessWidget {
  const CardButton({
    required final this.onPressed,
    required final this.text,
    required final this.icon,
    final Key? key,
  }) : super(key: key);
  final String text;
  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: theme.textTheme.bodyText2?.copyWith(
              color: Colors.white,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
