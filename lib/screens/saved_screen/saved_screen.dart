import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/components/appbar_widget.dart';
import 'package:utm_orgnization/components/canvas/Canva_home.dart';
import 'package:utm_orgnization/data/clubData.dart';
import 'package:utm_orgnization/screens/home_screen/widget/home/club_widget.dart';
import 'package:utm_orgnization/utils/constants.dart';

class SavedScreen extends StatelessWidget with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   extendBodyBehindAppBar: true,
    //   appBar: TopAppBar(
    //     appBar: AppBar(),
    //   ),
    //   body: Stack(
    //     children: <Widget>[
    //       CanvasRed(),
    //       CanvasBlack(),
    //       CanvasOrange(),
    //       SafeArea(
    //         child: Align(
    //           alignment: Alignment.bottomCenter,
    //           child: Container(
    //             height: MediaQuery.of(context).size.height * 0.70,
    //             width: MediaQuery.of(context).size.width,
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(25.0),
    //                 topRight: Radius.circular(25.0),
    //               ),
    //             ),
    //             child: SingleChildScrollView(
    //               child: Column(
    //                 children: <Widget>[
    //                   Padding(
    //                     padding: EdgeInsets.only(
    //                       left: 30,
    //                       top: 30,
    //                     ),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       children: <Widget>[
    //                         Icon(
    //                           Icons.favorite,
    //                           size: 40,
    //                           color: kRead_primary,
    //                         ),
    //                         SizedBox(
    //                           width: 20,
    //                         ),
    //                         Text(
    //                           "Saved",
    //                           style: kPrimary_heading.copyWith(
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 15,
    //                   ),
    //                   Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: <Widget>[
    //                       Text("dss"),
    //                       SizedBox(
    //                         width: MediaQuery.of(context).size.width,
    //                         height: 200,
    //                         child: ListView.builder(
    //                           padding: EdgeInsets.only(left: 15),
    //                           scrollDirection: Axis.horizontal,
    //                           itemCount:
    //                               Provider.of<ClubData>(context).clubCount,
    //                           itemBuilder: (context, index) {
    //                             return Club_card(
    //                               club: Provider.of<ClubData>(context)
    //                                   .clubs[index],
    //                             );
    //                           },
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   SizedBox(
    //                     height: 15,
    //                   ),
    //                   Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: <Widget>[
    //                       Text("dss"),
    //                       SizedBox(
    //                         width: MediaQuery.of(context).size.width,
    //                         height: 200,
    //                         child: ListView.builder(
    //                           padding: EdgeInsets.only(left: 15),
    //                           scrollDirection: Axis.horizontal,
    //                           itemCount:
    //                               Provider.of<ClubData>(context).clubCount,
    //                           itemBuilder: (context, index) {
    //                             return Club_card(
    //                               club: Provider.of<ClubData>(context)
    //                                   .clubs[index],
    //                             );
    //                           },
    //                         ),
    //                       ),
    //                     ],
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
