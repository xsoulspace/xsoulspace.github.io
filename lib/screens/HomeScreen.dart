import 'package:flutter/material.dart';
import 'package:xsoulspace/components/MenuBottomBar.dart';
import 'package:xsoulspace/components/MenuDrawerComponent.dart';
import 'package:xsoulspace/screens/ProjectScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Duration _duration = Duration(milliseconds: 200);
  bool _isClosed = true;
  _callbackOpenSideMenu() {
    setState(() {
      _isClosed = !_isClosed;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    double _screenWidth = _screenSize.width;
    return Scaffold(
      body: Stack(
        children: [
          MenuDrawerComponent(),
          AnimatedPositioned(
            curve: Curves.easeOutCirc,
            child: ProjectScreen(isOpen: !_isClosed),
            duration: _duration,
            top: _isClosed ? 0 : 10,
            left: _isClosed
                ? 0
                : _screenWidth < 300
                    ? _screenWidth - 40
                    : 300,
            bottom: 0,
            right: _isClosed ? 0 : (-1 * _screenWidth) - 10,
          ),
          AnimatedPositioned(
            bottom: 0,
            right: 0,
            left: _screenWidth < 350
                ? _isClosed
                    ? _screenWidth * 0.6
                    : _screenWidth * 0.65
                : _isClosed
                    ? 0
                    : 250,
            duration: _duration,
            child: MenuBottomBar(
                callbackOpenSideMenu: _callbackOpenSideMenu,
                isMenuClosed: _isClosed),
          )
        ],
      ),
    );
  }
}
