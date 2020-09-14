import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/components/appbar_widget.dart';
import 'package:utm_orgnization/components/canvas/Canva_home.dart';
import 'package:utm_orgnization/data/club_category_data.dart';
import 'package:utm_orgnization/data/data.dart';
import 'package:utm_orgnization/models/club_model/club_category.dart';
import 'package:utm_orgnization/models/event_model/event.dart';
import 'package:utm_orgnization/models/user.dart';
import 'package:utm_orgnization/screens/activities_screens/event_screen/event_info.dart';
import 'package:utm_orgnization/screens/home_screen/widget/home/club_widget.dart';
import 'package:utm_orgnization/utils/FeadAnmation.dart';
import 'package:utm_orgnization/utils/constants.dart';
import 'package:date_format/date_format.dart';

import 'event_screen/event_stream.dart';

class Clubs extends StatefulWidget {
  final Function changePage;
  final int index;

  Clubs({this.index, this.changePage});
  @override
  _ClubsState createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {
  bool isCliked = true;
  Map<String, ClubCategory> filteredCategories =
      new Map<String, ClubCategory>.from(eventCategories);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TopAppBar(
        appBar: AppBar(),
      ),
      body: Container(
          child: Stack(children: <Widget>[
        CanvasRed(),
        CanvasBlack(),
        CanvasOrange(),
        DraggableScrollableSheet(
            initialChildSize: 0.75,
            maxChildSize: 0.885,
            minChildSize: 0.75,
            builder: (BuildContext context, myscrollController) {
              return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                      controller: myscrollController,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(children: <Widget>[
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isCliked
                                                  ? isCliked = isCliked
                                                  : isCliked = !isCliked;
                                            });
                                          },
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.21,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.14,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: isCliked
                                                      ? kGender_Active
                                                      : kGender_disable,
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                color: kOrange_primary,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    SvgPicture.asset(
                                                      'images/icons/club.svg',
                                                      color: isCliked
                                                          ? Colors.white
                                                          : Colors.black,
                                                      height: 40,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text("Clubs",
                                                        style:
                                                            kSecondary_heading
                                                                .copyWith(
                                                          color: isCliked
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ))
                                                  ]))),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isCliked
                                                ? isCliked = !isCliked
                                                : isCliked = isCliked;
                                          });
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.21,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.14,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: isCliked
                                                  ? kGender_disable
                                                  : kGender_Active,
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            color: kOrange_primary,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              SvgPicture.asset(
                                                'images/icons/school.svg',
                                                color: isCliked
                                                    ? Colors.black
                                                    : Colors.white,
                                                height: 40,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Event",
                                                style:
                                                    kSecondary_heading.copyWith(
                                                  color: isCliked
                                                      ? Colors.black
                                                      : Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 10),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Categories",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.bold)))),
                                  Wrap(
                                    spacing: 5.0,
                                    runSpacing: 5.0,
                                    children: <Widget>[
                                      for (var i in filteredCategories.keys)
                                        FilterChipWidget(
                                          chipName: filteredCategories[i]
                                              .categoryTitle,
                                          parent: this,
                                        )
                                    ],
                                  ),
                                  !isCliked
                                      ? Column(children: <Widget>[
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Current Events",
                                              style:
                                                  kPrimary_heading_2.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 24,
                                              )),
                                          EventsStream(
                                            selectOngoingEvent: true,
                                            filteredCategories:
                                                filteredCategories.values
                                                    .toList(),
                                          ),
                                          Text("Upcoming Events",
                                              style:
                                                  kPrimary_heading_2.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 24,
                                              )),
                                          EventsStream(
                                            filteredCategories:
                                                filteredCategories.values
                                                    .toList(),
                                            selectOngoingEvent: false,
                                          ),
                                        ])
                                      :   Club_widget(),
                                ]))
                          ])));
            }),
      ])),
    );
  }
}

class FilterChipWidget extends StatefulWidget {
  final String chipName;
  // final ClubCategory chipName;
  _ClubsState parent;
  FilterChipWidget({Key key, this.parent, this.chipName}) : super(key: key);

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  @override
  ClubCategory chipName;
  _ClubsState parent;
  void initState() {
    print(widget.chipName);
    chipName = widget.parent.filteredCategories[widget.chipName];
    parent = widget.parent;
    // TODO: implement initState
    super.initState();
  }

  var _isSelected = false;
  // var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(chipName.categoryTitle),
      labelStyle: TextStyle(
          color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
      selected: _isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: Colors.black54,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
          chipName.categoryIscliked = isSelected;
          // _chipName.categoryIscliked =isSelected;
          print(chipName.categoryIscliked);
        });
        this.parent.setState(() {
          this
              .parent
              .filteredCategories[chipName.categoryTitle]
              .categoryIscliked = isSelected;
        });
      },
      selectedColor: chipName.color,
    );
  }
}
