// // import 'dart:math';

// // import 'package:flutter/material.dart';
// // import 'package:utm_orgnization/data/data.dart';
// // import 'package:utm_orgnization/utils/constants.dart';

// // var cardAspectRatio = 12.0 / 16.0;
// // var widgetAsprectRatio = cardAspectRatio * 1.2;

// // class Event_widget extends StatefulWidget {
// //   @override
// //   _Event_widgetState createState() => _Event_widgetState();
// // }

// // class _Event_widgetState extends State<Event_widget> {
// //   var currentPage = events.length - 1.0;
// //   @override
// //   Widget build(BuildContext context) {
// //     PageController controller = PageController(initialPage: events.length);
// //     controller.addListener(() {
// //       setState(() {
// //         currentPage = controller.page;
// //       });
// //     });
// //     return Center(
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: <Widget>[
// //           Padding(
// //             padding: const EdgeInsets.fromLTRB(15, 15, 0, 10),
// //             child: Align(
// //               alignment: Alignment.centerLeft,
// //               child: Text(
// //                 "Recent Events",
// //                 style: kPrimary_heading.copyWith(
// //                   color: Colors.black,
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Center(
// //             child: Container(
// //               height: MediaQuery.of(context).size.height * 0.8,
// //               width: MediaQuery.of(context).size.width,
// //               child: Stack(
// //                 children: <Widget>[
// //                   CardScrollWidget(
// //                     currentPage: currentPage,
// //                   ),
// //                   Positioned.fill(
// //                     child: PageView.builder(
// //                       itemCount: events.length,
// //                       controller: controller,
// //                       reverse: true,
// //                       itemBuilder: (context, index) {
// //                         return Container(
// //                           child: GestureDetector(
// //                             onTap: () {
// //                               setState(() {
// //                                 Navigator.pushNamed(
// //                                   context,
// //                                   kEventInfoRoute,
// //                                   arguments: events[index],
// //                                 );
// //                               });
// //                             },
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class CardScrollWidget extends StatefulWidget {
// //   final currentPage;
// //   final onTap;

// //   CardScrollWidget({this.currentPage, this.onTap});

// //   @override
// //   _CardScrollWidgetState createState() => _CardScrollWidgetState();
// // }

// // class _CardScrollWidgetState extends State<CardScrollWidget> {
// //   final padding = 30.0;

// //   final verticalInset = 20.0;

// //   @override
// //   Widget build(BuildContext context) {
// //     return AspectRatio(
// //       aspectRatio: widgetAsprectRatio,
// //       child: LayoutBuilder(
// //         builder: (context, constraints) {
// //           var width = constraints.maxWidth;
// //           var highet = constraints.minHeight;

// //           var safeWidth = width - 2 * padding;
// //           var safeHeight = highet - 2 * padding;

// //           var heightOfPrimaryCard = safeHeight;
// //           var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

// //           var primaryCardLeft = safeWidth - widthOfPrimaryCard;
// //           var horizontalInset = primaryCardLeft / 2;

// //           List<Widget> cardList = new List();
// //           for (var i = 0; i < events.length; i++) {
// //             var delta = i - widget.currentPage;
// //             bool isOnRight = delta > 0;
// //             var start = padding +
// //                 max(
// //                   primaryCardLeft -
// //                       horizontalInset * -delta * (isOnRight ? 15 : 1),
// //                   0.0,
// //                 );
// //             var cardItem = Positioned.directional(
// //               textDirection: TextDirection.rtl,
// //               start: start,
// //               top: padding + verticalInset * max(-delta, 0.0),
// //               bottom: padding + verticalInset * max(-delta, 0.0),
// //               child: Container(
// //                 decoration: BoxDecoration(
// //                   color: kOrange_primary,
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: Colors.black12,
// //                       offset: Offset(3.0, 6.0),
// //                       blurRadius: 10.0,
// //                     )
// //                   ],
// //                 ),
// //                 child: ClipRRect(
// //                   child: AspectRatio(
// //                     aspectRatio: cardAspectRatio,
// //                     child: Stack(
// //                       fit: StackFit.expand,
// //                       children: <Widget>[
// //                         Image.network(
// //                           events[i].imageURL,
// //                           fit: BoxFit.cover,
// //                         ),
// //                         Container(
// //                           color: Color(0x66000000),
// //                         ),
// //                         Container(
// //                           padding: EdgeInsets.all(20),
// //                           child: Column(
// //                             mainAxisAlignment: MainAxisAlignment.end,
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: <Widget>[
// //                               Text(
// //                                 events[i].eventName,
// //                                 style: kPrimary_heading,
// //                               ),
// //                               SizedBox(
// //                                 height: 10,
// //                               ),
// //                               Text(
// //                                 events[i].eventStartDate +
// //                                     " " +
// //                                     events[i].eventStartTime,
// //                                 style: kPrimary_heading_3.copyWith(
// //                                   fontSize: 16,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         )
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             );
// //             cardList.add(cardItem);
// //           }
// //           return Stack(
// //             children: cardList,
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:utm_orgnization/data/data.dart';
// import 'package:utm_orgnization/utils/constants.dart';

// class Event_widget extends StatefulWidget {
//   @override
//   _Event_widgetState createState() => _Event_widgetState();
// }

// class _Event_widgetState extends State<Event_widget> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       width: MediaQuery.of(context).size.width,
//       child: ListView.builder(
//         shrinkWrap: true,
//         padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//         scrollDirection: Axis.horizontal,
//         itemCount: events.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.of(context).pushNamed(
//                 kEventInfoRoute,
//                 arguments: events[index],
//               );
//             },
//             child: Container(
//               padding: const EdgeInsets.all(8.0),
//               child: Stack(
//                 children: <Widget>[
//                   Image.network(
//                     events[index].imageURL,
//                     fit: BoxFit.fill,
//                     color: Colors.black38,
//                     colorBlendMode: BlendMode.darken,
//                   ),
//                   Container(
//                     height: 300,
//                     width: 200,
//                     child: Padding(
//                       padding: const EdgeInsets.all(30.0),
//                       child: Align(
//                         alignment: Alignment.bottomLeft,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: <Widget>[
//                             Text(
//                               events[index].eventName,
//                               style: kPrimary_heading.copyWith(fontSize: 19),
//                             ),
//                             Text(
//                               events[index].eventEndTime,
//                               style: kPrimary_heading.copyWith(fontSize: 19),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
