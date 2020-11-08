import 'package:flutter/widgets.dart';
import 'package:xsoulspace/constants/CustomColors.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.primary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      padding: EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text('X Soul Space',
                style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
          ),
          Text(
            'We are community, who work on Open Source projects',
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Working to innovate or improve the world around',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ),
          Text(
            'Always learning new technologies, even it seems so far away from possible',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Working from home or any place that is cozy and soulful',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
