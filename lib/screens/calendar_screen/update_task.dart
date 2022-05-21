import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/main.dart';
import 'package:utm_orgnization/models/calendar_model/meeting_info.dart';
import 'package:utm_orgnization/models/provider/meeting_provider.dart';
import 'package:utm_orgnization/screens/calendar_screen/widget/add_task_colors.dart';
import 'package:utm_orgnization/screens/calendar_screen/widget/add_task_date.dart';
import 'package:utm_orgnization/screens/calendar_screen/widget/add_task_time.dart';
import 'package:utm_orgnization/screens/calendar_screen/widget/category_list.dart';
import 'package:utm_orgnization/screens/_archived/task_date.dart';
import 'package:utm_orgnization/screens/_archived/task_time.dart';
import 'package:utm_orgnization/services/meetings_service.dart';
import 'package:utm_orgnization/utils/constants.dart';

class UpdateTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MeetingProvider>(
      builder: (context, meetingData, child) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: Scaffold(
            //  extendBody: true,
            // resizeToAvoidBottomPadding: true,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  // left: 20,
                  top: 50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Title',
                                style: TextStyle(fontSize: 20),
                              ),
                              //! Delete Task
                              GestureDetector(
                                onTap: () {
                                  meetingData.deleteCurrentEventToBeShown();
                                  Navigator.pushNamed(context, kCalenderRoute);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    'Delete task',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.red),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 20, right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: meetingData
                                    .getEventToBeShown()
                                    .meetingTitle,
                              ),
                              onChanged: (title) {
                                meetingData.tempTask.meetingTitle = title;
                              },
                            ),
                          ),

                          //! Time From To
                          // TaskTime(meetingData),
                          AddTaskTime(meetingData),

                          SizedBox(
                            height: 20,
                          ),

                          //! Date
                          // TaskDate(meetingData),
                          AddTaskDate(meetingData),

                          SizedBox(
                            height: 20,
                          ),

                          //! Location
                          Row(
                            children: <Widget>[
                              Text(
                                'Location',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: meetingData
                                        .getEventToBeShown()
                                        .location,
                                  ),
                                  onChanged: (location) {
                                    meetingData.tempTask.location = location;
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              )
                            ],
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          Text(
                            'Description',
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 30, right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: meetingData.tempTask.description,
                              ),
                              onChanged: (decription) {
                                meetingData.tempTask.description = decription;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Category',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: CategoryList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'BG Color',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: BackGroundColorList(meetingData),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                meetingData.resetTask();
                              },
                              child: Container(
                                height: 60,
                                child: Center(
                                    child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontFamily: 'Muli'),
                                )),
                                decoration: BoxDecoration(
                                  color: Color(0xffA0A0A0),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 6,
                            child: GestureDetector(
                              onTap: () {
                                meetingData.updateTask();
                                Navigator.pushNamedAndRemoveUntil(
                                    context, kCalenderRoute, (route) => false);
                              },
                              child: Container(
                                height: 60,
                                // width: 180,
                                child: Center(
                                    child: Text(
                                  'Update',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontFamily: 'Muli'),
                                )),
                                decoration: BoxDecoration(
                                  color: Color(0xffD63447),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
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
            ),
          ),
        );
      },
    );
  }
}
