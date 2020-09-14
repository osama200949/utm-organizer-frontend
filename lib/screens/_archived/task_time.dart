// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:intl/intl.dart';
// import 'package:utm_orgnization/models/provider/meeting_data.dart';

// import '../../../utils/constants.dart';

// class TaskTime extends StatefulWidget {
//   MeetingData meetingData;
//   TaskTime(this.meetingData);
//   @override
//   _TaskTimeState createState() => _TaskTimeState();
// }

// class _TaskTimeState extends State<TaskTime> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'From',
//               style: kPrimary_heading.copyWith(
//                 fontSize: 18,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             GestureDetector(
//               child: Container(
//                 padding: EdgeInsets.only(bottom: 10),
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(
//                       color: Colors.black,
//                       width: 0.5,
//                     ),
//                   ),
//                 ),
//                 child: Text(
//                   DateFormat('hh:mm a').format(
//                     widget.meetingData.dateFrom,
//                   ),
//                   style: kPrimary_heading.copyWith(
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               // child: Text( '${widget.meetingData.date.weekday}'),
//               onTap: () {
//                 showModalBottomSheet(
//                   isScrollControlled: false,
//                   context: context,
//                   builder: (_) => Column(
//                     children: <Widget>[
//                       SizedBox(
//                         height: 300,
//                         child: CupertinoDatePicker(
//                           initialDateTime:   widget.meetingData.getEventToBeShown().dateClass.dateFrom== null
//                               ? DateTime.now()
//                               : widget.meetingData.dateFrom,
//                           minimumYear: DateTime.now().year,
//                           maximumYear: DateTime.now().year + 5,
//                           mode: CupertinoDatePickerMode.time,
//                           onDateTimeChanged: (date) {
//                             widget.meetingData.setDateFrom = date;
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 30, right: 30),
//                         child: GestureDetector(
//                           //! update date
//                           onTap: () {
                            
//                             widget.meetingData.deleteCurrentEventToBeShown();
//                             widget.meetingData.addTask();
//                             setState(() {});
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                             // width: 450,
//                             height: 70,
//                             child: Center(
//                                 child: Text(
//                               'Confirm',
//                               style: TextStyle(
//                                   fontSize: 30,
//                                   color: Colors.white,
//                                   fontFamily: 'Muli'),
//                             )),
//                             decoration: BoxDecoration(
//                               color: Color(0xffD63447),
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(10),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//         SizedBox(
//           width: 25,
//         ),
//         Column(
//           children: <Widget>[
//             Text(
//               'To',
//               style: kPrimary_heading.copyWith(
//                 fontSize: 18,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             GestureDetector(
//               child: Container(
//                 padding: EdgeInsets.only(bottom: 10),
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(
//                       color: Colors.black,
//                       width: 0.5,
//                     ),
//                   ),
//                 ),
//                 child: Text(
//                   DateFormat('hh:mm a').format(widget.meetingData.dateTo),
//                   style: kPrimary_heading.copyWith(
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               // child: Text( '${widget.meetingData.date.weekday}'),
//               onTap: () {
//                 showModalBottomSheet(
//                   isScrollControlled: false,
//                   context: context,
//                   builder: (_) => Column(
//                     children: <Widget>[
//                       SizedBox(
//                         height: 300,
//                         child: CupertinoDatePicker(
//                           initialDateTime: widget.meetingData.dateTo == null
//                               ? DateTime.now()
//                               : widget.meetingData.dateTo,
//                           minimumYear: DateTime.now().year,
//                           maximumYear: DateTime.now().year + 5,
//                           mode: CupertinoDatePickerMode.time,
//                           onDateTimeChanged: (date) {
//                             widget.meetingData.setDateTo = date;
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 30, right: 30),
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {});
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                             // width: 450,
//                             height: 70,
//                             child: Center(
//                                 child: Text(
//                               'Confirm',
//                               style: TextStyle(
//                                   fontSize: 30,
//                                   color: Colors.white,
//                                   fontFamily: 'Muli'),
//                             )),
//                             decoration: BoxDecoration(
//                               color: Color(0xffD63447),
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(10),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
