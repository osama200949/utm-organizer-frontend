import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/models/provider/schedule_data.dart';
import 'package:utm_orgnization/components/canvas/Canva_home.dart';
import 'package:utm_orgnization/screens/schedule_screen/class_info.dart';
import 'package:utm_orgnization/screens/schedule_screen/selected_courses.dart';
import 'package:utm_orgnization/utils/constants.dart';
import 'widget/courses_listview.dart';

class ScheduleDetail extends StatefulWidget {
  @override
  _ScheduleDetailState createState() => _ScheduleDetailState();
}

class _ScheduleDetailState extends State<ScheduleDetail> {
  PageController controller;
  @override
  void initState() {
    controller =
        PageController(initialPage: 3, viewportFraction: 0.2, keepPage: false);
    controller.addListener(() {
      setState(() {});
    });
  }

  int year = 0;
  int others = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleData>(
      builder: (context, data, _) {
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
                      Navigator.pushNamed(context, '/schedule_screen');
                    },
                    icon: Icon(FontAwesomeIcons.arrowLeft)),
                SvgPicture.asset('images/logos/logo-mini.svg'),
              ],
            ),
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
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 10),
                          child: ListTile(
                            leading: Text(
                              'Class Schedule',
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Muli',
                                color: Colors.white,
                              ),
                            ),
                            // trailing: Icon(
                            //   FontAwesomeIcons.calendarAlt,
                            //   color: Colors.white,
                            //   size: 35,
                            // ),
                            trailing: InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, kSelectedCourses),
                              child: Container(
                                width: 130,
                                height: 40,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.3),
                                        blurRadius: 0.0, // soften the shadow
                                        spreadRadius: 0.5, //extend the shadow
                                        offset: Offset(
                                          2.0, // Move to right 10  horizontally
                                          4.0, // Move to bottom 10 Vertically
                                        ),
                                      )
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25.0)),
                                child: Center(
                                  child: Text(
                                    'Selected Courses',
                                    style: TextStyle(
                                        fontSize: 14, color: kRead_primary),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //! Bottom Area
                      Expanded(
                        flex: 6,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              //! Year area

                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, top: 25, bottom: 5),
                                      child: Text(
                                        'Year',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontFamily: 'Muli'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: data.yearsText.length,
                                        padding: EdgeInsets.only(left: 15.0),
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: ChoiceChip(
                                              backgroundColor:
                                                  Color(0xffF9F6F7),
                                              label: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                child: Text(
                                                    "${data.yearsText[index]}"),
                                              ),
                                              selectedColor: Color(0xffD63447),
                                              selected: year == index,
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: year == index
                                                      ? Colors.white
                                                      : Colors.black),
                                              onSelected: (selected) {
                                                setState(() {
                                                  year = index;
                                                  if (index == 0)
                                                    data.currentYearindex = -1;
                                                  else
                                                    data.currentYearindex =
                                                        year - 1;
                                                });
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),

                              //! Others......................
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, bottom: 5),
                                      child: Text(
                                        'Others',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontFamily: 'Muli'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 55,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: data.others.length,
                                        padding: EdgeInsets.only(left: 15.0),
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: ChoiceChip(
                                              backgroundColor:
                                                  Color(0xffF9F6F7),
                                              label: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0,
                                                        vertical: 5.0),
                                                child: Text(
                                                    "${data.others[index]}"),
                                              ),
                                              selectedColor: Color(0xffD63447),
                                              selected: others == index,
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: others == index
                                                      ? Colors.white
                                                      : Colors.black),
                                              onSelected: (selected) {
                                                setState(() {
                                                  others = index;
                                                  data.othersIndex = others;
                                                });
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //! COURSES AREA......................
                              Expanded(
                                flex: 7,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, bottom: 5),
                                      child: Text(
                                        '${data.others[others]}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontFamily: 'Muli'),
                                      ),
                                    ),
                                    CoursesListView(),
                                  ],
                                ),
                              ),
                            ], // end of the white area
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Function clearAll = () {
                setState(() {
                  data.clearAll();
                });
              };

              try {
                await data.setDataSource();

                if (!data.isClash())
                  Navigator.pushNamed(context, kTimetable);
                else
                  _showDialog(context, data.classes, clearAll);
              } catch (e) {
                _showDialogTooManyClashes(context, clearAll);
              }
            },
            backgroundColor: Color(0xff70141E),
            child: Icon(
              FontAwesomeIcons.calendarAlt,
              color: Colors.white,
              size: 32,
            ),
          ),
        );
      },
    );
  }
}

void _showDialog(mcontext, List<ClassInfo> classes, Function clearAll) {
  // flutter defined function
  showDialog(
    context: mcontext,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: Text("You have clash"),
        content: Text("Please solve the clash and submit again"),
        actions: <Widget>[
          FlatButton(
            child: Text("Clear all courses"),
            onPressed: () {
              _showConfirmationDialog(mcontext, clearAll);
              // clearAll();
              // Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text("Preview"),
            onPressed: () {
              Navigator.pushNamed(context, kTimetablePreview,
                  arguments: classes);
            },
          ),
          FlatButton(
            child: Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void _showConfirmationDialog(mcontext, Function clearAll) {
  // flutter defined function
  showDialog(
      context: mcontext,
      builder: (BuildContext context) {
        // return object of type Dialog
        return StatefulBuilder(
          builder: (mcontext, state) {
            return AlertDialog(
              title: Text("Are you sure"),
              content: Text(
                  "If you press yes this will delete all your current registered courses"),
              actions: <Widget>[
                FlatButton(
                  child: Text("No"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Yes", style: TextStyle(color: Colors.red)),
                  onPressed: () {
                    state(() {
                      clearAll();
                      Navigator.pop(context);
                    });
                    // Navigator.pushNamed(context, kSchduleScreen);
                  },
                ),
              ],
            );
          },
        );
      });
}

void _showDialogTooManyClashes(mcontext, Function clearAll) {
  // flutter defined function
  showDialog(
    context: mcontext,
    builder: (BuildContext context) {
      // return object of type Dialog
      return StatefulBuilder(
        builder: (mcontext, state) {
          return AlertDialog(
            title: Text("Too many clashes"),
            content: Text(
                "Please resolve the clashes or clear some courses to continue"),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  state(() {
                    Navigator.of(context).pop();
                  });
                },
              ),
              // FlatButton(
              //   child: Text("Clear all courses"),
              //   onPressed: () {
              //     state(() {
              //       _showConfirmationDialog(mcontext, clearAll);
              //     });
              //     // clearAll();
              //     // Navigator.pop(context);
              //   },
              // ),
            ],
          );
        },
      );
    },
  );
}
