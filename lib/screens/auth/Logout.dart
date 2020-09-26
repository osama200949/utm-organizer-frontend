import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/services/auth_services.dart';
import 'package:utm_orgnization/utils/constants.dart';

class LogoutScreen extends StatefulWidget {
  @override
  _LogoutScreenState createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  void initState() async{
    // await Provider.of<AuthServices>(context).signOut();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/signIn'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: kBlack_gradient, begin: Alignment.topLeft),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.11,
              top: MediaQuery.of(context).size.height * 0.2,
            ),
            child: SvgPicture.asset(
              "images/logos/logo.svg",
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.5,
            ),
            child: Center(
              child: Text(
                "You have been successfully logout",
                style: kPrimary_heading.copyWith(
                    color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
