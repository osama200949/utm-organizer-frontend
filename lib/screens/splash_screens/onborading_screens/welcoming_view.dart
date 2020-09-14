import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:utm_orgnization/screens/splash_screens/onborading_screens/second_view.dart';
import 'package:utm_orgnization/screens/splash_screens/onborading_screens/third_view.dart';
import 'package:utm_orgnization/utils/constants.dart';

import 'first_view.dart';

class WelcomingView extends StatefulWidget {
  @override
  _WelcomingViewState createState() => _WelcomingViewState();
}

class _WelcomingViewState extends State<WelcomingView> {
  final pageIndexNotifier = ValueNotifier<int>(0);

  List<Widget> welcomeScreens = [
    FirstView(),
    SecondView(),
    ThirdView(),
  ];

  @override
  Widget build(BuildContext context) {
    int tracker = 0;

    return Scaffold(
      body: Stack(
        alignment: FractionalOffset.bottomCenter,
        children: <Widget>[
          PageView.builder(
              onPageChanged: (index) {
                tracker = index;
                pageIndexNotifier.value = tracker;
              },
              itemCount: welcomeScreens.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                tracker = index;
                return welcomeScreens[tracker];
              }),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/signIn', (_) => false);
                  },
                  child: Text('SKIP',
                      style: kPrimary_heading_2.copyWith(
                          color: Colors.grey, fontSize: 15)),
                ),
                _buildExample1(),
                Text(
                  '        ',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffA0A0A0),
                    fontFamily: 'CapriolaRegular',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  PageViewIndicator _buildExample1() {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      indicatorPadding: const EdgeInsets.all(0),
      length: welcomeScreens.length,
      normalBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInCirc,
        ),
        child: Container(
          width: 20,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffF6EEDF),
          ),
        ),
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOutExpo,
        ),
        child: Container(
          width: 25,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            color: whiteBrown,
          ),
        ),
      ),
    );
  }
}
