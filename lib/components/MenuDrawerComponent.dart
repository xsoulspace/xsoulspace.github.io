import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xsoulspace/constants/CustomColors.dart';

TextStyle _textStyle = TextStyle(color: CustomColors.primary);

class MenuDrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.background,
      child: Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 16.0),
          child: Material(
            color: Colors.transparent,
            child: Stack(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(Icons.table_rows),
                        title: Text(
                          'Excel Addins',
                          style: _textStyle,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.apps),
                        title: Text(
                          'Applications',
                          style: _textStyle,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.people),
                        title: Text(
                          'Team',
                          style: _textStyle,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.info),
                        title: Text(
                          'About',
                          style: _textStyle,
                        ),
                        onTap: () {},
                      )
                    ],
                  )),
            ]),
          )),
    );
  }
}
