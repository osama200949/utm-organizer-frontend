// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:utm_orgnization/data/data.dart';
// import 'package:utm_orgnization/utils/constants.dart';

// class Events extends StatefulWidget {
//   @override
//   _EventsState createState() => _EventsState();
// }

// class _EventsState extends State<Events> {
//   var _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.fromLTRB(15, 10, 0, 15),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               "Recent Events",
//               style: kPrimary_heading.copyWith(color: Colors.black),
//             ),
//           ),
//         ),
//         Container(
//           height: 400,
//           child: RotatedBox(
//             quarterTurns: 3,
//             child: GestureDetector(
//               onTap: () => print(_selectedIndex),
//               child: ListWheelScrollView(
//                 onSelectedItemChanged: (index) => _selectedIndex = index,
//                 diameterRatio: 5.2,
//                 itemExtent: 180,
//                 squeeze: 0.8,
//                 children: List<EventCard>.generate(
//                   events.length,
//                   (index) => EventCard(
//                     eventTitle: events[index].eventName,
//                     eventDate: events[index].eventStartDate,
//                     imagePath: events[index].imageURL,
//                     eventPrice: "20",
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class EventCard extends StatelessWidget {
//   const EventCard(
//       {this.imagePath, this.eventTitle, this.eventDate, this.eventPrice});

//   final eventTitle;
//   final eventDate;
//   final imagePath;
//   final eventPrice;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 400,
//       child: RotatedBox(
//         quarterTurns: 1,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               width: 400,
//               height: 250,
//               decoration: BoxDecoration(
//                 color: Color(0xffffffff),
//                 boxShadow: [
//                   BoxShadow(
//                     offset: Offset(0.00, 3.00),
//                     color: Color(0xff000000).withOpacity(0.09),
//                     blurRadius: 15,
//                   ),
//                 ],
//               ),
//               child: ClipRRect(
//                 child: Image(
//                   image: NetworkImage(
//                     imagePath,
//                     scale: 1,
//                   ),
//                   height: 200.0,
//                   width: 200.0,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 5),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       eventTitle,
//                       overflow: TextOverflow.fade,
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 20,
//                           color: Color(0xff000000),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 3,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           eventDate,
//                           style: GoogleFonts.raleway(
//                             textStyle: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                               color: Color(0xff8F8F8F),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: <Widget>[
//                           // SvgPicture.asset(
//                           //   imagePath,
//                           //   color: Color(0xffD63447),
//                           // ),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           Text(
//                             eventPrice,
//                             overflow: TextOverflow.ellipsis,
//                             style: GoogleFonts.raleway(
//                               textStyle: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                                 color: Color(0xffD63447),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: <Widget>[
//                       SizedBox(
//                         width: 40,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
