import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xsoulspace/constants/CustomColors.dart';

class CardComponent extends StatefulWidget {
  @override
  _CardComponentState createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  final double iniCardHeight = 200;
  final double iniCardWidth = 400;

  double _cardHeight = 200;
  double _cardWidth = 400;

  _cardToFullSize(Size size) {
    setState(() {
      // _cardHeight = size.height;
      // _cardWidth = size.width;
      Navigator.push(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 600),
              reverseTransitionDuration: Duration(milliseconds: 600),
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondAnimation) {
                return SafeArea(
                    child: Scaffold(
                        backgroundColor: Colors.transparent,
                        appBar: AppBar(),
                        body: Hero(
                          tag: _heroTag,
                          child: Material(
                            child: Container(
                              padding: EdgeInsets.all(32),
                              // width: size.width,
                              // height: size.height,
                              // The blue background emphasizes that it's a new route.
                              color: CustomColors.primary,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [titleWidget()],
                              ),
                            ),
                          ),
                        )));
              }));
    });
  }

  _cardToIniSize() {
    setState(() {
      // _cardHeight = iniCardHeight;
      // _cardWidth = iniCardWidth;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  final double _sensitivity = 3;
  final String _heroTag = 'card';
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Align(
        alignment: Alignment.centerLeft,
        child: Hero(
          tag: _heroTag,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _cardToFullSize(_size);
              });
            },
            onHorizontalDragUpdate: (details) {
              if (details.delta.dx > _sensitivity) {
                // Right Swipe
              } else if (details.delta.dx < -_sensitivity) {
                // Left Swipe
              }
            },
            onVerticalDragUpdate: (details) {
              if (details.delta.dy < -_sensitivity) {
                // Up Swipe
                _cardToFullSize(_size);
              } else if (details.delta.dy > _sensitivity) {
                // Down Swipe
                _cardToIniSize();
              }
            },
            child: Container(
                width: _cardWidth,
                height: _cardHeight,
                // duration: Duration(milliseconds: 400),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(43),
                    color: CustomColors.primary,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 17,
                          color: CustomColors.background.withOpacity(0.09),
                          offset: Offset(-12, -12))
                    ]),
                child: Padding(
                    padding: EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [titleWidget()],
                    ))),
          ),
        ));
  }

  Widget titleWidget() {
    return Center(
      child: Text(
        'sheets-manager-excel-addin-super-long-text',
        style: TextStyle(fontSize: 20, color: CustomColors.background),
        textAlign: TextAlign.center,
      ),
    );
  }
}
