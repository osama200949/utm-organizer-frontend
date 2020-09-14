import 'package:flutter/material.dart';

class CanvasOrange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BackgroundClipperOrange(),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffff6c3a), Color(0xffff6c3a)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.3,
      ),
    );
  }
}

class CanvasBlack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff535252), Color(0xff111010)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.8,
    );
  }
}

class BackgroundClipperOrange extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - size.height * 0.09);
    var fristEndPoint = new Offset(size.width * 0.17, size.height * 0.7);
    var fristControlPoint = new Offset(size.width * 0.05, size.height * 0.94);
    path.quadraticBezierTo(fristControlPoint.dx, fristControlPoint.dy,
        fristEndPoint.dx, fristEndPoint.dy);

    var sEndPoint = new Offset(size.width * 0.58, size.height * 0.26);
    var sControlPoint = new Offset(size.width * 0.3, size.height * 0.45);
    path.quadraticBezierTo(
        sControlPoint.dx, sControlPoint.dy, sEndPoint.dx, sEndPoint.dy);

    var tEndPoint = new Offset(size.width, 0);
    var tControlPoint = new Offset(size.width * 0.86, size.height * 0.09);
    path.quadraticBezierTo(
        tControlPoint.dx, tControlPoint.dy, tEndPoint.dx, tEndPoint.dy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
