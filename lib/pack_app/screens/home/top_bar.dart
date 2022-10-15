part of pack_app;

class TopBar extends StatelessWidget {
  const TopBar({
    required this.padding,
    required this.onAbout,
    final Key? key,
  }) : super(key: key);
  final EdgeInsets padding;
  final VoidCallback onAbout;
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final screenLayout = ScreenLayout.of(context);
    final actions = [
      CupertinoButton(
        onPressed: launchEmail,
        child: Text(
          'Get in touch',
          style: theme.textTheme.button?.copyWith(
            color: theme.colorScheme.onPrimary.withOpacity(0.8),
            letterSpacing: 1,
          ),
        ),
      ),
      CupertinoButton(
        onPressed: onAbout,
        child: Text(
          'About',
          style: theme.textTheme.button?.copyWith(
            color: theme.colorScheme.onPrimary.withOpacity(0.8),
            letterSpacing: 1,
          ),
        ),
      ),
    ];
    return Padding(
      padding: padding,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: HomeScreen.maxWidth,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  CupertinoButton(
                    onPressed: () {},
                    child: Text(
                      'XSoulSpace',
                      style: theme.textTheme.headline6?.copyWith(
                        color: Colors.white.withOpacity(0.8),
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (screenLayout.moreThenSmall) ...actions,
                ],
              ),
              if (screenLayout.small)
                Wrap(
                  children: actions,
                )
            ],
          ),
        ),
      ),
    );
  }
}
