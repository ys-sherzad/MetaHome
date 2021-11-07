import 'package:flutter/material.dart';
import 'package:meta_home/utils.dart';

// Constants
double TOGGLE_HEIGHT = 34.0;
double TOGGLE_WIDTH = 60.0;

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
    var _circle = AnimatedContainer(
      duration: duration,
      curve: curve,
      height: TOGGLE_HEIGHT - 5,
      width: TOGGLE_HEIGHT - 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isOn ? ColorLib.toggleActive : ColorLib.toggleInActive,
      ),
    );

    AnimatedDefaultTextStyle _text(String text) {
      return AnimatedDefaultTextStyle(
        child: Text(text),
        duration: duration,
        curve: curve,
        style: isOn
            ? TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: ColorLib.toggleActive,
              )
            : TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: ColorLib.toggleInActive,
              ),
      );
    }

    var _textContent = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _text('On'),
        _text('Off'),
      ],
    );

    return InkWell(
      splashColor: Colors.transparent,
      onTap: this.onPressed,
      child: AnimatedContainer(
        duration: duration,
        curve: curve,
        height: TOGGLE_HEIGHT,
        width: TOGGLE_WIDTH,
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2.5),
        decoration: BoxDecoration(
          border: Border.all(
              width: 1.5,
              color: isOn
                  ? ColorLib.toggleActive
                  : ColorLib.toggleInActive.withOpacity(.5)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 3, right: 2),
                child: _textContent,
              ),
            ),
            AnimatedAlign(
              alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
              duration: duration,
              curve: curve,
              child: _circle,
            ),
          ],
        ),
      ),
    );
  }
}
