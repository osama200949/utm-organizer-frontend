import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/components/appbar_widget.dart';
import 'package:utm_orgnization/components/canvas/Canva_home.dart';
import 'package:utm_orgnization/models/provider/schedule_data.dart';
import 'package:utm_orgnization/utils/constants.dart';

class SelectedCoursesScreen extends StatefulWidget {
  @override
  _SelectedCoursesScreenState createState() => _SelectedCoursesScreenState();
}

class _SelectedCoursesScreenState extends State<SelectedCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScheduleData>(context);
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
                  Navigator.pushNamed(context, kScheduleDetailsRoute);
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
                            'Selected Courses',
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Muli',
                              color: Colors.white,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.edit,
                              color: Colors.white,
                              size: 32,
                            ),
                            // onPressed: () {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) =>
                            //             SelectedCoursesScreen(),
                            //       ));
                            // },
                          )),
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
                      child: data.selectedCourses.length != 0
                          ? Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: ListView.separated(

                                      separatorBuilder: (context, index) =>
                                          Divider(
                                            thickness: 2,
                                          ),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.only(
                                          top: 15, left: 5, bottom: 10),
                                      itemCount:
                                          data.selectedCourses.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                            '${data.selectedCourses[index].name} with\n${data.selectedCourses[index].sections[0].doctor.name}\n(section: ${data.selectedCourses[index].sections[0].number})',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          trailing: IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                              size: 32,
                                            ),
                                            onPressed: () {
                                              data.removeCourse(data
                                                  .selectedCourses[index]);
                                            },
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            )
                          : Container(
                              height: 500,
                              child: Center(
                                child: Text(
                                  'Nothing selected yet',
                                  style: TextStyle(
                                      fontSize: 32, color: Colors.black),
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
