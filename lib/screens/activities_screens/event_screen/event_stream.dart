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

class EventsStream extends StatefulWidget {
  bool selectOngoingEvent = true;

  List<ClubCategory> filteredCategories;
  EventsStream({this.selectOngoingEvent, this.filteredCategories});
  @override
  _EventsStreamState createState() => _EventsStreamState();
}

class _EventsStreamState extends State<EventsStream> {
  List<String> filterednames;

  @override
  Widget build(BuildContext context) {
    final firestore = Firestore.instance;
    if (widget.filteredCategories != null) {
      List<ClubCategory> filteredTitles = List.from(widget.filteredCategories);
      filteredTitles
          .removeWhere((element) => element.categoryIscliked == false);
      setState(() {
        filterednames = filteredTitles.map((e) => e.categoryTitle).toList();
      });
    }
    return StreamBuilder(
      stream: firestore.collection("eventss").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return new Text('Getting events..',
              style: kSecondary_heading.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 20,
              ));
        } else {
          List<Event> eventsPerWeek = snapshot.data.documents.map((document) {
            Uri a = Uri.parse(document['imageURL']);
            Event e = new Event(
                eventName: document['eventName'],
                eventDescription: document['eventDescription'],
                eventPhone: document['eventPhone'],
                eventEndDate: document['eventEndDate'],
                eventStartDate: document['eventStartDate'],
                eventEndTime: document['eventEndTime'],
                eventStartTime: document['eventStartTime'],
                eventCategory: document['eventCategory'],
                registrationForm: document['registrationForm'],
                ticketPrice: document['ticketPrice'],
                eventLocation: document['eventLocation'],
                eventInterster: List.from(
                    document.data["eventInterester"] == null
                        ? []
                        : document.data["eventInterester"]),
                eventId: document.documentID,
                imageURL: a.toString());
            return e;
          }).toList();

          List<Event> selectedEvents = eventsPerWeek.map((event) {
            String parsedStart =
                "${event.eventStartDate} ${event.eventStartTime}";
            String parsedEnd = "${event.eventEndDate} ${event.eventEndTime}";
            DateFormat format = new DateFormat("MMM dd, yyyy hh:mm");
            DateTime eventDateStart = format.parse(parsedStart);
            DateTime eventDateEnd = format.parse(parsedEnd);
            if (widget.selectOngoingEvent) {
              if (DateTime.now().isAfter(eventDateStart) &&
                  DateTime.now().isBefore(eventDateEnd)) {
                return event;
              }
            } else {
              if (eventDateStart.isAfter(DateTime.now())) {
                return event;
              }
            }
          }).toList();
          selectedEvents.removeWhere((value) => value == null);
          if (widget.filteredCategories != null && filterednames.isNotEmpty) {
            selectedEvents.removeWhere((element) {
              return !filterednames.contains(element.eventCategory);
            });
          }

          return new Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: <Widget>[
                    Event_stream(
                      eventList: selectedEvents,
                    ),
                    SizedBox(height: 30),
                  ])),
            ],
          );
        }
      },
    );
  }
}

class Event_stream extends StatefulWidget {
  dynamic eventName;
  List<Event> eventList;
  Event_stream({this.eventList});
  @override
  _Event_streamState createState() => _Event_streamState();
}

class _Event_streamState extends State<Event_stream> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context)?.uid;
    return Column(children: <Widget>[
      SizedBox(
        height: 20,
      ),
      SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: widget.eventList.length == 0
            ? noEvents()
            : ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                scrollDirection: Axis.horizontal,
                itemCount: widget.eventList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventinfoScreen(
                            event: widget.eventList[index],
                            userID: user,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: <Widget>[
                          Image.network(
                            widget.eventList[index].imageURL,
                            fit: BoxFit.fill,
                            color: Colors.black38,
                            colorBlendMode: BlendMode.darken,
                          ),
                          Container(
                            height: 300,
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      widget.eventList[index].eventName,
                                      style: kPrimary_heading.copyWith(
                                          fontSize: 19),
                                    ),
                                    Text(
                                      widget.eventList[index].eventStartDate,
                                      style: kPrimary_heading.copyWith(
                                          fontSize: 19),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    ]);
  }

  noEvents() {
    return Column(
      children: <Widget>[
        Text("No events as of now, please come back later",
            style: kSecondary_heading.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 16,
            )),
      ],
    );
  }
}