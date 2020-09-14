import 'package:flutter/material.dart';

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
        height: MediaQuery.of(context).size.height * 0.45,
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
        height: MediaQuery.of(context).size.height,
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

class BackgroundClipperBlack extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    var fristControlPoint =
        new Offset(size.width * (117 / 375), size.height * (267 / 387));
    var fristEndPoint =
        new Offset(size.width * (214 / 375), size.height * (242 / 387));
    path.quadraticBezierTo(fristControlPoint.dx, fristControlPoint.dy,
        fristEndPoint.dx, fristEndPoint.dy);

    var sControlPoint =
        new Offset(size.width * (297 / 375), size.height * (215 / 387));
    var sEndPoint = new Offset(size.width, size.height * (175 / 387));
    path.quadraticBezierTo(
        sControlPoint.dx, sControlPoint.dy, sEndPoint.dx, sEndPoint.dy);
    path.lineTo(
      size.width,
      0,
    );
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
    path.lineTo(0, size.height);
// path.lineTo(size.width, size.width);
    var fristEndPoint = new Offset(size.width, size.height * (450 / 811));
    var fristControlPoint =
        new Offset(size.width * 280 / 375, size.height * 340 / 811);
    path.quadraticBezierTo(fristControlPoint.dx, fristControlPoint.dy,
        fristEndPoint.dx, fristEndPoint.dy);

    path.lineTo(
      size.width,
      0,
    );
    // var sEndPoint = new Offset(size.width, size.height * 0.90);
    // var sControlPoint = new Offset(size.width * 0.8, size.height * 0.9);
    // path.quadraticBezierTo(
    //     sControlPoint.dx, sControlPoint.dy, sEndPoint.dx, sEndPoint.dy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

// class BackgroundClipperRed extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height);
// // path.lineTo(size.width, size.width);
//     var fristEndPoint = new Offset(size.width, size.height * (350 / 811));
//     var fristControlPoint =
//         new Offset(size.width * 2 / 375, size.height * 310 / 811);
//     path.quadraticBezierTo(fristControlPoint.dx, fristControlPoint.dy,
//         fristEndPoint.dx, fristEndPoint.dy);

//     path.lineTo(
//       size.width,
//       0,
//     );
//     // var sEndPoint = new Offset(size.width, size.height * 0.90);
//     // var sControlPoint = new Offset(size.width * 0.8, size.height * 0.9);
//     // path.quadraticBezierTo(
//     //     sControlPoint.dx, sControlPoint.dy, sEndPoint.dx, sEndPoint.dy);

//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     return true;
//   }
// }
