part of pack_app;

class TopBar extends StatelessWidget {
  const TopBar({
    required final this.padding,
    final Key? key,
  }) : super(key: key);
  final EdgeInsets padding;
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: padding,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: HomeScreen.maxWidth,
          ),
          child: Row(
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
              CupertinoButton(
                onPressed: () {},
                child: Text(
                  'Get in touch',
                  style: theme.textTheme.button?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                    letterSpacing: 1,
                  ),
                ),
              ),
              CupertinoButton(
                onPressed: () {},
                child: Text(
                  'About',
                  style: theme.textTheme.button?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
