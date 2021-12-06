part of pack_app;

class AppLoadingScreen extends StatelessWidget {
  const AppLoadingScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Container(
      color: AppColors.black,
      child: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(
                color: AppColors.primary2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
