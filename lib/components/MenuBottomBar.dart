import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xsoulspace/constants/CustomColors.dart';

class MenuBottomBar extends StatelessWidget {
  final Function callbackOpenSideMenu;
  final bool isMenuClosed;
  MenuBottomBar({
    required this.callbackOpenSideMenu,
    required this.isMenuClosed,
  });

  Icon menuIcon({double? width}) {
    return isMenuClosed
        ? Icon(Icons.menu,
            color: width != null && width > 600
                ? CustomColors.primary
                : CustomColors.background)
        : Icon(Icons.menu_open, color: CustomColors.background);
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
                    duration: Duration(microseconds: 200),
                    child: menuIcon(width: size.width)),
                onPressed: () {
                  callbackOpenSideMenu();
                },
              )
            ]),
      ),
    );
  }
}
