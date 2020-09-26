// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:utm_orgnization/screens/profile_screens/about_screen.dart';
// import 'package:utm_orgnization/screens/profile_screens/edit_profile_screen.dart';
// import 'package:utm_orgnization/screens/profile_screens/help_screen.dart';
// import 'package:utm_orgnization/services/auth_services.dart';

// Widget settings({context, constraints}) {
//   return Container(
//     color: Colors.white,
//     child: ListView(
//       children: <Widget>[
//         Container(
//           alignment: Alignment.center,
//           margin: EdgeInsets.only(top: 20),
//           child: Text(
//             "Settings",
//             style: TextStyle(
//               fontSize: 30,
//               fontFamily: 'Muli',
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Center(
//           child: Container(
//             margin: EdgeInsets.symmetric(vertical: 20),
//             height: constraints.maxHeight,
//             color: Colors.white,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           RaisedButton(
//                             color: Colors.white,
//                             elevation: 0,
//                             child: ButtonBar(
//                               children: <Widget>[
//                                 //!Problem with FontAwesomeIcons
//                                 Icon(
//                                   FontAwesomeIcons.solidUserCircle,
//                                   size: 34,
//                                 ),
//                                 SizedBox(
//                                   width: 13,
//                                 ),
//                                 Text(
//                                   "Profile Info",
//                                   style: TextStyle(
//                                     fontFamily: 'Muli',
//                                     fontSize: 23,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => EditProfile()),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Builder(
//                             builder: (context) => RaisedButton(
//                               color: Colors.white,
//                               elevation: 0,
//                               child: ButtonBar(
//                                 children: <Widget>[
//                                   Icon(
//                                     FontAwesomeIcons.lock,
//                                     size: 34,
//                                   ),
//                                   SizedBox(
//                                     width: 13,
//                                   ),
//                                   Text(
//                                     "Privacy Policy",
//                                     style: TextStyle(
//                                       fontFamily: 'Muli',
//                                       fontSize: 23,
//                                       color: Colors.black,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               onPressed: () {
//                                 Scaffold.of(context).openDrawer();
//                                 Scaffold.of(context).showSnackBar(
//                                   SnackBar(
//                                     duration: Duration(seconds: 5),
//                                     backgroundColor: Colors.white,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(20),
//                                         topRight: Radius.circular(20),
//                                       ),
//                                     ),
//                                     content: Container(
//                                       height: constraints.maxHeight * 0.5,
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                       ),
//                                       child: Column(
//                                         children: <Widget>[
//                                           Icon(
//                                             Icons.arrow_drop_down,
//                                             color: Colors.black,
//                                           ),
//                                           Row(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: <Widget>[
//                                               Text(
//                                                 "Privacy Policy",
//                                                 style: TextStyle(
//                                                   fontSize: 24,
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.black,
//                                                 ),
//                                               ),
//                                               // RaisedButton(
//                                               //   color: Colors.white,
//                                               //   elevation: 0,
//                                               //   splashColor: Colors.white,
//                                               //   child: Icon(
//                                               //     Icons.close,
//                                               //     color: Colors.black,
//                                               //   ),
//                                               //   onPressed: () {  },
//                                               // ),
//                                             ],
//                                           ),
//                                           Spacer(
//                                             flex: 1,
//                                           ),
//                                           Spacer(
//                                             flex: 1,
//                                           ),
//                                           Text(
//                                             "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed",
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                               fontSize: 20,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                           Spacer(
//                                             flex: 1,
//                                           ),
//                                           Text(
//                                             "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duoLorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duoam et justo duo",
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                               fontSize: 12,
//                                               color: Color(0xFFA0A0A0),
//                                             ),
//                                           ),
//                                           Spacer(
//                                             flex: 8,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           RaisedButton(
//                             color: Colors.white,
//                             elevation: 0,
//                             child: ButtonBar(
//                               children: <Widget>[
//                                 //!Problem with FontAwesomeIcons
//                                 Icon(
//                                   FontAwesomeIcons.questionCircle,
//                                   size: 34,
//                                 ),
//                                 SizedBox(
//                                   width: 13,
//                                 ),
//                                 Text(
//                                   "Need Help?",
//                                   style: TextStyle(
//                                     fontFamily: 'Muli',
//                                     fontSize: 23,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => HelpScreen()),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           RaisedButton(
//                             color: Colors.white,
//                             elevation: 0,
//                             child: ButtonBar(
//                               children: <Widget>[
//                                 Icon(
//                                   FontAwesomeIcons.infoCircle,
//                                   size: 34,
//                                 ),
//                                 SizedBox(
//                                   width: 13,
//                                 ),
//                                 Text(
//                                   "About Us",
//                                   style: TextStyle(
//                                     fontFamily: 'Muli',
//                                     fontSize: 23,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => AboutScreen(),
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     RaisedButton(
//                       color: Colors.white,
//                       elevation: 0,
//                       child: ButtonBar(
//                         children: <Widget>[
//                           Icon(FontAwesomeIcons.signOutAlt),
//                           SizedBox(
//                             width: 13,
//                           ),
//                           Text(
//                             "Logout",
//                             style: TextStyle(
//                               fontFamily: 'Muli',
//                               fontSize: 23,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                       onPressed: () async {
//                         await Provider.of<AuthServices>(context).signOut();
//                         // Provider.of<AuthServices>(context).setIsAuthnticated =
//                         //     false;
//                         Navigator.pushReplacementNamed(context, '/Logout');
//                       },
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 100,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
