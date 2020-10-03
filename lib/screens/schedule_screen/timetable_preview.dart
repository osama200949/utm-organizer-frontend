import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:utm_orgnization/models/provider/meeting_provider.dart';
import 'package:utm_orgnization/models/provider/schedule_provider.dart';
import 'package:utm_orgnization/models/schedule_model/course.dart';
import 'package:utm_orgnization/screens/schedule_screen/class_info.dart';
import 'package:utm_orgnization/utils/constants.dart';

class TimetablePreview extends StatefulWidget {
  @override
  _TimetablePreviewState createState() => _TimetablePreviewState();
}

class _TimetablePreviewState extends State<TimetablePreview> {
  @override
  Widget build(BuildContext context) {
    final classes = Provider.of<ScheduleProvider>(context).classes;

    return Scaffold(
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
            classes,
          ),

          headerHeight: 0, // DISABLE THE MONTH VIEW
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xffD63447),
            child: Icon(
              FontAwesomeIcons.arrowLeft,
            ),
            onPressed: () {
              Navigator.pop(context, kMainNv);
            }));
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
    String output = appointments[index].name;
    String newO =
        '${output.substring(0, 15)} S(${appointments[index].section})';

    return newO;
  }

  @override
  Color getColor(int index) {
    return appointments[index].bgColor;
  }
}
