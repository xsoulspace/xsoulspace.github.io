import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xsoulspace/components/GitHubIcon.dart';
import 'package:xsoulspace/constants/CustomColors.dart';

class TeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.primary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      padding: EdgeInsets.all(10),
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Our team',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ListTile(
                leading: CircleAvatar(),
                title: Text('Anton Malofeev'),
                trailing: GitHubIcon(
                  gitHubLink: 'https://github.com/arenukvern',
                )),
            ListTile(
                leading: CircleAvatar(),
                title: Text('Mihail Melnikov'),
                trailing: GitHubIcon(
                  gitHubLink: 'https://github.com/mixev',
                )),
          ],
        ),
      ),
    );
  }
}
