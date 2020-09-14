import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:utm_orgnization/models/provider/meeting_data.dart';
import 'package:utm_orgnization/utils/constants.dart';
import 'events/event_unhiglighted.dart';
import 'events/events_highlighted.dart';

class TopCalendar extends StatefulWidget {
  @override
  _TopCalendarState createState() => _TopCalendarState();
}

class _TopCalendarState extends State<TopCalendar>
    with TickerProviderStateMixin {
  CalendarController controller;
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = CalendarController();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _animationController.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MeetingData>(
      builder: (context, meetingData, _) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 0,
            bottom: 10,
            right: 10,
            left: 10,
          ),
          child: Column(
            children: <Widget>[
              //! TopCalender(),
              TableCalendar(
                availableGestures: AvailableGestures.all,
                formatAnimation: FormatAnimation.slide,
                initialCalendarFormat: CalendarFormat.week,
                calendarController: controller,
                startingDayOfWeek: StartingDayOfWeek.sunday,
                weekendDays: [DateTime.friday, DateTime.saturday],
                //body
                calendarStyle: CalendarStyle(
                  selectedColor: Colors.white,
                  selectedStyle: TextStyle(color: whiteBrown, fontSize: 18),
                  todayColor: Colors.white.withOpacity(0.5),
                  markersColor: Colors.brown[700],
                  outsideDaysVisible: false,
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(
                        color: offBrown,
                        fontSize: 16,
                        fontFamily: 'Goathem',
                        fontWeight: FontWeight.bold),
                    weekdayStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Goathem',
                        fontWeight: FontWeight.bold)),
                //Header
                headerStyle: HeaderStyle(
                  formatButtonShowsNext: false,
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 30,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 30,
                  ),
                  formatButtonTextStyle:
                      TextStyle().copyWith(color: whiteBrown, fontSize: 20.0),
                  titleTextStyle: TextStyle().copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Railway',
                      fontWeight: FontWeight.bold),
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                rowHeight: 65,
                builders: CalendarBuilders(
                    // The current Day that is not changeble (Your computer Date)
                    todayDayBuilder: (context, date, event) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 35,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Center(
                          child: Text(
                            '${date.day}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Gotham'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GetEvents(
                        listLength: meetingData.getLength(date),
                      ),
                      // Spacer(flex: 1,)
                    ],
                  );
                },
                    // The Selected day by the user
                    selectedDayBuilder: (context, date, _) {
                  return FadeTransition(
                    opacity: Tween(begin: 0.0, end: 1.0)
                        .animate(_animationController),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 35,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            child: Center(
                              child: Text(
                                '${meetingData.currentDay.day}',
                                style: TextStyle(
                                    color: Color(0xffF57B51),
                                    fontSize: 18,
                                    fontFamily: 'Gotham'),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: GetEventsHighlighted(
                                listLength: meetingData.currentDayInfo().length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }, dayBuilder: (contex, date, event) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // Spacer(flex: 1,),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text(
                          '${date.day}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Gotham'),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GetEvents(
                        listLength: meetingData.getLength(date),
                      ),
                      // Spacer(flex: 1,)
                    ],
                  );
                }),
                onDaySelected: (date, meeting) {
                  meetingData.setCurrentDay(date);
                  _animationController.forward(from: 0.0);
                },
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Month',
                  CalendarFormat.twoWeeks: 'Two weeks',
                  CalendarFormat.week: 'Week',
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
