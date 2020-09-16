import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/models/provider/schedule_data.dart';
import 'package:utm_orgnization/models/schedule_model/course.dart';




void bottomSheet(sheetContext, Course course) {

  final data = Provider.of<ScheduleData>(sheetContext, listen: false);
  print(data);
  int section = 0;
  for (int j = 0; j < course.sections.length; j++) {
    if (course.sections[j].isPressed == true) {
      section = j;
    }
  }
  // for (int j = 0; j < data.getCourse(data.currentCourse).sections.length; j++) {
  //   if (data.getCourse(data.currentCourse).sections[j].isPressed == true) {
  //     data.currentSection = j;
  //   }
  // }

  showModalBottomSheet(
      isDismissible: false,
      backgroundColor: Color(0xff000000).withOpacity(0.001),
      context: sheetContext,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, state) {
          return Container(
            // height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width,
                    child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })),
                Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 5),
                  child: Text(
                    'Sections',
                    style: TextStyle(
                        fontSize: 14, color: Colors.black, fontFamily: 'Muli'),
                  ),
                ),
                Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    height: 42,
                    child: ListView.builder(
                      itemCount: course.sections.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ChoiceChip(
                            backgroundColor: Color(0xffF9F6F7),
                            label: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Text(
                                  "Section ${course.sections[index].number}"),
                            ),
                            selectedColor: Color(0xffD63447),
                            selected: course
                                .sections[index].isPressed, //section == index,
                            labelStyle: TextStyle(
                                fontSize: 15,
                                color: course.sections[index]
                                        .isPressed //section == index
                                    ? Colors.white
                                    : Colors.black),
                            onSelected: (selected) {
                              state(() {
                                course.sections[section].isPressed = false;
                                section = index;
                                course.sections[index].isPressed = true;
                                data.currentSection = index;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                course.sections[section].isPressed //section >= 0
                    ? course.sections[section].doctor != null
                        ? Padding(
                            padding:
                                EdgeInsets.only(left: 15, top: 15, bottom: 5),
                            child: Text(
                              'Details',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Muli'),
                            ),
                          )
                        : Container()
                    : Container(),
                course.sections[section].isPressed //section >= 0
                    //section >= 0
                    ? course.sections[section].doctor != null
                        ? Divider(thickness: 1)
                        : Container()
                    : Container(),
                course.sections[section].isPressed //section >= 0
                    //section >= 0
                    ? course.sections[section].doctor != null
                        ? ListTile(
                            title: Text(
                              "${course.sections[section].doctor.name}",
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Wrap(
                              children: List<Widget>.generate(
                                course.sections[section].doctor.classes.length,
                                (index) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "${course.sections[section].doctor.classes[index].day}",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        "${DateFormat('hh:mm a').format(course.sections[section].doctor.classes[index].startTime)} - "
                                        "${DateFormat('hh:mm a').format(course.sections[section].doctor.classes[index].endTime)}",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            isThreeLine: true,
                          )
                        : Container()
                    : Container(),
                Divider(thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FilterChip(
                      label: Text("Clear"),
                      labelStyle: TextStyle(
                          color: course.sections[section].isPressed
                              ? Colors.white
                              : Colors.grey),
                      backgroundColor: Color(0xffD63447),
                      onSelected: course.sections[section].isPressed
                          ? (selected) {
                              state(() {
                                if (course.sections[section].isPressed) {
                                  // course.sections[section].isPressed = false;
                                  // data.getCourse(data.currentCourse).sections[section].isPressed = false;
                                  data.currentSection = section;
                                  data.removeCourse(course,);
                                }
                              });
                            }
                          : null,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FilterChip(
                      label: Text("Done"),
                      labelStyle: TextStyle(
                          color: course.sections[section].isPressed
                              ? Colors.white
                              : Colors.grey),
                      backgroundColor: Color(0xffD63447),
                      onSelected: course.sections[section].isPressed
                          ? (_) {
                              data.addCourse(course);
                              Navigator.pop(context);
                          }
                          : null,
                    ),
                  ],
                ),
                SizedBox(height: 20)
              ],
            ),
          );
        });
      });
}



              //! check CLASH
                                // data.isClash();
//                               if (data.isClashed) {
//                                 Scaffold.of(sheetContext).showSnackBar(SnackBar(
//                                   content: Text('Warning you have clash now!'),
//                                   action: SnackBarAction(
//                                     label: 'Undo',
//                                     onPressed: () {
//                                       // Some code to undo the change.
//                                       data.undo();
//                                     },
//                                   ),
//                                 ));
//                               }