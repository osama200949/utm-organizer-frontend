import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utm_orgnization/components/appbar_widget.dart';
import 'package:utm_orgnization/components/canvas/Canvas_profile.dart';
import 'package:utm_orgnization/models/calendar_model/meeting_info.dart';
import 'package:utm_orgnization/models/provider/meeting_data.dart';
import 'package:utm_orgnization/models/provider/schedule_data.dart';
import 'package:utm_orgnization/models/user.dart';
import 'package:utm_orgnization/screens/calendar_screen/widget/meetings.dart';
import 'package:utm_orgnization/screens/calendar_screen/widget/timeline.dart';
import 'package:utm_orgnization/screens/calendar_screen/widget/top_calendar.dart';
import 'package:flutter/widgets.dart';
export 'package:font_awesome_flutter/src/fa_icon.dart';
export 'package:font_awesome_flutter/src/icon_data.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/services/meetings_service.dart';
import 'package:utm_orgnization/utils/constants.dart';

import '../../dependencies.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildScreen(context);
  }

  Scaffold _buildScreen(BuildContext context) {
    final meetingData = Provider.of<MeetingData>(context, listen: false); //? copy
    final scheduleData = Provider.of<ScheduleData>(context);//? copy

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TopAppBar(
        isCalendar: true,
        appBar: AppBar(),
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0.0,
        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(
        //         Icons.delete_sweep,
        //         size: 35,
        //       ),
        //       onPressed: () {
        //         meetingData.clearTimetable(); //? copy
        //         scheduleData.clearAll(); //? copy
        //       },
        //     ),
        //   ],
        // ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            CanvasBlack(),
            SafeArea(
              child: Column(
                children: <Widget>[
                  TopCalendar(),
                  //Bottom Area
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 30),
                              child: Text(
                                'Meetings',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 15),
                              child: SizedBox(
                                height: 130,
                                child: Meetings(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 10),
                              child: Text(
                                'Timeline',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 5, bottom: 10, right: 10),
                              child: SizedBox(
                                child: TimeLine(),
                              ),
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
    );
  }

  Scaffold _fetchingDataInProgress() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching calendar data'),
          ],
        ),
      ),
    );
  }
}
