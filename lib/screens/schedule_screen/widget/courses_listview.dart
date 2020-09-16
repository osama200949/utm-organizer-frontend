import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/models/provider/schedule_data.dart';
import 'course_details_bottom_sheet.dart';

class CoursesBottomSheet extends StatefulWidget {
  @override
  _MainBottomSheetState createState() => _MainBottomSheetState();
}

class _MainBottomSheetState extends State<CoursesBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleData>(builder: (context, data, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          height: 340,

          //! Recommended Courses......................

          child: data.getCoursesLength() > 0
              ? ListView.builder(
                  itemCount: data.getCoursesLength(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: InkWell(
                        onTap: () {
                          data.setCurrentCourse = index;
                          bottomSheet(context, data.getCourse(index));  //! COURSE DETAILS BOTTOM SHEET
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          width: 130,
                          height: 42,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 1.0, // soften the shadow
                                spreadRadius: 0.5, //extend the shadow
                                offset: Offset(
                                  3.0, // Move to right 10  horizontally
                                  5.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                            color: Color(0xffD63447),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '${data.getCourse(index).name}',
                                style: TextStyle(
                                    fontFamily: 'Muli',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              Icon(
                                FontAwesomeIcons.angleRight,
                                color: Colors.white,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "- No courses are available here -",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
          //! Recommended Courses......................
        ),
      );
    });
  }
}
