import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/models/provider/schedule_provider.dart';
import 'package:utm_orgnization/components/canvas/Canva_home.dart';
import 'package:utm_orgnization/models/schedule_model/year.dart';
import 'package:utm_orgnization/utils/constants.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleProvider>(
      builder: (context, data, _) {
        final data = Provider.of<ScheduleProvider>(context);
        // if (data.majors == null) return fetchingDataInProgress();

        return buildScreen(context, data);
      },
    );
  }

  Scaffold buildScreen(BuildContext context, ScheduleProvider data) {
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
                  Navigator.of(context).popUntil(ModalRoute.withName('/'));
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
                      ),
                    ),
                  ),
                  //Bottom Area
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 30),
                              child: Text(
                                'Choose your major',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.black,
                                    fontFamily: 'Muli'),
                              ),
                            ),
                            // Spacer(flex: 1,),
                            SizedBox(
                              height: 40,
                            ),
                            data.majors != null
                                ? Container(
                                    margin: EdgeInsets.all(20),
                                    height: MediaQuery.of(context).size.height *
                                        0.60,
                                    width: MediaQuery.of(context).size.width,
                                    child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200.0,
                                        childAspectRatio: 3.5,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                      ),
                                      itemCount: data.majorBox.length,
                                      // shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return data.majorBox[index];
                                      },
                                    ),
                                  )
                                : Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        CircularProgressIndicator(),
                                        SizedBox(height: 50),
                                        Text('Fetching schduel data'),
                                      ],
                                    ),
                                  ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.stretch,
                            //   children: <Widget>[
                            //     Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceAround,
                            //       children: <Widget>[
                            //         data.majorBox[0],
                            //         data.majorBox[1],
                            //       ],
                            //     ),
                            //     SizedBox(
                            //       height: 15,
                            //     ),
                            //     Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceAround,
                            //       children: <Widget>[
                            //         data.majorBox[2],
                            //         // data.majorBox[3],/
                            //       ],
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: 35,
                            ),
                            // Column(
                            //   crossAxisAlignment:
                            //       CrossAxisAlignment.stretch,
                            //   children: <Widget>[
                            //     Padding(
                            //       padding:
                            //           EdgeInsets.only(left: 15, top: 30),
                            //       child: Text(
                            //         'Semester',
                            //         style: TextStyle(
                            //             fontSize: 28,
                            //             color: Colors.black,
                            //             fontFamily: 'Muli'),
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       height: 15,
                            //     ),
                            //     SizedBox(
                            //       height: 100,
                            //       child: PageView.builder(
                            //         onPageChanged: (index) {
                            //           data.semChange(index);
                            //           data.numChange(index);
                            //         },
                            //         controller: controller,
                            //         scrollDirection: Axis.horizontal,
                            //         itemCount: data.sem.length,
                            //         itemBuilder: (context, index) {
                            //           // data.setCurrentSem(index);
                            //           return Center(
                            //             child: Text(
                            //               '${data.sem[index].number}',
                            //               style: TextStyle(
                            //                   fontSize:
                            //                       data.sem[index].size,
                            //                   color: data
                            //                       .sem[index].numberColor),
                            //             ),
                            //           );
                            // data.semChange(index);
                            // for(int i; i<data.sem.length; i++)
                            // return data.printSemster(i);
                            //         },
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ], // end of the white area
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            data.majors != null
                ? Positioned(
                    bottom: 60,
                    right: 15,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/schedule_detail');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: kBlack_gradient),
                            color: kgrey_primary,
                            shape: BoxShape.circle),
                        height: 80,
                        width: 80,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
//          floatingActionButton:
    );
  }

  Scaffold fetchingDataInProgress() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching schduel data'),
          ],
        ),
      ),
    );
  }
}

class MajorBox extends StatelessWidget {
  MajorBox({
    this.boxColor,
    this.boxText,
    this.textColor,
  });
  final boxColor;
  final boxText;
  final textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 170,
        height: 45,
        decoration: BoxDecoration(
            color: boxColor, borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          boxText,
          style: TextStyle(color: textColor, fontSize: 14),
        )),
      ),
    );
  }
}
