import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utm_orgnization/components/canvas/Canva_home.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:utm_orgnization/services/auth_services.dart';
import 'package:utm_orgnization/utils/FeadAnmation.dart';
import 'package:utm_orgnization/utils/constants.dart';

import '../../dependencies.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email = '';
  String pwd = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode()); //! need to be fixed
        },
        child: Builder(
          builder: (context) => Stack(
            children: <Widget>[
              CanvasRed(),
              CanvasBlack(),
              CanvasOrange(),
              SingleChildScrollView(
                child: Container(
                  // margin: EdgeInsets.fromLTRB(
                  //     20, MediaQuery.of(context).size.height * 0.20, 30, 20),
                  padding: EdgeInsets.only(
                      right: 30,
                      left: 20,
                      top: MediaQuery.of(context).size.height * 0.15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeIn(
                        1,
                        SvgPicture.asset(
                          'images/logos/logo.svg',
                          height: MediaQuery.of(context).size.width * 0.27,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Sign In",
                        style: kPrimary_heading.copyWith(
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: kgreyT_primary,
                        ),
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: kSignInTextField.copyWith(
                          labelText: "Email",
                          prefixIcon: Icon(LineAwesomeIcons.envelope,
                              color: kOrange_primary),
                        ),
                        onChanged: (value) {
                          email = value;
                          print(email);
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: kgreyT_primary,
                        ),
                        autofocus: false,
                        obscureText: true,
                        onChanged: (value) {
                          pwd = value;
                          print(pwd);
                        },
                        decoration: kSignInTextField.copyWith(
                          labelText: "Password",
                          prefixIcon: Icon(LineAwesomeIcons.key,
                              color: kOrange_primary),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        //! The Big Arraow
                        onTap: () async {
                          var user = await service<AuthServices>().signIn(
                            email: email,
                            password: pwd,
                          );

                          if (user is String) {
                            Scaffold.of(context).showSnackBar(_valdation(user));
                          } else {
                            Navigator.pushNamedAndRemoveUntil(
                                context, kMainNv, (_) => false);
                          }
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: BoxDecoration(
                                gradient:
                                    LinearGradient(colors: kBlack_gradient),
                                color: kgrey_primary,
                                shape: BoxShape.circle),
                            height: 90,
                            width: 90,
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () async {
                          Navigator.pushReplacementNamed(context, kSigUpRoute);
                          // await authService.signOut();
                        },
                        child: Text(
                          "Sign up",
                          style: kPrimary_heading.copyWith(
                              color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _valdation(String user) {
    return SnackBar(
      backgroundColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Container(
              child: Text(
                user,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
