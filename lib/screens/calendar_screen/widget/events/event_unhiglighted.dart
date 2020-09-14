import 'package:flutter/material.dart';
import 'package:utm_orgnization/screens/calendar_screen/widget/events/task_icon.dart';

class GetEvents extends StatelessWidget {
  GetEvents({
    @required this.listLength,
  });

  final listLength;

  @override
  Widget build(BuildContext context) {
    if (listLength <= 1) {
      return Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 18,
            ),
            for (int i = 0; i < listLength; i++) TaskIcon(),
          ],
        ),
      );
    } else if (listLength <= 2) {
      return Padding(
        padding: const EdgeInsets.only(left: 2.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 18,
            ),
            for (int i = 0; i < listLength; i++) TaskIcon(),
          ],
        ),
      );
    } else if (listLength <= 3) {
      return Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 18,
            ),
            for (int i = 0; i < listLength; i++) TaskIcon(),
          ],
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          for (int i = 0; i < 3; i++) TaskIcon(),
          Text(
            '+$listLength',
            style: TextStyle(
                color: Colors.white,
                fontSize: 8,
                fontFamily: 'Gotham',
                fontWeight: FontWeight.bold),
          ),
        ],
      );
    }
  }
}
