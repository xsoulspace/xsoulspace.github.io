part of pack_app;

class FooterSection extends StatelessWidget {
  const FooterSection({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      children: [
        const SizedBox(height: 200),
        Text(
          'XSoulSpace',
          textAlign: TextAlign.center,
          style: textTheme.bodyText1?.copyWith(
            color: theme.primaryColor,
            letterSpacing: 5,
            fontSize: 21,
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            CupertinoButton(
              onPressed: () {},
              child: Text(
                'Home',
                style: textTheme.overline?.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
            CupertinoButton(
              onPressed: () {},
              child: Text(
                'Contacts',
                style: textTheme.overline?.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
            CupertinoButton(
              onPressed: () {},
              child: Text(
                'About',
                style: textTheme.overline?.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 200),
        SizedBox(
          width: 40,
          child: Divider(
            thickness: 1.0,
            color: theme.primaryColor,
          ),
        ),
        const SizedBox(height: 50),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            CupertinoButton(
              minSize: 0,
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Assets.icons.discordLogoBlack.svg(
                width: 22,
                height: 22,
              ),
            ),
            const SizedBox(width: 50),
            CupertinoButton(
              minSize: 0,
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Assets.icons.twitterLogoBlack.svg(
                width: 22,
                height: 22,
              ),
            ),
            const SizedBox(width: 50),
            CupertinoButton(
              minSize: 0,
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Assets.icons.github.gitHubMark64px.image(
                width: 22,
                height: 22,
              ),
            ),
          ],
        ),
        const SizedBox(height: 150),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: HomeScreen.maxWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Divider(
                thickness: 1.0,
                height: 1,
                color: theme.primaryColor.withOpacity(0.1),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  left: 10.0,
                  right: 10.0,
                ),
                child: Wrap(
                  spacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    Text(
                      'Copyright © ${DateTime.now().year} Anton Malofeev, Irina Veter',
                      style: textTheme.bodyText2?.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '|',
                      style: textTheme.bodyText2?.copyWith(
                        color: theme.primaryColor.withOpacity(0.2),
                      ),
                    ),
                    AppTextButton(
                      onTap: () {},
                      text: 'Privacy Policy',
                    ),
                    Text(
                      '|',
                      style: textTheme.bodyText2?.copyWith(
                        color: theme.primaryColor.withOpacity(0.2),
                      ),
                    ),
                    AppTextButton(
                      onTap: () {},
                      text: 'Terms of Use',
                    ),
                    Text(
                      '|',
                      style: textTheme.bodyText2?.copyWith(
                        color: theme.primaryColor.withOpacity(0.2),
                      ),
                    ),
                    AppTextButton(
                      onTap: () {},
                      text: 'Made with Flutter & ❤',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        const BottomSafeArea(),
      ],
    );
  }
}
