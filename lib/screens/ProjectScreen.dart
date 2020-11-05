import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xsoulspace/constants/CustomColors.dart';

class ProjectScreen extends StatelessWidget {
  final bool isOpen;
  ProjectScreen({@required this.isOpen});
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              this.isOpen
                  ? CustomColors.background.withOpacity(0.4)
                  : CustomColors.background,
              this.isOpen
                  ? CustomColors.background.withOpacity(0.4)
                  : CustomColors.primary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 1]),
        borderRadius:
            this.isOpen ? BorderRadius.circular(24) : BorderRadius.circular(0),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10, bottom: 0.14 * _size.height),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 200,
              child: PageView(
                controller: PageController(viewportFraction: 0.8),
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
