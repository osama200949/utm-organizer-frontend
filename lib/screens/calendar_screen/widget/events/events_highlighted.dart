import 'package:flutter/material.dart';
import 'package:utm_orgnization/screens/calendar_screen/widget/events/task_icon.dart';

class GetEventsHighlighted extends StatelessWidget {
  GetEventsHighlighted({
    @required this.listLength,
  });
  final listLength;

  @override
  Widget build(BuildContext context) {
    if (listLength <= 3) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < listLength; i++) TaskIcon(),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 5,
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
