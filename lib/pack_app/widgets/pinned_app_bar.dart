part of pack_app;

class PinnedAppBar extends StatelessWidget {
  const PinnedAppBar({
    required this.actions,
    required this.topPadding,
    this.pinned,
    final Key? key,
  }) : super(key: key);
  final bool? pinned;
  final List<ActionItem> actions;
  final double topPadding;
  static const extent = CardButton.expandHeight * 2;
  @override
  Widget build(final BuildContext context) {
    final screenLayout = ScreenLayout.of(context);
    return SliverPersistentHeader(
      pinned: !(pinned == false),
      delegate: _PinnedAppBar(
        actions: actions,
        extent: extent,
        screenLayout: screenLayout,
      ),
    );
  }
}

class _PinnedAppBar extends SliverPersistentHeaderDelegate {
  _PinnedAppBar({
    required this.actions,
    required this.screenLayout,
    required this.extent,
  });
  final ScreenLayout screenLayout;
  final _cardHeightTween = IntTween(
    begin: CardButton.expandHeight.toInt(),
    end: CardButton.collapsedHeight.toInt(),
  );

  late final _cardFontSizeTween = IntTween(
    begin: screenLayout.small ? 16 : (screenLayout.medium ? 20 : 34),
    end: screenLayout.small ? 14 : 17,
  );

  late final _cardWidthTween = IntTween(
    begin: (screenLayout.small
            ? screenLayout.size.width / 4.2
            : math.max(150, screenLayout.size.width / 4.2))
        .toInt(),
    end: math
        .min(screenLayout.small ? 140 : 300, screenLayout.size.width / 4.5)
        .toInt(),
  );
  Color getCardTextColorTween({
    required final double value,
    required final Color begin,
    required final Color end,
  }) =>
      ColorTween(begin: begin, end: end).lerp(value)!;
  final List<ActionItem> actions;
  final double extent;
  static const actionsPadding = 8.0;
  @override
  Widget build(
    final BuildContext context,
    final double shrinkOffset,
    final bool overlapsContent,
  ) {
    final double tempVal = 50 * maxExtent / 100;
    final progress = shrinkOffset > tempVal ? 1.0 : shrinkOffset / tempVal;
    final cardHeight = _cardHeightTween.lerp(progress).toDouble();
    final cardFontSize = _cardFontSizeTween.lerp(progress).toDouble();
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final collapsed = cardFontSize == _cardFontSizeTween.end;
    final cardWidth = _cardWidthTween.lerp(progress).toDouble();
    Widget? actionsWidgets;
    Widget buildCard(final ActionItem e) {
      Color color = theme.primaryColor;
      if (e.color != null) {
        color = getCardTextColorTween(
          begin: e.color!,
          end: color,
          value: progress,
        );
      }
      return CardButton(
        onPressed: e.onTap,
        text: e.title,
        height: cardHeight,
        collapsed: collapsed,
        width: cardWidth,
        textStyle: textTheme.headline4?.copyWith(
          fontSize: cardFontSize,
          fontWeight: collapsed ? null : FontWeight.bold,
          color: color,
        ),
      );
    }

    Widget buildWrapped() => Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(actionsPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: actions.map(buildCard).toList(),
            ),
          ),
        );

    actionsWidgets = buildWrapped();

    return Stack(
      children: <Widget>[
        Container(
          // duration: const Duration(milliseconds: 100),
          height: shrinkOffset * 2,
          constraints: BoxConstraints(maxHeight: minExtent),
          color: Colors.white38,
          // color: Colors.red,
        ).blurred(blur: 16, colorOpacity: 0.2),
        actionsWidgets,
        const Align(child: Text('')),
      ],
    );
  }

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => CardButton.collapsedHeight + (actionsPadding * 2);

  @override
  bool shouldRebuild(final _PinnedAppBar oldDelegate) {
    return actions != oldDelegate.actions;
  }
}
