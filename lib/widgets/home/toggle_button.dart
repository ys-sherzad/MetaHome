import 'package:flutter/material.dart';
import 'package:meta_home/utils.dart';

// Constants
double TOGGLE_HEIGHT = 30.0;
double TOGGLE_WIDTH = 56.0;

Widget CircleShape() {
  return Container(
    height: TOGGLE_HEIGHT - 5,
    width: TOGGLE_HEIGHT - 5,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.black,
    ),
  );
}

Widget TextContent() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "On",
        style: TextStyle(
          fontSize: 11,
          color: Colors.black,
        ),
      ),
      // SizedBox(width: 8),
      Text(
        "Off",
        style: TextStyle(
          fontSize: 11,
          color: Colors.black,
        ),
      ),
    ],
  );
}

class ToggleButton extends StatelessWidget {
  final Function() onPressed;
  final bool isOn;

  const ToggleButton({
    Key? key,
    required this.onPressed,
    required this.isOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: this.onPressed,
      child: Container(
        height: TOGGLE_HEIGHT,
        width: TOGGLE_WIDTH,
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2.5),
        decoration: BoxDecoration(
          border: Border.all(color: ColorLib.border),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeIn,
              child: CircleShape(),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 4, right: 2),
                child: TextContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
