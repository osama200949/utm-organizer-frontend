import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:utm_orgnization/models/provider/meeting_data.dart';
import '../../../utils/constants.dart';

class AddTaskDate extends StatefulWidget {
  MeetingData meetingData;
  AddTaskDate(this.meetingData);
  @override
  AddTaskDateState createState() => AddTaskDateState();
}

class AddTaskDateState extends State<AddTaskDate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.calendar_today,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Date',
              style: kPrimary_heading.copyWith(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          child: Container(
            width: 120,
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
              DateFormat('dd-MM-yyyy').format(
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
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (_) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    flex: 14,
                    // height: 300,
                    child: CupertinoDatePicker(
                      initialDateTime:
                          widget.meetingData.tempTask.startTime == null
                              ? DateTime.now()
                              : widget.meetingData.tempTask.startTime,
                      minimumYear: DateTime.now().year,
                      maximumYear: DateTime.now().year + 5,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (date) {
                        widget.meetingData.tempTask.startTime = date;
                      },
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {});
                          Navigator.pop(context);
                        },
                        child: Container(
                          // height: 70,
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
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
