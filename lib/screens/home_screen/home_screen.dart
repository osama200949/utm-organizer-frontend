import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/components/appbar_widget.dart';
import 'package:utm_orgnization/components/bottom_navigation.dart';
import 'package:utm_orgnization/components/canvas/Canva_home.dart';
import 'package:utm_orgnization/models/user.dart';
import 'package:utm_orgnization/screens/activities_screens/club_event_info.dart';
import 'package:utm_orgnization/screens/activities_screens/event_screen/event_stream.dart';
import 'package:utm_orgnization/screens/home_screen/widget/home/activity_widget.dart';
import 'package:utm_orgnization/screens/home_screen/widget/home/club_widget.dart';
import 'package:utm_orgnization/screens/home_screen/widget/home/event_widget.dart';
import 'package:utm_orgnization/screens/home_screen/widget/home/events.dart';
import 'package:utm_orgnization/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/data.dart';

class HomeScreen extends StatefulWidget with ChangeNotifier {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var userName = Provider.of<User>(context)?.displayName;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TopAppBar(
        appBar: AppBar(),
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
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Hello, $userName",
                              style: kPrimary_heading.copyWith(
                                fontSize: 26,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Explore the opportunities ! ",
                              style: kSecondary_heading_2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.75,
              maxChildSize: 0.885,
              minChildSize: 0.75,
              builder: (BuildContext context, myscrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: myscrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          // color: Colors.white,
                          width: MediaQuery.of(context).size.width,

                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.14,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Color(0xEFefefef),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, kScheduleRoute);
                                    },
                                    child: Container(
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            height: 110.00,
                                            width: 110.00,
                                            decoration: BoxDecoration(
                                              color: Color(0xffffffff),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(5.00, 5.00),
                                                  color: Color(0xff000000)
                                                      .withOpacity(0.06),
                                                  blurRadius: 15,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20.00),
                                            ),
                                          ),
                                          Container(
                                            height: 110.00,
                                            width: 110.00,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color(0xFFFFFEFE),
                                                  Color(0xFFdfdfdf)
                                                ],
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(-6.00, -6.00),
                                                  color: Color(0xffdfdfdf)
                                                      .withOpacity(0.30),
                                                  blurRadius: 15,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20.00),
                                            ),
                                          ),
                                          Positioned.fill(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                  'images/class_.svg',
                                                  color: Color(0xff3f3f44),
                                                  height: 50,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Timetable",
                                                  style: kSecondary_heading_2
                                                      .copyWith(
                                                    color: Color(0xff3f3f44),
                                                    fontSize: 16,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            height: 110.00,
                                            width: 110.00,
                                            decoration: BoxDecoration(
                                              color: Color(0xffffffff),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(5.00, 5.00),
                                                  color: Color(0xff000000)
                                                      .withOpacity(0.06),
                                                  blurRadius: 15,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20.00),
                                            ),
                                          ),
                                          Container(
                                            height: 110.00,
                                            width: 110.00,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color(0xFFFFFEFE),
                                                  Color(0xFFdfdfdf)
                                                ],
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(-6.00, -6.00),
                                                  color: Color(0xffdfdfdf)
                                                      .withOpacity(0.30),
                                                  blurRadius: 15,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20.00),
                                            ),
                                          ),
                                          Positioned.fill(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                  'images/icons/club.svg',
                                                  color: Color(0xff3f3f44),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Clubs ",
                                                  style: kSecondary_heading_2
                                                      .copyWith(
                                                          color: Color(
                                                              0xff3f3f44)),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            height: 110.00,
                                            width: 110.00,
                                            decoration: BoxDecoration(
                                              color: Color(0xffffffff),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(5.00, 5.00),
                                                  color: Color(0xff000000)
                                                      .withOpacity(0.06),
                                                  blurRadius: 15,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20.00),
                                            ),
                                          ),
                                          Container(
                                            height: 110.00,
                                            width: 110.00,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color(0xFFFFFEFE),
                                                  Color(0xFFdfdfdf)
                                                ],
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(-6.00, -6.00),
                                                  color: Color(0xffdfdfdf)
                                                      .withOpacity(0.30),
                                                  blurRadius: 15,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20.00),
                                            ),
                                          ),
                                          Positioned.fill(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                  'images/icons/school.svg',
                                                  color: Color(0xff3f3f44),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Events",
                                                  style: kSecondary_heading_2
                                                      .copyWith(
                                                    color: Color(0xff3f3f44),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 25, 0, 0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  // child: Text(
                                  //   "Latest Events",
                                  //   style: kPrimary_heading.copyWith(
                                  //       color: Colors.black),
                                  // ),
                                ),
                              ),
                              // EventsStream(
                              //   selectOngoingEvent: true,
                              // ),
                              // Club_widget(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
          overflow: Overflow.clip,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
