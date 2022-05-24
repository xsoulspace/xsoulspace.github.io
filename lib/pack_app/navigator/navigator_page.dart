part of pack_app;

class NavigatorPage extends MaterialPage {
  NavigatorPage({
    required final Widget child,
    required final AppNavigatorPopper popper,
    final LocalKey? key,
  }) : super(
          key: key,
          child: WillPopScope(
            onWillPop: popper.onWillPop,
            child: child,
          ),
        );
}
