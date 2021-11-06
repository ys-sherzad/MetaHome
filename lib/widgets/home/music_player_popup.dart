import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

var Content = Container(
  height: 140,
  width: double.infinity,
  color: Colors.green,
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
    double radius = 80;

    var controlPoint1 = Offset(0, 0);
    var controlPoint2 = Offset(size.width, 0);
    var endPoint = Offset(size.width, radius);

    Path path = Path()
      ..moveTo(0, radius)
      ..cubicTo(controlPoint1.dx, controlPoint2.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
