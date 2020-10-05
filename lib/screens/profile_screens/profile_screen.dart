import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/components/appbar_widget.dart';
import 'package:utm_orgnization/components/canvas/Canvas_profile.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:utm_orgnization/dependencies.dart';
import 'package:utm_orgnization/models/user.dart';
import 'package:utm_orgnization/services/auth_services.dart';
import 'package:utm_orgnization/utils/constants.dart';

import '../../utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: TopAppBar(
          appBar: AppBar(),
        ),
        body: Consumer<User>(builder: (_, user, __) {
          // if (user == null) {
          //   return Center(
              
          //     child: CircularProgressIndicator(),
          //   );
          // }
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                    child: Stack(
                      children: <Widget>[
                        CanvasBlack(),
                        // CanvasOrange(),
                        SafeArea(
                          child: Container(
                            width: constraints.maxWidth,
                            padding: EdgeInsets.fromLTRB(22.0, 0, 22.0, 22.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 90,
                                      child: Stack(
                                        children: <Widget>[
                                          CircleAvatar(
                                            backgroundImage:
                                                NetworkImage(user.photoUrl),
                                            radius: 40,
                                          ),
                                          // Positioned(
                                          //   left: 80.62 - 20,
                                          //   top: 80.62 - 30,
                                          //   child: SvgPicture.asset(
                                          //     'images/settings/camera.svg',
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      user.displayName,
                                      style: kPrimary_heading,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                EditProfile(),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 350,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "settings",
                              style: kPrimary_heading_3.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Show Notification",
                              style: kPrimary_heading.copyWith(
                                fontFamily: 'Raleway',
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              height: 35,
                              child: LiteRollingSwitch(
                                //initial value
                                value: true,
                                textOn: '    ON',
                                textOff: '    OFF',
                                colorOn: Colors.greenAccent[700],
                                colorOff: Colors.redAccent[700],
                                iconOn: Icons.done,
                                iconOff: Icons.remove_circle_outline,
                                textSize: 16.0,

                                onChanged: (bool state) {
                                  //Use it to manage the different states
                                  print('Current State of SWITCH IS: $state');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 45.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  "images/settings/awesome-lock.svg",
                                  height: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Privacy Policy",
                                  style: kPrimary_heading.copyWith(
                                      color: Colors.black, fontSize: 20),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  "images/settings/feather-help-circle4.svg",
                                  height: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Need help ? ",
                                  style: kPrimary_heading.copyWith(
                                      color: Colors.black, fontSize: 20),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  "images/settings/utm-logo.svg",
                                  height: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "about us ",
                                  style: kPrimary_heading.copyWith(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 35,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async{
                        await service<AuthServices>().signOut();
                        Navigator.pushNamedAndRemoveUntil(context, kSignInRoute, (route) => false);
                        },
                        child: Container(
                          color: Colors.black12,
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 35),
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      "images/settings/open-account-logout.svg",
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Logout",
                                      style: kPrimary_heading.copyWith(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffEAEAEA),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  var displayName = "";
  var email = "";
  var password = "";

  String error = '';
  var isEnabled = false;
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
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Consumer<User>(
        builder: (_, user, __) {
          return Container(
            width: MediaQuery.of(context).size.width - 50,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Profile",
                        style: kPrimary_heading_3.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isEnabled = !isEnabled;
                          });
                        },
                        child: Icon(
                          Icons.edit,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: TextFormField(
                    initialValue: user.displayName,
                    enabled: isEnabled,
                    decoration: InputDecoration(hintText: 'your name'),
                    validator: (val) =>
                        val.length < 5 ? 'enter your name :' : null,
                    onChanged: (val) {
                      setState(() => displayName = val);
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: TextFormField(
                    obscureText: true,
                    decoration:
                        InputDecoration(hintText: ' Enter your Password'),
                    enabled: isEnabled,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    validator: (val) => val.length < 5
                        ? 'new password can not be less thant 6'
                        : null,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: TextFormField(
                    initialValue: user.email,
                    enabled: isEnabled,
                    decoration: InputDecoration(hintText: 'your Email'),
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                isEnabled == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 40),
                              child: Text(
                                'confiram',
                                style: kPrimary_heading,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffD63447),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                            ),
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                if (displayName.length <= 0 &&
                                    email.length <= 0) {
                                  displayName =
                                      Provider.of<User>(context, listen: false)
                                          .displayName;
                                  email =
                                      Provider.of<User>(context, listen: false)
                                          .email;
                                } else if (displayName.length <= 0) {
                                  displayName =
                                      Provider.of<User>(context, listen: false)
                                          .displayName;
                                } else if (email.length <= 0) {
                                  email =
                                      Provider.of<User>(context, listen: false)
                                          .email;
                                }

                                var user = await service<AuthServices>()
                                    .updateProfile(
                                        displayName: displayName,
                                        email: email,
                                        password: password,
                                        uid: Provider.of<User>(context,
                                                listen: false)
                                            .uid,
                                        context: context);
                                print(user.data["repeat_message"]);
                                if (user.data["isError"] == true) {
                                  Scaffold.of(context).showSnackBar(
                                    _valdation(user.data["repeat_message"]),
                                  );
                                } else if (user.data["isError"] == false) {
                                  print('hi');
                                  Scaffold.of(context).showSnackBar(
                                    _valdation("updated successfully"),
                                  );
                                }
                              }
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () => setState(() => isEnabled = false),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 30),
                              child: Text(
                                'Cancel',
                                style: kPrimary_heading,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffA0A0A0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Text(" "),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xffEAEAEA),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
          );
        },
      ),
    );
  }
}
