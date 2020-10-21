import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xsoulspace/components/CardComponent.dart';
import 'package:xsoulspace/constants/CustomColors.dart';

class ProjectScreen extends StatelessWidget {
  final bool isOpen;
  ProjectScreen({@required this.isOpen});
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            this.isOpen ? BorderRadius.circular(0) : BorderRadius.circular(43),
        gradient: LinearGradient(
            colors: [
              CustomColors.background,
              CustomColors.primary,
              CustomColors.primary,
              CustomColors.background
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.5, 0.86, 1]),
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
                children: [CardComponent()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
