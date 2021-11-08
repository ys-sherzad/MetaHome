import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta_home/widgets/home/toggle_button.dart';
import '../../utils.dart';

class ControlCard extends HookWidget {
  final String id;
  final String name;
  final int countOfDevices;
  final bool isOn;
  final String iconPath;
  final Function() updateList;

  const ControlCard({
    Key? key,
    required this.id,
    required this.name,
    required this.countOfDevices,
    required this.isOn,
    required this.iconPath,
    required this.updateList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This is to animate the color on the Icon
    final _iconColorAnimationController =
        useAnimationController(duration: duration);
    var _colorTween = ColorTween(
      begin: ColorLib.primary.withOpacity(.5),
      end: Colors.white,
    ).animate(
      CurvedAnimation(
        parent: _iconColorAnimationController,
        curve: curve,
      ),
    );

    useEffect(() {
      if (isOn)
        _iconColorAnimationController.forward();
      else
        _iconColorAnimationController.reverse();
    }, [isOn]);

    var _nameText = AnimatedDefaultTextStyle(
      child: Text(name),
      duration: duration,
      curve: curve,
      style: isOn
          ? TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            )
          : TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: ColorLib.primary,
            ),
    );

    var _devicesCountText = AnimatedDefaultTextStyle(
      child: Text('$countOfDevices device'),
      duration: duration,
      curve: curve,
      style: isOn
          ? TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.white.withOpacity(0.6),
            )
          : TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: ColorLib.textSecondary,
            ),
    );

    return AnimatedContainer(
      duration: duration,
      curve: curve,
      decoration: BoxDecoration(
        border: Border.all(color: ColorLib.border),
        borderRadius: BorderRadius.circular(20.0),
        color: isOn ? ColorLib.primary : Colors.white,
        boxShadow: [
          BoxShadow(
            color:
                isOn ? ColorLib.primary.withOpacity(.25) : Colors.transparent,
            blurRadius: isOn ? 10.0 : 0.0,
            spreadRadius: isOn ? 5.0 : 0.0,
            offset: isOn
                ? Offset(3, 5)
                : Offset.zero, // shadow direction: bottom right
          )
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 18.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedBuilder(
            animation: _colorTween,
            builder: (context, child) {
              return SvgPicture.asset(
                iconPath,
                semanticsLabel: name,
                height: 32,
                width: 32,
                fit: BoxFit.contain,
                color: _colorTween.value,
              );
            },
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _nameText,
                SizedBox(height: 4.0),
                _devicesCountText,
              ],
            ),
          ),
          ToggleButton(
            onPressed: updateList,
            isOn: isOn,
          ),
        ],
      ),
    );
  }
}
