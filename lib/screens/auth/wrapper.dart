import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/models/user.dart';
import 'package:utm_orgnization/screens/auth/sign_in_screen.dart';

import 'package:utm_orgnization/utils/main_navgation.dart';


class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user != null) {
      return MainNavigation();
    } else {
      return SignInScreen();
    }
  }
}
