// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:utm_orgnization/models/provider/meeting_data.dart';

// import '../../../utils/constants.dart';

// class TaskDate extends StatefulWidget {
//   MeetingData meetingData;
//   TaskDate(this.meetingData);
//   @override
//   TaskDateState createState() => TaskDateState();
// }

// class TaskDateState extends State<TaskDate> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             Icon(
//               Icons.calendar_today,
//               size: 25,
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Text(
//               'Date',
//               style: kPrimary_heading.copyWith(
//                 fontSize: 18,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         GestureDetector(
//           child: Container(
//             width: 120,
//             padding: EdgeInsets.only(bottom: 10),
//             decoration: BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(
//                   color: Colors.black,
//                   width: 0.5,
//                 ),
//               ),
//             ),
//             child: Text(
//               DateFormat('dd-MM-yyyy').format(
//                 widget.meetingData.dateFrom != DateTime.now()
//                     ? widget.meetingData.dateFrom
//                     : widget.meetingData.getEventToBeShown().dateClass.dateFrom,
//               ),
//               style: kPrimary_heading.copyWith(
//                 fontSize: 16,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           onTap: () {
//             showModalBottomSheet(
//               context: context,
//               builder: (_) => Column(
//                 children: <Widget>[
//                   SizedBox(
//                     height: 300,
//                     child: CupertinoDatePicker(
//                       initialDateTime: widget.meetingData
//                                   .getEventToBeShown()
//                                   .dateClass
//                                   .dateFrom ==
//                               null
//                           ? DateTime.now()
//                           : widget.meetingData.dateFrom,
//                       minimumYear: DateTime.now().year,
//                       maximumYear: DateTime.now().year + 5,
//                       mode: CupertinoDatePickerMode.date,
//                       onDateTimeChanged: (date) {
//                         widget.meetingData.setDateFrom = date;
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 30, right: 30),
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {});
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                         height: 70,
//                         child: Center(
//                             child: Text(
//                           'Confirm',
//                           style: TextStyle(
//                               fontSize: 30,
//                               color: Colors.white,
//                               fontFamily: 'Muli'),
//                         )),
//                         decoration: BoxDecoration(
//                           color: Color(0xffD63447),
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
