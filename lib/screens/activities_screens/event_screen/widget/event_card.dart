import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Event_Card extends StatelessWidget {
  final event_name;
  final event_date;
  final event_location;
  final event_image;

  Event_Card(
      {this.event_name,
      this.event_date,
      this.event_location,
      this.event_image});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (contexr, constraints) {
      return Container(
        margin: EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.transparent,
        ),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(event_image),
                  fit: BoxFit.cover,
                ),
              ),
              height: 160,
              width: constraints.maxWidth,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0x73000000),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              height: 160,
              width: constraints.maxWidth,
            ),
            Container(
              margin: EdgeInsets.only(left: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.only(top: 9, right: 4),
                        decoration: BoxDecoration(
                          color: Color(0xFFD63447),
                          borderRadius: BorderRadius.all(
                            Radius.circular(500),
                          ),
                        ),
                        child: Icon(
                          FontAwesomeIcons.microphone,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        event_name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.solidCalendarAlt,
                        color: Color(0xFFF57B51),
                        size: 12.5,
                      ),
                      Text(
                        event_date,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.mapMarkerAlt,
                        color: Color(0xFFF57B51),
                        size: 12.5,
                      ),
                      Text(
                        event_location,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 11,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 15, 5),
                        color: Color(0xFFD63447),
                        child: Text(
                          "event",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
