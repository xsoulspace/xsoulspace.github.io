import 'package:xsoulspace/common_imports.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
  });
  @override
  Widget build(final BuildContext context) => Directionality(
        // TODO(arenukvern): replace with default device textDirection
        textDirection: TextDirection.ltr,
        child: ColoredBox(
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator.adaptive(
                  valueColor:
                      AlwaysStoppedAnimation(BrandColorSchemes.light.primary),
                ),
                const SizedBox(height: 5),
                const Text('Loading...'),
              ],
            ),
          ),
        ),
      );
}
