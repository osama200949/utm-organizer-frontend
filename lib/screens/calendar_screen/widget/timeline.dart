import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/models/provider/meeting_provider.dart';
import 'package:utm_orgnization/utils/constants.dart';

class TimeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> timeCard = [];

    for (int i = 0;
        i < Provider.of<MeetingProvider>(context).currendDayInfoLength();
        i++) {
      timeCard.add(TimlineCards(index: i));
    }

    return Column(
      children: timeCard,
    );
  }
}

class TimlineCards extends StatelessWidget {
  var index;
  TimlineCards({
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MeetingProvider>(
      builder: (context, meetingData, _) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: GestureDetector(
            onTap: () {
              meetingData.setCurrentEvent = index; //! important
              Navigator.pushNamed(
                context,
                '/calender_detail',
              );
            },
            child: Dismissible(
              onDismissed: (direction) {
                meetingData.setCurrentEvent = index;
                // left to right
                if (direction.index == 3) {
                  meetingData.deleteCurrentEventToBeShown();
                  meetingData.resetTask();
                }
                // right to left
                if (direction.index == 2) {
                  meetingData.setTaskToBeUpdated();
                  Navigator.pushNamed(context, kUpdateTask);
                }
              },
              background: Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.delete,
                        size: 40,
                        color: Colors.white,
                      )),
                ),
              ),
              secondaryBackground: Container(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.edit,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              key: UniqueKey(),
              child: Card(
                color: Colors.white,
                elevation: 0.0,
                child: Row(
                  children: <Widget>[
                    Text(
                      '${meetingData.infoAtIndex(index).dateClass.from}',
                      style: kPrimary_heading.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        // width: 285,
                        height: 120,
                        color: meetingData.infoAtIndex(index).backgroundColor,
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    meetingData.infoAtIndex(index).meetingTitle,
                                    overflow: TextOverflow.ellipsis,
                                    style: kPrimary_heading_3.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.solidClock,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${meetingData.infoAtIndex(index).dateClass.from} - ${meetingData.infoAtIndex(index).dateClass.to}',
                                          style: kPrimary_heading.copyWith(
                                            color: Color(0xff535252),
                                            fontWeight: FontWeight.w900,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          meetingData
                                              .infoAtIndex(index)
                                              .location,
                                          style: kPrimary_heading.copyWith(
                                            color: Color(0xff535252),
                                            fontWeight: FontWeight.w900,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              right: 0.0,
                              child: Container(
                                width: 60,
                                height: 30,
                                decoration: BoxDecoration(
                                  color:
                                      meetingData.infoAtIndex(index).lableColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    meetingData
                                        .infoAtIndex(index)
                                        .labelCategory,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
