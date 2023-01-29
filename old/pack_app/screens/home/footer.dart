import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xsoulspace/gen/assets.gen.dart';
import 'package:xsoulspace/library/widgets/widgets.dart';
import 'package:xsoulspace/pack_app/screens/home/home_screen.dart';
import 'package:xsoulspace/utils/utils.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    required this.onHome,
    required this.onContacts,
    required this.onAbout,
    required this.onPrivacyPolicy,
    required this.onTermsOfUse,
    final Key? key,
  }) : super(key: key);
  final VoidCallback onHome;
  final VoidCallback onContacts;
  final VoidCallback onAbout;
  final VoidCallback onPrivacyPolicy;
  final VoidCallback onTermsOfUse;
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
              onPressed: onHome,
              child: Text(
                'Home',
                style: textTheme.overline?.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
            CupertinoButton(
              onPressed: onContacts,
              child: Text(
                'Contacts',
                style: textTheme.overline?.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
            CupertinoButton(
              onPressed: onAbout,
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
            const DiscordButton(),
            const SizedBox(width: 50),
            CupertinoButton(
              minSize: 0,
              padding: EdgeInsets.zero,
              onPressed: () {
                launchURL('https://twitter.com/antmalofeev');
              },
              child: Assets.icons.twitterLogoBlack.svg(
                width: 22,
                height: 22,
              ),
            ),
            const SizedBox(width: 50),
            CupertinoButton(
              minSize: 0,
              padding: EdgeInsets.zero,
              onPressed: () {
                launchURL('https://github.com/xsoulspace');
              },
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
                      'Copyright © 2021-${DateTime.now().year} Anton Malofeev (Arenukvern), Irina Veter',
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
                      onTap: onPrivacyPolicy,
                      text: 'Privacy Policy',
                    ),
                    Text(
                      '|',
                      style: textTheme.bodyText2?.copyWith(
                        color: theme.primaryColor.withOpacity(0.2),
                      ),
                    ),
                    AppTextButton(
                      onTap: onTermsOfUse,
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
                      style: textTheme.bodyText2?.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    SelectableText(
                      'Google Play and the Google Play logo are trademarks of Google LLC.',
                      style: textTheme.bodyText2?.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    SelectableText(
                      'The Snapcraft logo is licensed under CC BY-ND 2.0 UK, a registered trademark of Canonical Limited, 2018.',
                      style: textTheme.bodyText2?.copyWith(
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
