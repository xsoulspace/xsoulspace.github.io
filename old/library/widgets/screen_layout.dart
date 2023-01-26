part of widgets;

class ScreenLayout {
  ScreenLayout._({this.context, this.constraints})
      : assert(
          context != null || constraints != null,
          'context or constraints should be filled',
        );
  factory ScreenLayout.from(final BoxConstraints constraints) =>
      ScreenLayout._(constraints: constraints);
  factory ScreenLayout.of(final BuildContext context) =>
      ScreenLayout._(context: context);

  final BuildContext? context;
  final BoxConstraints? constraints;
  static const maxFullscreenPageWidth = 500.0;
  static const minFullscreenPageWidth = 450.0;
  static const maxSmallWidth = 700.0;
  static const maxMediumWidth = 1000.0;

  Size get size {
    if (constraints != null) {
      return Size(constraints!.maxWidth, constraints!.maxHeight);
    }
    return MediaQuery.of(context!).size;
  }

  //Large screen is any screen whose width is more than 1200 pixels
  bool get large => size.width > maxMediumWidth;

  //Medium screen is any screen whose width is less than 1200 pixels,
  //and more than 800 pixels
  bool get medium => size.width > maxSmallWidth && size.width <= maxMediumWidth;

  //Small screen is any screen whose width is less than 800 pixels
  bool get small => size.width <= maxSmallWidth;

  bool get lessThenLarge => size.width < maxMediumWidth;
  bool get moreThenSmall => size.width > maxSmallWidth;
}
