import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utm_orgnization/data/club_category_data.dart';
import 'package:utm_orgnization/models/event_model/event.dart';
import 'package:utm_orgnization/models/user.dart';
import 'package:utm_orgnization/screens/activities_screens/event_screen/widget/PosterZoom.dart';
import 'package:utm_orgnization/utils/constants.dart';

///
class EventinfoScreen extends StatefulWidget {
  final Event event;
  String userID;
  EventinfoScreen({this.event,this.userID});
  @override
  _EventinfoScreenState createState() => _EventinfoScreenState();
}

class _EventinfoScreenState extends State<EventinfoScreen> {
  int hexabottom = 0xff45606F;
  int hexabackgorund = 0xff704B4B;
  final db = Firestore.instance;
  bool isIntrested = false;
  Widget checkLink() {
    if (widget.event.registrationForm == "") {
      return Text("No registration link available",
          style: kSecondary_heading_2.copyWith(
            color: Colors.black,
          ));
    } else if (widget.event.registrationForm != "") {
      return RichText(
          text: new TextSpan(
        text: "Registration Link",
        style: kSecondary_heading_2.copyWith(
          color: Colors.blue,
        ),
        recognizer: new TapGestureRecognizer()
          ..onTap = () {
            launch(widget.event.registrationForm);
          },
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    isIntrested =
        widget.event.eventInterster.contains(widget.userID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                color: eventCategories[widget.event.eventCategory].color,
              ),
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.49,
                            height: MediaQuery.of(context).size.width * 0.695,
                            child: HeroExample(widget.event.imageURL),
                            decoration: BoxDecoration(
                              color: kgrey_primary,
                              boxShadow: kShadow_activityCard,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                          child: Text(
                            widget.event.eventCategory,
                            style: kPrimary_heading_3.copyWith(
                              fontSize: 15,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: eventCategories[widget.event.eventCategory]
                                .color,
                            borderRadius: BorderRadius.circular(250),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor:
                              eventCategories[widget.event.eventCategory].color,
                          radius: 4,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: <Widget>[
                            SvgPicture.asset(
                              eventCategories[widget.event.eventCategory]
                                  .categotyIconPath,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        boxShadow: kShadow_activityCard,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text(
                                  widget.event.eventName,
                                  style: kPrimary_heading_3.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text(
                                  widget.event.eventDescription,
                                  style: kSecondary_heading_2.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.calendar_today,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      // widget.event.eventStartDate,
                                      '${widget.event.eventStartDate} - ${widget.event.eventEndDate}',
                                      style: kPrimary_heading.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.access_time,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      // widget.event.eventStartDate,
                                      '${widget.event.eventStartTime} - ${widget.event.eventEndTime}',
                                      style: kPrimary_heading.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.black,
                                              ),
                                              SizedBox(width: 6),
                                              Text(
                                                widget.event.eventLocation,
                                                style: kSecondary_heading_2
                                                    .copyWith(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.monetization_on,
                                                color: Colors.black,
                                              ),
                                              SizedBox(width: 6),
                                              Text(
                                                widget.event.ticketPrice,
                                                style: kSecondary_heading_2
                                                    .copyWith(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.link,
                                                color: Colors.black,
                                              ),
                                              SizedBox(width: 6),
                                              checkLink(),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 10,
                                        ),
                                        RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            color: eventCategories[
                                                    widget.event.eventCategory]
                                                .secondary,
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  isIntrested
                                                      ? Icons.cancel
                                                      : Icons.check,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  isIntrested
                                                      ? "NOT INTERESTED"
                                                      : "INTERESTED",
                                                  style: kPrimary_heading_3
                                                      .copyWith(fontSize: 15),
                                                ),
                                              ],
                                            ),
                                            onPressed: () async {
                                              if (isIntrested) {
                                                await Firestore.instance
                                                    .collection('eventss')
                                                    .document(
                                                        widget.event.eventId)
                                                    .updateData({
                                                  "eventInterester":
                                                      FieldValue.arrayRemove(
                                                          [widget.userID])
                                                }).whenComplete(() {
                                                  setState(() {
                                                    isIntrested = false;
                                                  });
                                                });
                                              } else {
                                                await Firestore.instance
                                                    .collection('eventss')
                                                    .document(
                                                        widget.event.eventId)
                                                    .updateData({
                                                  "eventInterester":
                                                      FieldValue.arrayUnion(
                                                          [widget.userID])
                                                }).whenComplete(() {
                                                  setState(() {
                                                    isIntrested = true;
                                                  });
                                                });
                                              }
                                            }),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}