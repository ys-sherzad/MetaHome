import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

var Content = Container(
  height: 100,
  width: double.infinity,
  color: Colors.green,
  // decoration: BoxDecoration(
  //   border: Border.all(color: Colors.black),
  //   color: Colors.transparent,
  // ),
);

class MusicPlayerPopup extends HookWidget {
  const MusicPlayerPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Clipper(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Content,
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // var controlPoint1 = Offset(10, 100);
    // var controlPoint2 = Offset(10, 10);
    // var endPoint = Offset(0, 50);
    double radius = 40;

    Path path = Path()
      ..moveTo(radius, 0)
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(
        Offset(size.width, radius),
        radius: Radius.circular(radius),
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, radius)
      ..arcToPoint(
        Offset(radius, 0),
        radius: Radius.circular(radius),
      )
      ..close();
    // ..lineTo(size.width, size.height)
    // ..arcToPoint(Offset(size.width - radius, 0), radius: Radius.circular(radius))

    // ..moveTo(size.width / 8, 5)
    // ..cubicTo(controlPoint1.dx, controlPoint2.dy, controlPoint2.dx,
    //     controlPoint2.dy, endPoint.dx, endPoint.dy)
    // ..lineTo(0, size.height)
    // ..lineTo(size.width, 0)
    // ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    // throw UnimplementedError();
    return true;
  }
}
