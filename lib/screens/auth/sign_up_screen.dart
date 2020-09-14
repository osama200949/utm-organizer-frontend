import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:utm_orgnization/components/canvas/Canvas_registartions.dart';
import 'package:utm_orgnization/dependencies.dart';
import 'package:utm_orgnization/services/auth_services.dart';
import 'package:utm_orgnization/utils/constants.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isCliked = true;
  String email = '';
  String displayName = '';
  String pwd = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: Center(
            child: Stack(
              children: <Widget>[
                Transform.scale(scale: 2.1, child: CanvasRed()),
                CanvasBlack(),
                SingleChildScrollView(
                  child: Container(
                    // margin: EdgeInsets.fromLTRB(40, 30, 40, 10),
                    padding: EdgeInsets.fromLTRB(40, 30, 40, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Create                                             Account",
                          style: kPrimary_heading.copyWith(fontSize: 40),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Profile Information",
                          style: kSecondary_heading.copyWith(fontSize: 24),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          autofocus: false,
                          maxLength: 22,
                          decoration: kSignUpTextField.copyWith(
                            labelText: "Name",
                            prefixIcon: Icon(
                              LineAwesomeIcons.user,
                              color: Colors.white,
                            ),
                          ),
                          onChanged: (value) => displayName = value,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          autofocus: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: kSignUpTextField.copyWith(
                            labelText: "Email",
                            prefixIcon: Icon(
                              LineAwesomeIcons.envelope,
                              color: Colors.white,
                            ),
                          ),
                          onChanged: (value) => email = value,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          autofocus: false,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          decoration: kSignUpTextField.copyWith(
                            labelText: "Password",
                            prefixIcon: Icon(
                              LineAwesomeIcons.key,
                              color: Colors.white,
                            ),
                          ),
                          onChanged: (value) => pwd = value,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 20),
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isCliked
                                        ? isCliked = isCliked
                                        : isCliked = !isCliked;
                                  });
                                  print(isCliked);
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.21,
                                  height:
                                      MediaQuery.of(context).size.height * 0.14,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: isCliked
                                          ? kGender_Active
                                          : kGender_disable,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    color: kOrange_primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        'images/icons/ionic-ios-male.svg',
                                        color: isCliked
                                            ? Colors.white
                                            : Colors.black,
                                        height: 40,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Male",
                                        style: kSecondary_heading.copyWith(
                                          color: isCliked
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isCliked
                                        ? isCliked = !isCliked
                                        : isCliked = isCliked;
                                  });
                                  print(isCliked);
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.21,
                                  height:
                                      MediaQuery.of(context).size.height * 0.14,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: isCliked
                                          ? kGender_disable
                                          : kGender_Active,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    color: kOrange_primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        'images/icons/ionic-ios-female.svg',
                                        color: isCliked
                                            ? Colors.black
                                            : Colors.white,
                                        height: 40,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Female",
                                        style: kSecondary_heading.copyWith(
                                          color: isCliked
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            var user = await service<AuthServices>().signUp(
                              email: email,
                              displayName: displayName,
                              password: pwd,
                              gender: isCliked,
                            );
                            print(user.data);
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
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/signIn');
                          },
                          child: Text(
                            "Sign In",
                            style: kPrimary_heading.copyWith(
                                color: Colors.white, fontSize: 20),
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
      ),
    );
  }
}
