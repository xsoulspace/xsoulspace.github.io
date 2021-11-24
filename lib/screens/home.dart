import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xsoulspace/gen/assets.gen.dart';
import 'package:xsoulspace/library/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({final Key? key}) : super(key: key);
  static const maxWidth = 1100.0;
  Widget buildAppBar(final BuildContext context) {
    final theme = Theme.of(context);
    final screenLayout = ScreenLayout.of(context);
    return Padding(
      padding: screenLayout.small
          ? const EdgeInsets.all(14)
          : const EdgeInsets.symmetric(horizontal: 14, vertical: 88),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: Row(
            children: [
              CupertinoButton(
                onPressed: () {},
                child: Text(
                  'XSoulSpace',
                  style: theme.textTheme.headline6?.copyWith(
                    color: theme.primaryColor,
                    letterSpacing: 4,
                  ),
                ),
              ),
              const Spacer(),
              CupertinoButton(
                onPressed: () {},
                child: const Text('Get in touch'),
              ),
              CupertinoButton(
                onPressed: () {},
                child: const Text('About'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final screenLayout = ScreenLayout.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        const TopSafeArea(),
                        buildAppBar(context),
                        const SizedBox(height: 40),
                        // TODO(arenukvern): use wrap + card for small screens
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            CardButton(
                              onPressed: () {},
                              text: 'Apps',
                            ),
                            CardButton(
                              text: 'Games',
                              onPressed: () {},
                            ),
                            CardButton(
                              text: 'Libraries',
                              onPressed: () {},
                            ),
                            CardButton(
                              text: 'Excel Addins',
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 430),
                      ],
                    ),
                  ),
                  GridView(
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          screenLayout.medium || screenLayout.small ? 1 : 2,
                      childAspectRatio: 3 / 4,
                      mainAxisExtent: 490,
                    ),
                    children: List<Widget>.generate(
                      1,
                      (final i) {
                        return Builder(
                          builder: (final context) {
                            return const ProjectPreviewCard();
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 200),
                  Text(
                    'XSoulSpace',
                    style: theme.textTheme.bodyText1?.copyWith(
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
                          style: theme.textTheme.overline?.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {},
                        child: Text(
                          'Contacts',
                          style: theme.textTheme.overline?.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {},
                        child: Text(
                          'About',
                          style: theme.textTheme.overline?.copyWith(
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
                        child: SvgPicture.asset(
                          Assets.icons.discordLogoBlack,
                          width: 22,
                          height: 22,
                        ),
                      ),
                      const SizedBox(width: 50),
                      CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: SvgPicture.asset(
                          Assets.icons.twitterLogoBlack,
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
                      maxWidth: maxWidth,
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
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Wrap(
                            spacing: 12,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: [
                              Text(
                                'Copyright © ${DateTime.now().year} Anton Malofeev, Irina Veter',
                                style: theme.textTheme.bodyText2?.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '|',
                                style: theme.textTheme.bodyText2?.copyWith(
                                  color: theme.primaryColor.withOpacity(0.2),
                                ),
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                minSize: 0,
                                onPressed: () {},
                                child: Text(
                                  'Privacy Policy',
                                  style: theme.textTheme.bodyText2?.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Text(
                                '|',
                                style: theme.textTheme.bodyText2?.copyWith(
                                  color: theme.primaryColor.withOpacity(0.2),
                                ),
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                minSize: 0,
                                onPressed: () {},
                                child: Text(
                                  'Terms of Use',
                                  style: theme.textTheme.bodyText2?.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Text(
                                '|',
                                style: theme.textTheme.bodyText2?.copyWith(
                                  color: theme.primaryColor.withOpacity(0.2),
                                ),
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                minSize: 0,
                                onPressed: () {},
                                child: Text(
                                  '',
                                  style: theme.textTheme.bodyText2?.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FrostContainer extends StatelessWidget {
  const FrostContainer({
    required final this.child,
    final Key? key,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(final BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.red),
      ),
      child: child,
    );
  }
}

class CardButton extends StatefulWidget {
  const CardButton({
    required final this.onPressed,
    required final this.text,
    final Key? key,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  @override
  _CardButtonState createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  bool hovered = false;
  @override
  Widget build(final BuildContext context) {
    double width;
    final screenLayout = ScreenLayout.of(context);
    if (screenLayout.small || screenLayout.medium) {
      width = 300;
    } else {
      width = MediaQuery.of(context).size.width / 5;
    }
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final child = Material(
      type: MaterialType.transparency,
      borderRadius: BorderRadius.circular(8),
      elevation: hovered ? 1 : 0,
      child: InkWell(
        onTap: widget.onPressed,
        child: SizedBox(
          width: width,
          height: 150,
          child: MouseRegion(
            onEnter: (final _) {
              hovered = true;
              setState(() {});
            },
            onExit: (final _) {
              hovered = false;
              setState(() {});
            },
            cursor: SystemMouseCursors.click,
            child: Center(
              child: Text(
                widget.text,
                style: textTheme.headline4,
              ),
            ),
          ),
        ),
      ),
    );

    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: hovered ? 1 : 0,
            child: Container().frosted(),
          ),
        ),
        child,
      ],
    );
  }
}
