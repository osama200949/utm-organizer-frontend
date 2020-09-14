import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moneytextformfield/moneytextformfield.dart';
import 'package:utm_orgnization/components/appbar_widget.dart';
import 'package:utm_orgnization/components/canvas/Canva_home.dart';
import 'package:utm_orgnization/data/club_category_data.dart';
import 'package:utm_orgnization/models/event_model/event.dart';
import 'package:utm_orgnization/utils/constants.dart';
import 'add_event_confirm.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:utm_orgnization/models/club_model/club_category.dart';

class Events extends StatefulWidget {
  final Function changePage;
  final int index;
  Events({Key key, this.index, this.changePage}) : super(key: key);
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    final newEvent = new Event(
        eventName: null,
        eventCategory: null,
        eventDescription: null,
        eventEndDate: null,
        eventEndTime: null,
        eventPhone: null,
        eventStartTime: null,
        eventStartDate: null);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TopAppBar(
        appBar: AppBar(),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
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
                      )),
                  child: SingleChildScrollView(
                    controller: myscrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: FormEvents(event: newEvent),
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      // bottomNavigationBar:
      //     BottomNavigation(index: widget.index, changePage: widget.changePage),
    );
  }
}

class FormEvents extends StatefulWidget {
  final Event event;
  FormEvents({Key key, @required this.event}) : super(key: key);
  @override
  _FormEventsState createState() => _FormEventsState();
}

File imageUploaded;
// List<String> chipList = ["Tasks", "Class", "Event", "Club", "Public Speaking"];
List<String> chipList = eventCategories.keys.toList();

String categoryChoice;

class _FormEventsState extends State<FormEvents> {
  final db = Firestore.instance;
  bool isCliked = false;
  bool isSubmitted = false;
  bool validSD = false;
  bool validED = false;
  bool validST = false;
  bool validET = false;
  bool validIMG = false;

  var _eventTitleController = new TextEditingController();
  var _eventDescController = new TextEditingController();
  var _eventLocController = new TextEditingController();
  var _eventPhoneController = new TextEditingController();
  var _eventFBController = new TextEditingController();
  var _eventFormController = new TextEditingController();
  // TextEditingController longCtrl = TextEditingController();
  var _longCtrl = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _formatEndDate, _formatEndTime, _formatDate, _formatStartTime;
  DateTime formatEndDate, formatEndTime, formatDate, formatStartTime;
  String endDateMsg = "";
  Duration initialtimer = new Duration();
  int selectitem = 1;
  var eventsGrowable = new List<Event>();

  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() => imageUploaded = image);
  }
  // add valdiotor function for  the following
  // datetime + image
  // the function will return bool

  bool check() {
    print(widget.event.eventStartDate);
    if (widget.event.eventStartDate != null) {
      setState(() {
        validSD = true;
      });
    }
    if (widget.event.eventEndDate != null) {
      if (validSD) {
        if (!formatEndDate.isAfter(formatDate)) {
          setState(() {
            endDateMsg = "End date should be after start date";
          });
        } else {
          setState(() {
            endDateMsg = "";
            validED = true;
          });
        }
      } else {
        setState(() {
          endDateMsg = "Please enter a valid start date";
        });
      }
    } else {
      setState(() {
        endDateMsg = "This is a required field";
      });
    }

    if (widget.event.eventStartTime != null) {
      setState(() {
        validST = true;
      });
    }
    if (widget.event.eventEndTime != null) {
      setState(() {
        validET = true;
      });
    }
    if (imageUploaded != null) {
      setState(() {
        validIMG = true;
      });
    }
    if (validIMG && validST && validET && validSD && validED) {
      return true;
    }
    return false;
  }

  void Snack() {
    if (_formKey.currentState.validate() && check()) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Editing Mode'),
          duration: Duration(seconds: 5),
        ),
      );
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  NextPage(event: widget.event, newimage: imageUploaded)));
    }
  }

  Widget showtextStartDate() {
    if (_formatDate == null) {
      return Text(
        'Select Start Date',
        style: kSecondary_heading.copyWith(color: Colors.white, fontSize: 16),
      );
    } else {
      return Text(
        _formatDate,
        style: kSecondary_heading.copyWith(color: Colors.white, fontSize: 16),
      );
    }
  }

  Widget showtextEndDate() {
    if (_formatEndDate == null) {
      return Text(
        'Select End Date',
        style: kSecondary_heading.copyWith(color: Colors.white, fontSize: 16),
      );
    } else {
      return Text(
        _formatEndDate,
        style: kSecondary_heading.copyWith(color: Colors.white, fontSize: 16),
      );
    }
  }

  Widget showtextStartTime() {
    if (_formatStartTime == null) {
      return Text(
        'Select Start Time',
        style: kSecondary_heading.copyWith(color: Colors.white, fontSize: 16),
      );
    } else {
      return Text(
        _formatStartTime,
        style: kSecondary_heading.copyWith(color: Colors.white, fontSize: 16),
      );
    }
  }

  Widget showtextEndTime() {
    if (_formatEndTime == null) {
      return Text(
        'Select End Time',
        style: kSecondary_heading.copyWith(color: Colors.white, fontSize: 16),
      );
    } else {
      return Text(
        _formatEndTime,
        style: kSecondary_heading.copyWith(color: Colors.white, fontSize: 16),
      );
    }
  }

  Widget GetStartingDate() {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.red)),
      child: showtextStartDate(),
      color: Color(0xffFF4949),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext builder) {
              return Container(
                  height: MediaQuery.of(context).copyWith().size.height / 3,
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 200,
                          child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (date) {
                              formatDate = date;
                              _formatDate = new DateFormat.yMMMd().format(date);
                            },
                            maximumDate: new DateTime(2020, 12, 30),
                            minimumYear: 2020,
                            maximumYear: 2025,
                            minuteInterval: 1,
                            mode: CupertinoDatePickerMode.date,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                            color: Color(0xffFF4949),
                            onPressed: () {
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: Text('Confirm',
                                style: kSecondary_heading.copyWith(
                                    color: Colors.white, fontSize: 16)))
                      ]));
            });
      },
    );
  }

  Widget GetEndDate() {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.red)),
      child: showtextEndDate(),
      color: Color(0xffFF4949),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext builder) {
              return Container(
                  height: MediaQuery.of(context).copyWith().size.height / 3,
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 200,
                          child: CupertinoDatePicker(
                            initialDateTime: _formatDate != null ? formatDate : DateTime.now(),
                            onDateTimeChanged: (date) {
                              formatEndDate = date;
                              _formatEndDate =
                                  new DateFormat.yMMMd().format(date);
                            },
                            maximumDate: new DateTime(2025, 12, 30),
                            minimumYear: 2020,
                            maximumYear: 2025,
                            minuteInterval: 1,
                            mode: CupertinoDatePickerMode.date,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                            color: Color(0xffFF4949),
                            onPressed: () {
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: Text('Confirm',
                                style: kSecondary_heading.copyWith(
                                    color: Colors.white, fontSize: 16)))
                      ]));
            });
      },
    );
  }

  Widget GetStartTime() {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.red)),
      child: showtextStartTime(),
      color: Color(0xffFF4949),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext builder) {
              return Container(
                  height: MediaQuery.of(context).copyWith().size.height / 3,
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 200,
                          child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (newtime) {
                              formatStartTime = newtime;
                              _formatStartTime =
                                  new DateFormat("HH:mm").format(newtime);
                            },
                            use24hFormat: true,
                            mode: CupertinoDatePickerMode.time,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)),
                            color: Color(0xffFF4949),
                            onPressed: () {
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Confirm',
                              style: kSecondary_heading.copyWith(
                                  color: Colors.white, fontSize: 16),
                            ))
                      ]));
            });
      },
    );
  }

  Widget GetEndTime() {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.red)),
      child: showtextEndTime(),
      color: Color(0xffFF4949),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext builder) {
              return Container(
                  height: MediaQuery.of(context).copyWith().size.height / 3,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                        child: CupertinoDatePicker(
                          initialDateTime: DateTime.now(),
                          onDateTimeChanged: (time) {
                            formatEndTime = time;
                            _formatEndTime =
                                new DateFormat("HH:mm").format(time);
                          },
                          use24hFormat: true,
                          mode: CupertinoDatePickerMode.time,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                        color: Color(0xffFF4949),
                        onPressed: () {
                          setState(() {});
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Confirm',
                          style: kSecondary_heading.copyWith(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ));
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _ts = TextStyle(fontSize: 20.0);
    return Container(
      child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Propose Event',
                    style: kPrimary_heading.copyWith(
                        color: Colors.black, fontSize: 40)),
                SizedBox(
                  height: 20,
                ),
                Text('Title',
                    style: kSecondary_heading.copyWith(
                        color: Colors.black, fontSize: 20)),
                TextFormField(
                    controller: _eventTitleController,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      labelText: 'Event title',
                    ),
                    validator: (value) =>
                        value.isEmpty ? 'This is a required field' : null),
                SizedBox(
                  height: 20,
                ),
                Text('Description',
                    style: kSecondary_heading.copyWith(
                        color: Colors.black, fontSize: 20)),
                TextFormField(
                    controller: _eventDescController,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      labelText: 'Event Description',
                    ),
                    validator: (value) =>
                        value.isEmpty ? "This is a required field" : null),
                SizedBox(
                  height: 20,
                ),
                Text('Location',
                    style: kSecondary_heading.copyWith(
                        color: Colors.black, fontSize: 20)),
                TextFormField(
                    controller: _eventLocController,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      labelText: 'Event Venue',
                    ),
                    validator: (value) =>
                        value.isEmpty ? "This is a required field" : null),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Date',
                  style: kSecondary_heading.copyWith(
                      color: Colors.black, fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        GetStartingDate(),
                        Text(
                          isSubmitted && !validSD
                              ? 'This is a required field'
                              : "",
                          style: kSecondary_heading.copyWith(
                              color: Colors.red, fontSize: 12),
                        ),
                      ],
                    ),
                    Text(
                      'to',
                      style: kSecondary_heading.copyWith(
                          color: Colors.black, fontSize: 16),
                    ),
                    Column(
                      children: <Widget>[
                        GetEndDate(),
                        Text(
                          endDateMsg,
                          style: kSecondary_heading.copyWith(
                              color: Colors.red, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Time',
                  style: kSecondary_heading.copyWith(
                      color: Colors.black, fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        GetStartTime(),
                        Text(
                          isSubmitted && !validST
                              ? 'This is a required field'
                              : "",
                          style: kSecondary_heading.copyWith(
                              color: Colors.red, fontSize: 12),
                        ),
                      ],
                    ),
                    Text(
                      'to',
                      style: kSecondary_heading.copyWith(
                          color: Colors.black, fontSize: 16),
                    ),
                    Column(
                      children: <Widget>[
                        GetEndTime(),
                        Text(
                          isSubmitted && !validET
                              ? 'This is a required field'
                              : "",
                          style: kSecondary_heading.copyWith(
                              color: Colors.red, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Categories',
                  style: kSecondary_heading.copyWith(
                      color: Colors.black, fontSize: 20),
                ),
                Container(
                    child:
                        Wrap(spacing: 10.0, runSpacing: 5.0, children: <Widget>[
                  choiceChipWidget(chipList, (selectedChoice) {
                    categoryChoice = selectedChoice;
                  })
                ])),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('Upload Poster',
                        style: kSecondary_heading.copyWith(
                            color: Colors.black, fontSize: 20)),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: _getImage,
                    child: Container(
                      child: imageUploaded == null
                          ? Column(
                              children: <Widget>[
                                Icon(Icons.file_upload),
                                Text(
                                  isSubmitted && !validIMG
                                      ? 'this is a required field'
                                      : '',
                                  style: kSecondary_heading.copyWith(
                                      color: Colors.red, fontSize: 12),
                                )
                              ],
                            )
                          : Image.file(imageUploaded),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Ticket Price',
                  style: kSecondary_heading.copyWith(
                      color: Colors.black, fontSize: 20),
                ),
                Column(
                  children: <Widget>[
                    MoneyTextFormField(
                      settings: MoneyTextFormFieldSettings(
                          controller: _longCtrl,
                          moneyFormatSettings: MoneyFormatSettings(
                              currencySymbol: 'MYR',
                              displayFormat: MoneyDisplayFormat.symbolOnRight),
                          appearanceSettings: AppearanceSettings(
                              labelText: 'If free, leave at MYR 0.0',
                              // hintText: 'Custom Placeholder',
                              labelStyle: _ts,
                              inputStyle: _ts.copyWith(color: Colors.orange),
                              formattedStyle:
                                  _ts.copyWith(color: Colors.blue))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Registration link',
                    style: kSecondary_heading.copyWith(
                        color: Colors.black, fontSize: 20)),
                TextFormField(
                  controller: _eventFormController,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    labelText: 'Provide a registration link if any',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Phone Number',
                  style: kSecondary_heading.copyWith(
                      color: Colors.black, fontSize: 20),
                ),
                TextFormField(
                    controller: _eventPhoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number of Person in Charge',
                    ),
                    validator: (value) =>
                        value.isEmpty ? "This is a required field" : null),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Color(0xffD63447),
                    onPressed: () {
                      widget.event.eventName = _eventTitleController.text;
                      widget.event.eventDescription = _eventDescController.text;
                      widget.event.eventPhone = _eventPhoneController.text;
                      widget.event.eventStartDate = _formatDate;
                      widget.event.eventEndDate = _formatEndDate;
                      widget.event.eventStartTime = _formatStartTime;
                      widget.event.eventEndTime = _formatEndTime;
                      widget.event.eventCategory = categoryChoice;
                      widget.event.ticketPrice = _longCtrl.text;
                      widget.event.registrationForm = _eventFormController.text;
                      widget.event.eventLocation = _eventLocController.text;
                      if (imageUploaded != null) {
                        widget.event.imageURL = imageUploaded.toString();
                      }
                      check();
                      setState(() {
                        isSubmitted = true;
                      });

                      Snack();
                    },
                    child: Center(
                        child: Text(
                      'Submit',
                      style: kPrimary_heading,
                    ))),
              ],
            ),
          )),
    );
  }
}

class choiceChipWidget extends StatefulWidget {
  final List<String> reportList;
  final Function(String item) onItemSelected;
  choiceChipWidget(this.reportList, this.onItemSelected);
  @override
  _choiceChipWidgetState createState() => _choiceChipWidgetState();
}

class _choiceChipWidgetState extends State<choiceChipWidget> {
  String selectedChoice = "";
  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
          padding: const EdgeInsets.all(4.0),
          child: ChoiceChip(
              label: Text(item),
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              backgroundColor: Colors.black54,
              selectedColor: Color(0xffFF4949),
              selected: selectedChoice == item,
              onSelected: (selected) {
                setState(() {
                  selectedChoice = item;
                  widget.onItemSelected(selectedChoice);
                });
              })));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
