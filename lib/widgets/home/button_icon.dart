// import 'package:awesome_social/src/utils/colorLib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  final Function() onPressed;
  final SvgPicture icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  final bool isActive;
  final Function() onPressed;
  final String activeIconPath;
  final String inactiveIconPath;
  final Color activeIconColor;
  final Color inactiveIconColor;
  final double iconSize;

  const ButtonIcon({
    Key? key,
    required this.isActive,
    required this.onPressed,
    required this.activeIconPath,
    required this.inactiveIconPath,
    required this.activeIconColor,
    required this.inactiveIconColor,
    this.iconSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: CustomButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          activeIconPath,
          semanticsLabel: 'icon',
          height: iconSize,
          width: iconSize,
          fit: BoxFit.contain,
          color: activeIconColor,
        ),
      ),
      secondChild: CustomButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          inactiveIconPath,
          semanticsLabel: 'icon',
          height: iconSize,
          width: iconSize,
          fit: BoxFit.contain,
          color: inactiveIconColor,
        ),
      ),
      crossFadeState:
          isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 200),
      firstCurve: Curves.easeIn,
      secondCurve: Curves.easeOut,
      sizeCurve: Curves.easeInOut,
    );
  }
}
