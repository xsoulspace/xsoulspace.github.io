import 'package:flutter/material.dart';
import 'package:xsoulspace/components/MenuDrawerComponent.dart';
import 'package:xsoulspace/screens/ProjectScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Duration _duration = Duration(milliseconds: 400);
  double _screenWidth, _screenHeight;
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
            child: ProjectScreen(),
            duration: _duration,
            top: 0.05 * _screenWidth,
            left: 0.5 * _screenHeight,
            bottom: 0.05 * _screenWidth,
            right: -1 * _screenHeight,
          )
        ],
      ),
    );
  }
}
