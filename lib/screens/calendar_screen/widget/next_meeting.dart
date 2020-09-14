import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/models/provider/meeting_data.dart';
import 'package:utm_orgnization/utils/constants.dart';

class NextMeeting extends StatefulWidget {
  @override
  _NextMeetingState createState() => _NextMeetingState();
}

class _NextMeetingState extends State<NextMeeting> {
  PageController controller;
  bool active;
  int eventIndex;
  @override
  void initState() {
    active = false;
    controller =
        PageController(initialPage: 1, viewportFraction: 0.5, keepPage: false);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MeetingData>(
      builder: (context, meetingData, _) {
        return PageView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: meetingData.currendDayInfoLength(),
            itemBuilder: (context, index) {
              if (meetingData.currendDayInfoLength() >= 2) {
                if (index == 1) {
                  active = true;
                } else {
                  active = false;
                }
                double opacityValue;
                active == true ? opacityValue = 1.0 : opacityValue = 0.8;
                return Opacity(
                  opacity: opacityValue,
                  child: Container(
                    padding: active == true
                        ? EdgeInsets.only(
                            top: 20, left: 10, right: 10, bottom: 20)
                        : EdgeInsets.only(
                            top: 30, left: 10, right: 10, bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        meetingData.setCurrentEvent = index;
                        Navigator.pushReplacementNamed(
                            context,
                            kCalenderDetailsRoute
                            );
                      },
                      child: Container(
                        width: 160,
                        height: 110,
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
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Gotham',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${meetingData.infoAtIndex(index).dateClass.from} - ${meetingData.infoAtIndex(index).dateClass.to}',
                                    style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 100,
                                    child: Stack(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor: Color(0xff29A69C),
                                          maxRadius: 10,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Positioned(
                                          left: 10,
                                          child: CircleAvatar(
                                            backgroundColor: Color(0xffF6A100),
                                            maxRadius: 10,
                                          ),
                                        ),
                                        Positioned(
                                          left: 20,
                                          child: CircleAvatar(
                                            backgroundColor: Color(0xffB5332B),
                                            maxRadius: 10,
                                          ),
                                        ),
                                        Positioned(
                                          left: 30,
                                          child: CircleAvatar(
                                            backgroundColor: Color(0xffF57B51),
                                            child: Text(
                                              '+3',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                            maxRadius: 10,
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
                                      topLeft: Radius.circular(30)),
                                ),
                                child: Center(
                                  child: Text(
                                    meetingData.infoAtIndex(index).labelCategory,
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
                  ),
                );
              } else {
                return Container();
              }
            });
      },
    );
  }
}
