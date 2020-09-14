import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utm_orgnization/utils/constants.dart';


class ChoseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: CanvaSplash(),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffD63447),
                            Color(0xffF47851),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
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
                            border:
                                Border.all(width: 3, color: kOrange_primary),
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
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Spacer(
                    flex: 70,
                  ),
                  GestureDetector(
                    onTap: () {

                      Navigator.pushReplacementNamed(context, '/WelcomingView');
                    },
                    child: Container(

                      width: MediaQuery.of(context).size.width * 0.65,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: Center(
                        child: Text(
                          "New Onboard",
                          style: kPrimary_heading,
                        ),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: kBtn_gradient,
                        ),
                        // color: Colors.red,

                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                                            Navigator.pushReplacementNamed(context, '/signIn');

                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: Center(
                        child: Text(
                          "LOGIN",
                          style: kPrimary_heading.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        border: Border.all(
                            width: 2,
                            color: Color(0xffD63447),
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CanvaSplash extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = Offset(size.width * 0.12, size.height * 0.80);
    var firstEndPoint = Offset(size.width * 0.50, size.height * 0.85);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.80, size.height * 1.1);
    var secondEndPoint = Offset(size.width, size.height * 0.90);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
