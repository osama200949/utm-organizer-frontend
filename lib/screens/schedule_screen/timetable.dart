import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:utm_orgnization/models/provider/meeting_data.dart';
import 'package:utm_orgnization/models/provider/schedule_data.dart';
import 'package:utm_orgnization/models/schedule_model/course.dart';
import 'package:utm_orgnization/screens/schedule_screen/class_info.dart';
import 'package:utm_orgnization/utils/constants.dart';

class Timetable extends StatefulWidget {
  // final List<Course> courses;
  // final List<ClassInfo> classes;
  final DateTime time = DateTime.now();
  // Timetable(this.classes);
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<Timetable> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Consumer<ScheduleData>(
      builder: (context, data, child) => Scaffold(
          body: SfCalendar(
            view: CalendarView.workWeek,
            todayHighlightColor: Color(0xffD63447),

            //! appointment
            timeSlotViewSettings: TimeSlotViewSettings(
              dateFormat: "EE",
              dayFormat: "",
              timeRulerSize: 55,
              timeInterval: Duration(hours: 1),
              minimumAppointmentDuration: Duration(hours: 1),
              timeIntervalHeight: 60, // SIZEDBOX BETWEEN TIMES
              startHour: 7,
              endHour: 18,
              nonWorkingDays: <int>[DateTime.friday, DateTime.saturday],

              timeTextStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            //! THE STYLE OF THE TEXT INSIDE THE BOX
            appointmentTextStyle: TextStyle(
              // backgroundColor: Colors.black,

              fontSize: 14,
              fontStyle: FontStyle.normal,
            ),
            //!Header
            viewHeaderHeight: 70,
            viewHeaderStyle: ViewHeaderStyle(
              dateTextStyle: TextStyle(
                fontSize: 20,
              ),
            ),
            minDate: DateTime.now(),
            maxDate: DateTime.now(),
            firstDayOfWeek: 7,
            //! FTECH THE DATA
            dataSource: MeetingDataSource(
              data.classes,
            ),

            headerHeight: 0, // DISABLE THE MONTH VIEW
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xffD63447),
              child: Icon(
                Icons.done,
              ),
              onPressed: () {
                // Provider.of<MeetingData>(context, listen: false)   //! Set timetable on calendar feature
                //     .setTimeTable(data.classes);

                // Provider.of<ScheduleData>(context,listen: false).addSelectedCoursesToDatabase();

                Navigator.pushNamedAndRemoveUntil(
                    context, kMainNv, (route) => false);
              })),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<ClassInfo> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].endTime;
  }

  @override
  String getSubject(int index) {
    return (appointments[index].name +
        "\n\nSection: " +
        appointments[index].section);
  }

  @override
  Color getColor(int index) {
    return appointments[index].bgColor;
  }
}
