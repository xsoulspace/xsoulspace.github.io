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
  double _screenWidth, _screenHeight;
  bool _isClosed = false;
  _callbackOpenSideMenu() {
    setState(() {
      _isClosed = !_isClosed;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    _screenWidth = _screenSize.width;
    _screenHeight = _screenSize.height;
    return Scaffold(
      body: Stack(
        children: [
          MenuDrawerComponent(),
          AnimatedPositioned(
            child: ProjectScreen(isOpen: _isClosed),
            duration: _duration,
            top: _isClosed ? 0 : 0.05 * _screenWidth,
            left: _isClosed ? 0 : 0.5 * _screenHeight,
            bottom: 0,
            right: _isClosed ? 0 : -1 * _screenHeight,
          ),
          AnimatedPositioned(
            bottom: 0,
            left: _isClosed ? 0 : 0.5 * _screenHeight,
            right: 0,
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
