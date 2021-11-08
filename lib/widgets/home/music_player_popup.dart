import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meta_home/utils.dart';
import 'package:meta_home/widgets/home/button_icon.dart';

var Line = Container(
  alignment: Alignment.center,
  height: 2,
  width: 42,
  decoration: BoxDecoration(
    color: Colors.white.withOpacity(.7),
    borderRadius: BorderRadius.circular(5),
  ),
  child: null,
);

class Content extends HookWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPlaying = useState(false);
    final isFavorite = useState(false);

    return Container(
      height: BOTTOM_TAB_HEIGHT * 2.3,
      width: double.infinity,
      color: ColorLib.secondary,
      padding: EdgeInsets.only(
          left: LAYOUT_HORIZONTAL_OFFSET + 20,
          right: LAYOUT_HORIZONTAL_OFFSET + 20,
          top: 18,
          bottom: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Line,
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                // FIXME: There must be a better way to do this!
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  color: ColorLib.primary,
                  image: DecorationImage(
                    image: AssetImage('assets/images/jon-bellion.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'All Time Low (slowed)',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Jon Bellion',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, .6),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    ButtonIcon(
                      isActive: isFavorite.value,
                      activeIconPath: 'assets/images/heart.svg',
                      activeIconColor: Colors.white,
                      inactiveIconPath: 'assets/images/heart-outline.svg',
                      inactiveIconColor: Color.fromRGBO(255, 255, 255, .6),
                      semanticLabel: 'Favorite',
                      iconSize: 26,
                      onPressed: () {
                        isFavorite.value = !isFavorite.value;
                      },
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    ButtonIcon(
                      isActive: isPlaying.value,
                      activeIconPath: 'assets/images/play.svg',
                      activeIconColor: Colors.white,
                      inactiveIconPath: 'assets/images/pause.svg',
                      inactiveIconColor: Color.fromRGBO(255, 255, 255, .6),
                      semanticLabel: 'Favorite',
                      onPressed: () {
                        isPlaying.value = !isPlaying.value;
                      },
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class MusicPlayerPopup extends HookWidget {
  const MusicPlayerPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Clipper(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Content(),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 30;

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
