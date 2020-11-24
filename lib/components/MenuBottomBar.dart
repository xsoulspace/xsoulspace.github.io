import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xsoulspace/constants/CustomColors.dart';

class MenuBottomBar extends StatefulWidget {
  late final Function callbackOpenSideMenu;
  late final bool isMenuClosed;
  MenuBottomBar({
    required this.callbackOpenSideMenu,
    required this.isMenuClosed,
  });
  @override
  _MenuBottomBarState createState() => _MenuBottomBarState(
        callbackOpenSideMenu: this.callbackOpenSideMenu,
        isMenuClosed: this.isMenuClosed,
      );
}

final initialOpenMenuIcon =
    Icon(Icons.menu_open, color: CustomColors.background);

class _MenuBottomBarState extends State<MenuBottomBar>
    with SingleTickerProviderStateMixin {
  late final Function callbackOpenSideMenu;
  late final bool isMenuClosed;
  _MenuBottomBarState({
    required this.callbackOpenSideMenu,
    required this.isMenuClosed,
  });
  Icon _menuIcon = initialOpenMenuIcon;
  bool _menuClosed = true;
  setMenuIcon({required bool isClosed, double? width}) {
    setState(() {
      _menuIcon = isClosed
          ? Icon(Icons.menu,
              color: width != null && width > 600
                  ? CustomColors.primary
                  : CustomColors.background)
          : Icon(Icons.menu_open, color: CustomColors.background);
      _menuClosed = !isClosed;
    });
  }

  @override
  void initState() {
    super.initState();
    setMenuIcon(isClosed: isMenuClosed);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 78,
        padding: EdgeInsets.fromLTRB(16, 0, 16, 5),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                icon: AnimatedSwitcher(
                    duration: Duration(microseconds: 200), child: _menuIcon),
                onPressed: () {
                  callbackOpenSideMenu();
                  setMenuIcon(isClosed: _menuClosed, width: size.width);
                },
              )
            ]),
      ),
    );
  }
}
