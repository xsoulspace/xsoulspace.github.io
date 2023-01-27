part of widgets;

typedef DialogBodyBuilder = Widget Function(double width);

class GlassDialog extends StatelessWidget {
  const GlassDialog({
    required this.bodyBuilder,
    required this.onClose,
    required this.footer,
    final Key? key,
  }) : super(key: key);
  final VoidCallback onClose;
  final Widget footer;
  final DialogBodyBuilder bodyBuilder;
  @override
  Widget build(final BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final maxWidth = screenSize.width - 20;
    final maxHeight = screenSize.height - 50;

    final double width = math.min(
      1200,
      maxWidth,
    );
    final double height = math.min(
      700,
      maxHeight,
    );
    return Material(
      color: Colors.white.withOpacity(0.8),
      child: Center(
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              const GlassContainer(),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: bodyBuilder(width),
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: CloseButton(
                  onPressed: onClose,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: footer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    final Key? key,
  }) : super(key: key);
  static final borderRadius = BorderRadius.circular(24);
  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: [
        Container().blurred(
          borderRadius: borderRadius,
          blur: 24,
          colorOpacity: 0.8,
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: borderRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.15),
                  spreadRadius: 70,
                  blurRadius: 140,
                  offset: const Offset(0, 40),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
