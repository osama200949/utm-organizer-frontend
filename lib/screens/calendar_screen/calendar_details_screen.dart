import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/models/calendar_model/meeting_info.dart';
import 'package:utm_orgnization/models/provider/meeting_provider.dart';
import 'package:utm_orgnization/components/canvas/Canva_home.dart';
import 'package:utm_orgnization/screens/calendar_screen/widget/next_meeting.dart';
import 'package:utm_orgnization/services/meetings_service.dart';
// import 'package:utm_orgnization/screens/provider/meeting_data.dart';
import 'package:utm_orgnization/utils/constants.dart';

class CalenderDetail extends StatefulWidget {
  @override
  _CalenderDetailState createState() => _CalenderDetailState();
}

class _CalenderDetailState extends State<CalenderDetail> {
  bool status = true;

  bool toggle(bool newStatus) {
    if (newStatus == true)
      return false;
    else
      return true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MeetingProvider>(builder: (context, meetingData, _) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: null,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    // Todo: unsolved routing problem
                    Navigator.pop(context);
                    //  Navigator.popUntil(context, ModalRoute.withName('/calendar'));
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, '/calendar', (_) => false);
                  },
                  icon: Icon(FontAwesomeIcons.arrowLeft)),
              SvgPicture.asset('images/logos/logo-mini.svg'),
            ],
          ),
          actions: <Widget>[
            GestureDetector(
                onTap: () {
                  print('add meeting from json');
                },
                child: SvgPicture.asset('images/icons/icon-bell.svg')),
            FlatButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (_) => false);
              },
              child: SvgPicture.asset('images/icons/dashborad.svg'),
            ),
          ],
        ),
        body: Container(
          child: Stack(
            children: <Widget>[
              CanvasRed(),
              CanvasBlack(),
              CanvasOrange(),
              SafeArea(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 0,
                        bottom: 10,
                        right: 10,
                        left: 10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, bottom: 5),
                        child: SizedBox(
                          height: 100,
                          child: Row(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    width: 37,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '${meetingData.getEventToBeShown().dateClass.day}',
                                          style: TextStyle(
                                              color: Color(0xffF57B51),
                                              // color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: 'Gotham'),
                                        ),
                                        Text(
                                          '${meetingData.getEventToBeShown().dateClass.dayNumber}',
                                          style: TextStyle(
                                              color: Color(0xffF57B51),
                                              // color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: 'Gotham'),
                                        ),
                                        Text(
                                          '${meetingData.getEventToBeShown().dateClass.dayNumber}',
                                          style: TextStyle(
                                            color: Color(0xffF57B51),
                                            fontSize: 12,
                                            fontFamily: 'Gotham',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 45, left: 15),
                                child: Container(
                                  width: 200,
                                  height: 60,
                                  child: Text(
                                    '${meetingData.getEventToBeShown().meetingTitle}',
                                    style: TextStyle(
                                      color: Color(0xffFFE8D6),
                                      fontSize: 20,
                                      fontFamily: 'Gotham',
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(
                                flex: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: IconButton(
                                  onPressed: () {
                                    meetingData.setTaskToBeUpdated();
                                    Navigator.pushNamed(context, kUpdateTask);
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 45,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //Bottom Area
                    Expanded(
                      flex: 6,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 30, top: 20),
                                child: Text(
                                  'Friends',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'Muli',
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: Color(0xff534378),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: (whiteRed),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Color(0xffF6A100),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: (kRed_primary),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Color(0xff29A69C),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: (whiteBrown),
                                      child: Text(
                                        '+3',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontFamily: 'Gotham'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.only(
                                          left: 15.0, right: 0.0),
                                      leading: Icon(
                                        FontAwesomeIcons.solidClock,
                                        size: 30,
                                        color: Color(0xff535252),
                                      ),
                                      title: Text(
                                        '${meetingData.getEventToBeShown().dateClass.from} - ${meetingData.getEventToBeShown().dateClass.to}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff535252),
                                            fontFamily: 'Gotham',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.only(
                                          left: 15.0, right: 0.0),
                                      leading: Icon(
                                        FontAwesomeIcons.calendarAlt,
                                        size: 30,
                                        color: Color(0xff535252),
                                      ),
                                      title: Text(
                                        '${meetingData.getEventToBeShown().dateClass.completeDate}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff535252),
                                            fontFamily: 'Gotham',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.only(
                                          left: 15.0, right: 0.0),
                                      leading: Icon(
                                        Icons.location_on,
                                        size: 30,
                                        color: Color(0xff535252),
                                      ),
                                      title: Text(
                                        '${meetingData.getEventToBeShown().location}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff535252),
                                            fontFamily: 'Gotham',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    ListTile(
                                      dense: true,
                                      contentPadding: EdgeInsets.only(
                                        left: 15.0,
                                        right: 0.0,
                                      ),
                                      leading: Icon(
                                        FontAwesomeIcons.stickyNote,
                                        size: 30,
                                        color: Color(0xff535252),
                                      ),
                                      title: Text(
                                        '${meetingData.getEventToBeShown().description}',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, bottom: 5),
                                child: Text(
                                  'Next Meeting',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'Muli',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 150,
                                child: NextMeeting(),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          width: 50,
          decoration: BoxDecoration(
            color: offBrown,
            borderRadius: BorderRadius.only(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                width: 20,
                height: 25,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.timer,
                        size: 35,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Remind Me',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Gotham',
                            color: Color(0xff535252)),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        status = toggle(status);
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: BottomButton(status),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}

class BottomButton extends StatelessWidget {
  BottomButton(this.switchStatus);

  final switchStatus;

  @override
  Widget build(BuildContext context) {
    if (!switchStatus) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: offBrown,
            maxRadius: 10,
            minRadius: 5,
          )
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: whiteBrown,
            maxRadius: 10,
            minRadius: 5,
          ),
        ],
      );
    }
  }
}
