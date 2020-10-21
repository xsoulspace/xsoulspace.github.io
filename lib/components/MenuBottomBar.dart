import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuBottomBar extends StatefulWidget {
  final Function callbackOpenSideMenu;
  final bool isMenuClosed;
  MenuBottomBar(
      {@required this.callbackOpenSideMenu, @required this.isMenuClosed});
  @override
  _MenuBottomBarState createState() => _MenuBottomBarState(
      callbackOpenSideMenu: this.callbackOpenSideMenu,
      isMenuClosed: this.isMenuClosed);
}

class _MenuBottomBarState extends State<MenuBottomBar>
    with SingleTickerProviderStateMixin {
  final Function callbackOpenSideMenu;
  final bool isMenuClosed;
  _MenuBottomBarState(
      {@required this.callbackOpenSideMenu, @required this.isMenuClosed});
  Icon _menuIcon;
  bool _menuClosed;
  setMenuIcon(bool isClosed) {
    setState(() {
      _menuIcon = isClosed ? Icon(Icons.menu) : Icon(Icons.menu_open);
      _menuClosed = !isClosed;
    });
  }

  @override
  void initState() {
    setMenuIcon(isMenuClosed);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 78,
        padding: EdgeInsets.fromLTRB(16, 0, 16, 5),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                icon: AnimatedSwitcher(
                    duration: Duration(microseconds: 200), child: _menuIcon),
                onPressed: () {
                  callbackOpenSideMenu();
                  setMenuIcon(_menuClosed);
                },
              )
            ]),
      ),
    );
  }
}
