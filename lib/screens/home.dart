import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xsoulspace/gen/assets.gen.dart';
import 'package:xsoulspace/library/widgets/widgets.dart';

class ItemAction {
  ItemAction({
    required final this.title,
    required final this.onTap,
  });
  final String title;
  final VoidCallback onTap;
}

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
            child: CustomScrollView(
              slivers: [
                ...[
                  const TopSafeArea(),
                  buildAppBar(context),
                  const SizedBox(height: 40),
                ].map((final e) => SliverToBoxAdapter(child: e)),
                // TODO(arenukvern): use wrap + card for small screens
                TransitionAppBar(
                  actions: [
                    ItemAction(
                      onTap: () {},
                      title: 'Apps',
                    ),
                    ItemAction(
                      onTap: () {},
                      title: 'Games',
                    ),
                    ItemAction(
                      onTap: () {},
                      title: 'Libraries',
                    ),
                    ItemAction(
                      onTap: () {},
                      title: 'Excel Addins',
                    ),
                  ],
                ),

                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 430),
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
                        textAlign: TextAlign.center,
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
                                    style: theme.textTheme.bodyText2?.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '|',
                                    style: theme.textTheme.bodyText2?.copyWith(
                                      color:
                                          theme.primaryColor.withOpacity(0.2),
                                    ),
                                  ),
                                  CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    minSize: 0,
                                    onPressed: () {},
                                    child: Text(
                                      'Privacy Policy',
                                      style:
                                          theme.textTheme.bodyText2?.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '|',
                                    style: theme.textTheme.bodyText2?.copyWith(
                                      color:
                                          theme.primaryColor.withOpacity(0.2),
                                    ),
                                  ),
                                  CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    minSize: 0,
                                    onPressed: () {},
                                    child: Text(
                                      'Terms of Use',
                                      style:
                                          theme.textTheme.bodyText2?.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '|',
                                    style: theme.textTheme.bodyText2?.copyWith(
                                      color:
                                          theme.primaryColor.withOpacity(0.2),
                                    ),
                                  ),
                                  CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    minSize: 0,
                                    onPressed: () {},
                                    child: Text(
                                      'Made with Flutter & ❤',
                                      style:
                                          theme.textTheme.bodyText2?.copyWith(
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
              ],
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
    final this.height = expandHeight,
    final this.textStyle,
    final Key? key,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final double height;
  static const expandHeight = 150.0;
  static const collapsedHeight = 55.0;
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
          height: widget.height,
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
                textAlign: TextAlign.center,
                style: widget.textStyle ?? textTheme.headline4,
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

// class TransitionAppBar extends SliverPersistentHeader {
//   TransitionAppBar({
//     required final List<ItemAction> actions,
//     final double extent = 250,
//     final Key? key,
//   }) : super(
//           key: key,
//           delegate: _TransitionAppBarDelegate(
//             actions: actions,
//             extent: extent > 200 ? extent : 200,
//           ),
//           pinned: true,
//         );
// }
class TransitionAppBar extends StatelessWidget {
  const TransitionAppBar({
    required final this.actions,
    final this.extent = CardButton.expandHeight * 2,
    final Key? key,
  }) : super(key: key);
  final List<ItemAction> actions;
  final double extent;

  @override
  Widget build(final BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _TransitionAppBarDelegate(
        actions: actions,
        extent: extent,
      ),
    );
  }
}

class _TransitionAppBarDelegate extends SliverPersistentHeaderDelegate {
  _TransitionAppBarDelegate({
    required final this.actions,
    required final this.extent,
  });
  final _cardHeightTween = IntTween(
    begin: CardButton.expandHeight.toInt(),
    end: CardButton.collapsedHeight.toInt(),
  );
  final _cardSpacingTween = IntTween(
    begin: 0,
    end: 10,
  );

  final _cardFontSizeTween = IntTween(
    begin: 34,
    end: 17,
  );

  final List<ItemAction> actions;
  final double extent;

  @override
  Widget build(
    final BuildContext context,
    final double shrinkOffset,
    final bool overlapsContent,
  ) {
    final double _tempVal = 34 * maxExtent / 100;
    final _progress = shrinkOffset > _tempVal ? 1.0 : shrinkOffset / _tempVal;
    final _cardHeight = _cardHeightTween.lerp(_progress).toDouble();
    final _cardSpacing = _cardSpacingTween.lerp(_progress).toDouble();
    final _cardFontSize = _cardFontSizeTween.lerp(_progress).toDouble();
    final _theme = Theme.of(context);
    final _textTheme = _theme.textTheme;

    return Stack(
      children: <Widget>[
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: shrinkOffset * 2,
          constraints: BoxConstraints(maxHeight: minExtent),
          color: Colors.white38,
        ).blurred(blur: 16, colorOpacity: 0.2),
        Positioned.fill(
          child: SizedBox(
            height: CardButton.expandHeight,
            width: CardButton.expandHeight * 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: _cardSpacing,
                runSpacing: _cardSpacing,
                children: actions
                    .map(
                      (final e) => CardButton(
                        onPressed: e.onTap,
                        text: e.title,
                        height: _cardHeight,
                        textStyle: _textTheme.headline4?.copyWith(
                          fontSize: _cardFontSize,
                          fontWeight: _cardFontSize == _cardFontSizeTween.end
                              ? null
                              : FontWeight.bold,
                          color: _theme.primaryColor,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        Align(
          child: const Text(''),
        ),
      ],
    );
  }

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => (maxExtent * 24) / 100;

  @override
  bool shouldRebuild(final _TransitionAppBarDelegate oldDelegate) {
    return actions != oldDelegate.actions;
  }
}
