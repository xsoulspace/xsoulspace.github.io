import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xsoulspace/constants/CustomColors.dart';
import 'package:xsoulspace/constants/PathFinder.dart';
import 'package:xsoulspace/entities/Project.dart';

class GridProjectButton extends StatelessWidget {
  final Project project;
  GridProjectButton({@required this.project});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 400,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: project.iconAssetPath != null,
                    child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            project.iconAssetPath,
                            fit: BoxFit.fitHeight,
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  AnimatedVerticalDivider(),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text(
                      project.name,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 15,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              PathFinder.iconGitHub,
                              fit: BoxFit.fitHeight,
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              project.description,
              softWrap: true,
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}

class AnimatedVerticalDivider extends StatefulWidget {
  @override
  _AnimatedVerticalDividerState createState() =>
      _AnimatedVerticalDividerState();
}

class _AnimatedVerticalDividerState extends State<AnimatedVerticalDivider>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  Duration _animationDuration = Duration(seconds: 2);
  AnimationController _controller;

// In initState()
  @override
  void initState() {
    super.initState();
    _animation = Tween(begin: 0.0, end: 3.14).animate(_controller);
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          alignment: Alignment.topCenter,
          height: 40,
          child: Transform(
            transform: Matrix4.translation(),
                      child: SizedBox(
              height: 5,
              child: VerticalDivider(
                color: CustomColors.primary,
                width: 1,
                thickness: 1,
              ),
            ),
          ),
        );
      },
    );
  }
}
