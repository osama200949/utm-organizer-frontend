import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/models/provider/meeting_provider.dart';
import 'package:utm_orgnization/screens/calendar_screen/widget/add_task_colors.dart';
import 'package:utm_orgnization/screens/calendar_screen/widget/add_task_date.dart';
import 'package:utm_orgnization/screens/calendar_screen/widget/add_task_time.dart';
import 'package:utm_orgnization/screens/calendar_screen/widget/category_list.dart';
import 'package:utm_orgnization/screens/_archived/task_date.dart';
import 'package:utm_orgnization/screens/_archived/task_time.dart';

import '../../utils/constants.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MeetingProvider>(
      builder: (context, meetingData, child) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: Scaffold(
            backgroundColor: kRed_primary,
            //  extendBody: true,
            resizeToAvoidBottomPadding: true,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      color: kRed_primary,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Title",
                                  style: kPrimary_heading.copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                  child: TextField(
                                    onChanged: (task) {
                                      // meetingData.taskTitle = task;
                                      meetingData.tempTask.meetingTitle = task;
                                    },
                                    style: kPrimary_heading.copyWith(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                            left: 15,
                                            bottom: 11,
                                            top: 11,
                                            right: 15),
                                        hintText: "Task Title.."),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AddTaskDate(meetingData),
                                    AddTaskTime(meetingData),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      size: 30,
                                    ),
                                    Text(
                                      'Location',
                                      style: kPrimary_heading.copyWith(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Enter the Location',
                                        ),
                                        onChanged: (location) {
                                          meetingData.tempTask.location =
                                              location;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.stickyNote,
                                          size: 25,
                                          color: Color(0xff535252),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Notes',
                                          style: kPrimary_heading.copyWith(
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Enter your description',
                                      ),
                                      onChanged: (description) {
                                        meetingData.tempTask.description =
                                            description;
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Category',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CategoryList(),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Theme',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  BackGroundColorList(meetingData),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  meetingData.resetTask();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 30),
                                  child: Text(
                                    'Cancel',
                                    style: kPrimary_heading,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xffA0A0A0),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 60),
                                  child: Text(
                                    'Add Task',
                                    style: kPrimary_heading,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xffD63447),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  meetingData.addTask();
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
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
