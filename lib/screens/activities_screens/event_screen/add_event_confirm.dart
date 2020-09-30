// import 'dart:async';
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:utm_orgnization/models/event_model/event.dart';
// import 'package:utm_orgnization/utils/constants.dart';
// import 'add_event.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:intl/intl.dart';
// import 'package:url_launcher/url_launcher.dart';

// class NextPage extends StatefulWidget {
//   final Event event;
//   File newimage;
//   bool loading = false;
//   bool submited = false;
//   final db = Firestore.instance;
//   NextPage({Key key, @required this.event, this.newimage}) : super(key: key);
//   @override
//   _NextPageState createState() => _NextPageState();
// }

// class _NextPageState extends State<NextPage> {
//   final db = Firestore.instance;

//   List<Events> event;
//   Future<String> _getImage() async {
//     String url;
//     try {
//       DateTime now = new DateTime.now();
//       var datestamp = new DateFormat("yyyyMMdd'T'HHmmss");
//       String currentdate = datestamp.format(now);
//       File imageFile = widget.newimage;

//       StorageReference ref = FirebaseStorage.instance
//           .ref()
//           .child("images")
//           .child("$currentdate.jpg");
//       StorageUploadTask uploadTask = ref.putFile(imageFile);
//       var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
//       url = dowurl.toString();
//     } catch (error) {
//       print(error);
//     }
//     return url;
//   }

//   Widget checkLink() {
//     if (widget.event.registrationForm == "") {
//       return Text("No registration link available",
//           style: kSecondary_heading_2.copyWith(
//             color: Colors.black,
//           ));
//     } else if (widget.event.registrationForm != "") {
//       return RichText(
//           text: new TextSpan(
//         text: "Registration Link",
//         style: kSecondary_heading_2.copyWith(
//           color: Colors.blue,
//         ),
//         recognizer: new TapGestureRecognizer()
//           ..onTap = () {
//             launch(widget.event.registrationForm);
//           },
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: AppBar(
//         title: new Text("Confirm Event Information",
//             style: kPrimary_heading.copyWith(
//                 fontSize: 20, fontWeight: FontWeight.bold)),
//         backgroundColor: Color(0xffFF4949),
//       ),
//       body: Container(
//         child: Stack(
//           children: <Widget>[
//             Image.file(imageUploaded),
//             Padding(
//                 padding: const EdgeInsets.only(top: 200.0, left: 20.0),
//                 child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                         color: Color(0xffFF4949)),
//                     child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text('${widget.event.eventCategory}',
//                             style: kPrimary_heading_2.copyWith(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ))))),
//             DraggableScrollableSheet(
//               initialChildSize: 0.65,
//               maxChildSize: 0.885,
//               minChildSize: 0.65,
//               builder: (BuildContext context, myscrollController) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20.0),
//                       topRight: Radius.circular(20.0),
//                     ),
//                   ),
//                   child: SingleChildScrollView(
//                     controller: myscrollController,
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           child: Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text('${widget.event.eventName}',
//                                     style: kPrimary_heading_2.copyWith(
//                                         color: Colors.black)),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Text('${widget.event.eventDescription}',
//                                     style: kPrimary_heading_2.copyWith(
//                                         color: Colors.black, fontSize: 16)),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(children: <Widget>[
//                                   Icon(
//                                     Icons.calendar_today,
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text(
//                                       '${widget.event.eventStartDate} - ${widget.event.eventEndDate}',
//                                       style: kPrimary_heading_2.copyWith(
//                                           color: Colors.black, fontSize: 16)),
//                                 ]),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(children: <Widget>[
//                                   Icon(
//                                     Icons.access_time,
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text(
//                                       '${widget.event.eventStartTime} - ${widget.event.eventEndTime}',
//                                       style: kPrimary_heading_2.copyWith(
//                                           color: Colors.black, fontSize: 16)),
//                                 ]),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(
//                                   children: <Widget>[
//                                     Icon(
//                                       Icons.local_phone,
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Text('${widget.event.eventPhone}',
//                                         style: kPrimary_heading_2.copyWith(
//                                             color: Colors.black, fontSize: 16)),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(
//                                   children: <Widget>[
//                                     Icon(
//                                       Icons.location_on,
//                                       color: Colors.black,
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Text('${widget.event.eventLocation}',
//                                         style: kPrimary_heading_2.copyWith(
//                                             color: Colors.black, fontSize: 16)),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(
//                                   children: <Widget>[
//                                     Icon(
//                                       Icons.monetization_on,
//                                       color: Colors.black,
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Text('MYR ${widget.event.ticketPrice}',
//                                         style: kPrimary_heading_2.copyWith(
//                                             color: Colors.black, fontSize: 16)),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(
//                                   children: <Widget>[
//                                     Icon(
//                                       Icons.insert_link,
//                                       color: Colors.black,
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     checkLink(),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 30,
//                                 ),
//                                 Center(
//                                   child: RaisedButton(
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                     ),
//                                     onPressed: () async {
//                                       //save data to firebase
//                                       if (!widget.loading && !widget.submited) {
//                                         setState(() {
//                                           widget.loading = true;
//                                         });
//                                         widget.event.imageURL =
//                                             await _getImage();
//                                         await db
//                                             .collection("eventss")
//                                             .add(widget.event.toJson())
//                                             .whenComplete(() {
//                                           setState(() {
//                                             widget.loading = false;
//                                             widget.submited = true;
//                                           });
//                                           Navigator.pushNamedAndRemoveUntil(
//                                               context,
//                                               kMainNv,
//                                               (route) => false);
//                                         });
//                                       }
//                                     },
//                                     color: Color(0xffD63447),
//                                     child: widget.loading
//                                         ? SizedBox(
//                                             height: 20.0,
//                                             width: 20.0,
//                                             child: CircularProgressIndicator(
//                                               valueColor:
//                                                   AlwaysStoppedAnimation<Color>(
//                                                       Colors.white),
//                                               strokeWidth: 2,
//                                             ),
//                                           )
//                                         : Text(
//                                             widget.submited
//                                                 ? "Form submitted successfully"
//                                                 : 'Submit Event',
//                                             style: kPrimary_heading,
//                                           ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
