import 'package:flutter/material.dart';
import 'package:xsoulspace/constants/CustomColors.dart';

class CardOpened extends StatelessWidget {
  final String heroTag;
  final double height;
  CardOpened({@required this.heroTag, @required this.height});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Hero(
        tag: heroTag,
        child: Container(
          margin: EdgeInsets.all(32),
          height: height,
          color: CustomColors.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('hello there')],
          ),
        ),
      ),
    );
  }
}
