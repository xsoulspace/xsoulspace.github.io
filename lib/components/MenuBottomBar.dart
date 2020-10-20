import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuBottomBar extends StatefulWidget {
  final Function callbackOpenSideMenu;
  final bool isMenuOpen;
  MenuBottomBar(
      {@required this.callbackOpenSideMenu, @required this.isMenuOpen});
  @override
  _MenuBottomBarState createState() => _MenuBottomBarState(
      callbackOpenSideMenu: this.callbackOpenSideMenu,
      isMenuOpen: this.isMenuOpen);
}

class _MenuBottomBarState extends State<MenuBottomBar> {
  final Function callbackOpenSideMenu;
  final bool isMenuOpen;
  _MenuBottomBarState(
      {@required this.callbackOpenSideMenu, @required this.isMenuOpen});

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
                icon: Icon(Icons.menu_open),
                onPressed: () {
                  callbackOpenSideMenu();
                },
              )
            ]),
      ),
    );
  }
}
