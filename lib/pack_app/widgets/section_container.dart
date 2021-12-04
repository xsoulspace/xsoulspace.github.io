part of pack_app;

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    required final this.height,
    final Key? key,
  }) : super(key: key);
  final double height;
  @override
  Widget build(final BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(),
    );
  }
}
