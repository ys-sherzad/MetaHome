// import 'package:awesome_social/src/utils/colorLib.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final Icon icon;
  final Color iconColor;
  final Function() onPressed;
  final double iconSize;

  const ButtonIcon({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.iconColor = Colors.white,
    this.iconSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(5),
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          print('hhhh');
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: icon,
          ),
        ),
      ),
    );
  }
}
