part of pack_app;

class CardButton extends StatefulWidget {
  const CardButton({
    required final this.onPressed,
    required final this.text,
    final this.height = expandHeight,
    final this.textStyle,
    final this.color,
    final this.collapsed,
    final this.width,
    final Key? key,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final double? width;
  final double height;
  final Color? color;
  final bool? collapsed;
  static const expandHeight = 150.0;
  static const collapsedHeight = 55.0;
  @override
  _CardButtonState createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  bool hovered = false;
  @override
  Widget build(final BuildContext context) {
    double? width = widget.width;
    final screenLayout = ScreenLayout.of(context);
    if (widget.width == null) {
      if (screenLayout.small || screenLayout.medium) {
        width = 300;
      } else {
        width = MediaQuery.of(context).size.width / 5;
      }
    }
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final child = Material(
      type: MaterialType.transparency,
      // color: widget.color,
      borderRadius: BorderRadius.circular(8),
      // elevation: hovered ? 1 : 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
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
        // Positioned.fill(
        //   child: AnimatedOpacity(
        //     duration: const Duration(milliseconds: 400),
        //     opacity: hovered ? 1 : 0,
        //     child: Container().frosted(),
        //   ),
        // ),
        child,
      ],
    );
  }
}
