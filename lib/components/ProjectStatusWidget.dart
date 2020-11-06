import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProjectStatusWidget extends StatelessWidget {
  final Function() onPressed;
  final Color color;
  final bool enabled;
  ProjectStatusWidget({this.onPressed, this.color, this.enabled = true});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: SizedBox(
        width: 20,
        height: 20,
        child: FlatButton(
          color: enabled ? color : color.withOpacity(0.3),
          child: Container(),
          onPressed: enabled ? onPressed : () {},
          shape: CircleBorder(),
        ),
      ),
    );
  }
}
