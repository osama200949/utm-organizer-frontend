import 'package:flutter/material.dart';

class AddTaskCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    //straign line_first
    path.lineTo(0.0, 80);
    //point to start the curve from_second
    Offset curvePoint1 = Offset(size.width / 2, -50);
    //last point to end the curve in__third
    Offset endPoint = Offset(size.width, 80);
    //auto building curve according to the points given
    path.quadraticBezierTo(
        curvePoint1.dx, curvePoint1.dy, endPoint.dx, endPoint.dy);

    //continue the drawing
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
