import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:utm_orgnization/models/provider/meeting_data.dart';

import '../../../utils/constants.dart';

class AddTaskTime extends StatefulWidget {
  MeetingData meetingData;
  AddTaskTime(this.meetingData);
  @override
  _AddTaskTimeState createState() => _AddTaskTimeState();
}

class _AddTaskTimeState extends State<AddTaskTime> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'From',
              style: kPrimary_heading.copyWith(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Text(
                  DateFormat('hh:mm a').format(
                    widget.meetingData.tempTask.startTime != DateTime.now()
                        ? widget.meetingData.tempTask.startTime
                        : DateTime.now(),
                  ),
                  style: kPrimary_heading.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              // child: Text( '${widget.meetingData.date.weekday}'),
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: false,
                  context: context,
                  builder: (_) => Column(
                    children: <Widget>[
                      SizedBox(
                        height: 300,
                        child: CupertinoDatePicker(
                          initialDateTime:
                              widget.meetingData.tempTask.startTime == null
                                  ? DateTime.now()
                                  : widget.meetingData.tempTask.startTime,
                          maximumYear: DateTime.now().year + 5,
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (date) {
                            widget.meetingData.tempTask.startTime = date;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: GestureDetector(
                          //! update date
                          onTap: () {
                            // widget.meetingData.deleteCurrentEventToBeShown();
                            // widget.meetingData.addTask();
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Container(
                            // width: 450,
                            height: 70,
                            child: Center(
                                child: Text(
                              'Confirm',
                              style: TextStyle(
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
                );
              },
            ),
          ],
        ),
        SizedBox(
          width: 25,
        ),
        Column(
          children: <Widget>[
            Text(
              'To',
              style: kPrimary_heading.copyWith(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Text(
                  DateFormat('hh:mm a').format(  widget.meetingData.tempTask.endTime != DateTime.now()
                    ? widget.meetingData.tempTask.endTime
                    : DateTime.now(),),
                  style: kPrimary_heading.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              // child: Text( '${widget.meetingData.date.weekday}'),
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: false,
                  context: context,
                  builder: (_) => Column(
                    children: <Widget>[
                      SizedBox(
                        height: 300,
                        child: CupertinoDatePicker(
                          initialDateTime:  widget.meetingData.tempTask.endTime == null
                              ? DateTime.now()
                              : widget.meetingData.tempTask.endTime,
                          minimumYear: DateTime.now().year,
                          maximumYear: DateTime.now().year + 5,
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (date) {
                            widget.meetingData.tempTask.endTime = date;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Container(
                            // width: 450,
                            height: 70,
                            child: Center(
                                child: Text(
                              'Confirm',
                              style: TextStyle(
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
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
