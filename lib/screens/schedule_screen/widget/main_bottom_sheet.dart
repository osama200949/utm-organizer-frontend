import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/models/provider/schedule_data.dart';
import './sub_bottom_sheet.dart';

class MainBottomSheet extends StatefulWidget {
  final int sem;
  MainBottomSheet(this.sem);
  @override
  _MainBottomSheetState createState() => _MainBottomSheetState();
}

class _MainBottomSheetState extends State<MainBottomSheet> {
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
                        bottom: 10,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          data.setCurrentCourse = index;
                          bottomSheet(context, data.getCourse(index));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          width: 130,
                          height: 42,
                          decoration: BoxDecoration(
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
