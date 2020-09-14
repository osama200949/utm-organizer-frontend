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
            colors: [Color(0xffff6c3a), Color(0xff542a1b)],
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
    return ClipPath(
      clipper: BackgroundClipperBlack(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff535252), Color(0xff111010)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.6,
      ),
    );
  }
}

class CanvasRed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BackgroundClipperRed(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffD63447), Color(0xff6B1A24)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
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

class BackgroundClipperBlack extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.95);

    var fristEndPoint = new Offset(size.width * 0.57, size.height * 0.565);
    var fristControlPoint = new Offset(size.width * 0.27, size.height);
    path.quadraticBezierTo(fristControlPoint.dx, fristControlPoint.dy,
        fristEndPoint.dx, fristEndPoint.dy);

    var sEndPoint = new Offset(size.width, size.height * 0.33);
    var sControlPoint = new Offset(size.width * 0.73, size.height * 0.355);
    path.quadraticBezierTo(
        sControlPoint.dx, sControlPoint.dy, sEndPoint.dx, sEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BackgroundClipperRed extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    var fristEndPoint = new Offset(size.width * 0.7, size.height * 0.85);
    var fristControlPoint = new Offset(size.width * 0.20, size.height * 0.6);
    path.quadraticBezierTo(fristControlPoint.dx, fristControlPoint.dy,
        fristEndPoint.dx, fristEndPoint.dy);

    var sEndPoint = new Offset(size.width, size.height * 0.90);
    var sControlPoint = new Offset(size.width * 0.8, size.height * 0.9);
    path.quadraticBezierTo(
        sControlPoint.dx, sControlPoint.dy, sEndPoint.dx, sEndPoint.dy);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
