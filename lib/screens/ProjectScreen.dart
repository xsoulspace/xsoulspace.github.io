import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xsoulspace/constants/CustomColors.dart';

class ProjectScreen extends StatelessWidget {
  final bool isOpen;
  ProjectScreen({@required this.isOpen});
  @override
  Widget build(BuildContext context) {
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
      child: Column(
        children: [Row()],
      ),
    );
  }
}
