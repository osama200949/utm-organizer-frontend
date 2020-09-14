import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utm_orgnization/components/canvas/Canves_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utm_orgnization/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _getBoolFromSharedPref() async {
    /*
  Author Credit :Ibrahim Katari
    _getBoolFromSharedPref
  */
    final prefs = await SharedPreferences.getInstance();
    final isFristTime = prefs.getBool('FristTime');

    Timer timer;
    if (isFristTime != null && !isFristTime) {
      timer = Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, kWrapper),
      );
    } else {
      prefs.setBool('FristTime', false);
      timer = Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, kChoseScreenRoute),
      );
    }
  }

  @override
  void initState() {
    _getBoolFromSharedPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            CanvaSplash(),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff535252), Color(0xff131212)],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.71,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: kOrange_primary),
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xff535252), Color(0xff131212)]),
                ),
              ),
            ),
            Hero(
              tag: "Logo",
              child: Center(
                child: SvgPicture.asset(
                  'images/logos/logo.svg',
                  height: MediaQuery.of(context).size.width * 0.32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
