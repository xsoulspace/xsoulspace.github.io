part of pack_app;

class PinnedAppBar extends StatelessWidget {
  const PinnedAppBar({
    required final this.actions,
    required final this.topPadding,
    final Key? key,
  }) : super(key: key);
  final List<ActionItem> actions;
  final double topPadding;
  static const extent = CardButton.expandHeight * 2;
  @override
  Widget build(final BuildContext context) {
    final screenLayout = ScreenLayout.of(context);
    return SliverPersistentHeader(
      pinned: true,
      delegate: _TransitionAppBarDelegate(
        actions: actions,
        extent: extent,
        screenLayout: screenLayout,
      ),
    );
  }
}

class _TransitionAppBarDelegate extends SliverPersistentHeaderDelegate {
  _TransitionAppBarDelegate({
    required final this.actions,
    required final this.screenLayout,
    required final this.extent,
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

  final List<ActionItem> actions;
  final double extent;
  static const actionsPadding = 8.0;
  @override
  Widget build(
    final BuildContext context,
    final double shrinkOffset,
    final bool overlapsContent,
  ) {
    final double _tempVal = 50 * maxExtent / 100;
    final _progress = shrinkOffset > _tempVal ? 1.0 : shrinkOffset / _tempVal;
    final _cardHeight = _cardHeightTween.lerp(_progress).toDouble();
    final _cardFontSize = _cardFontSizeTween.lerp(_progress).toDouble();
    final _theme = Theme.of(context);
    final _textTheme = _theme.textTheme;
    final collapsed = _cardFontSize == _cardFontSizeTween.end;
    final cardWidth = _cardWidthTween.lerp(_progress).toDouble();
    Widget? actionsWidgets;
    Widget buildCard(final ActionItem e) => CardButton(
          onPressed: e.onTap,
          text: e.title,
          height: _cardHeight,
          collapsed: collapsed,
          width: cardWidth,
          textStyle: _textTheme.headline4?.copyWith(
            fontSize: _cardFontSize,
            fontWeight: collapsed ? null : FontWeight.bold,
            color: _theme.primaryColor,
          ),
        );

    Widget buildWrapped() => Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(actionsPadding),
            child: Row(
              // alignment: WrapAlignment.center,
              // spacing: _cardSpacing,
              // runSpacing: _cardSpacing,
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
  bool shouldRebuild(final _TransitionAppBarDelegate oldDelegate) {
    return actions != oldDelegate.actions;
  }
}
