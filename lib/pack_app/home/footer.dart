import 'package:app_design_core/app_design_core.dart';
import 'package:flutter/material.dart';
import 'package:xsoulspace/gen/assets.gen.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    required this.onPrivacyPolicy,
    required this.onTermsOfUse,
    super.key,
  });
  final VoidCallback onPrivacyPolicy;
  final VoidCallback onTermsOfUse;
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final verticalDivider = SizedBox(
      height: 14,
      child: VerticalDivider(
        color: theme.colorScheme.surfaceTint.withOpacity(0.2),
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 200),
        const XSoulSpaceTitle(),
        const SizedBox(height: 24),
        SizedBox(
          width: 40,
          child: Divider(
            thickness: 1.0,
            height: 1,
            color: theme.colorScheme.surfaceTint.withOpacity(0.1),
          ),
        ),
        const SizedBox(height: 200),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            AppIconButton.url(
              icon: Assets.icons.discordLogoBlack.svg(
                width: 22,
                height: 22,
              ),
              url: kDiscordUrl,
            ),
            const SizedBox(width: 50),
            AppIconButton.url(
              icon: Assets.icons.twitterLogoBlack.svg(
                width: 22,
                height: 22,
              ),
              url: 'https://twitter.com/antmalofeev',
            ),
            const SizedBox(width: 50),
            AppIconButton.url(
              icon: Assets.icons.github.gitHubMark64px.image(
                width: 22,
                height: 22,
              ),
              url: 'https://github.com/xsoulspace',
            ),
          ],
        ),
        const SizedBox(height: 150),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1000,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Divider(
                thickness: 1.0,
                height: 1,
                color: theme.colorScheme.surfaceTint.withOpacity(0.1),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  left: 10.0,
                  right: 10.0,
                ),
                child: Wrap(
                  spacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'Copyright © 2021-${DateTime.now().year} Anton Malofeev (Arenukvern), Irina Veter',
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    verticalDivider,
                    AppTextButton(
                      onPressed: onPrivacyPolicy,
                      text: 'Privacy Policy',
                    ),
                    verticalDivider,
                    AppTextButton(
                      onPressed: onTermsOfUse,
                      text: 'Terms of Use',
                    ),
                    verticalDivider,
                    AppTextButton(
                      onPressed: () {},
                      text: 'Made with Flutter & ❤',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
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
                    SelectableText(
                      'The Apple and the Apple Logo are trademarks of Apple Inc., registered in the U.S. and other countries.',
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    SelectableText(
                      'Google Play and the Google Play logo are trademarks of Google LLC.',
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    SelectableText(
                      'The Snapcraft logo is licensed under CC BY-ND 2.0 UK, a registered trademark of Canonical Limited, 2018.',
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        const BottomSafeArea(),
      ],
    );
  }
}

class XSoulSpaceTitle extends StatelessWidget {
  const XSoulSpaceTitle({super.key});

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Text(
      'XSoulSpace',
      textAlign: TextAlign.center,
      style: textTheme.bodyLarge?.copyWith(
        letterSpacing: 5,
        fontSize: 21,
      ),
    );
  }
}
