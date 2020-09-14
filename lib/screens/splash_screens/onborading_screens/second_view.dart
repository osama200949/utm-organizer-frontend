import 'package:flare_flutter/flare_actor.dart';
// Osama Work

import 'package:flutter/material.dart';
import 'package:utm_orgnization/components/canvas/Canvas_view.dart';
import 'package:utm_orgnization/utils/constants.dart';

class SecondView extends StatelessWidget {
  // Osama Work
  String animationName = 'startFade';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: CanvaView(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffD63447), Color(0xffF47851)]),
              ),
              child: Container(
                // Osama Work
                child: FlareActor(
                  // Osama Work
                  'assets/second_splash.flr',
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  animation: animationName,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
            child: Column(
              children: <Widget>[
                Text(
                  'Have a clear schedule that\nFITs your personal needs',
                  style: kPrimary_heading.copyWith(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'All the classes, events, and clubs are going to be organized into one Timeline ',
                  style: kPrimary_heading_2.copyWith(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
