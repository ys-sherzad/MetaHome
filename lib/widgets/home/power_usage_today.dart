import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../utils.dart';

BoxDecoration _decoration() {
  return BoxDecoration(
    border: Border.all(color: ColorLib.border),
    borderRadius: BorderRadius.circular(12.0),
  );
}

const SizedBox Spacer = SizedBox(width: 15.0);

class PowerUsageToday extends HookWidget {
  PowerUsageToday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var KiloWattText = RichText(
      text: TextSpan(
        text: '30.4',
        style: TextStyle(
          color: ColorLib.primary,
          fontSize: 23.0,
          fontWeight: FontWeight.w800,
        ),
        children: <TextSpan>[
          TextSpan(
              text: ' kWh',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              recognizer: TapGestureRecognizer()..onTap = () {}),
        ],
      ),
    );

    return Container(
      height: 100.0,
      margin: const EdgeInsets.symmetric(horizontal: LAYOUT_HORIZONTAL_OFFSET),
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      decoration: _decoration(),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 58.0,
            width: 58.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color.fromRGBO(237, 162, 88, 1),
            ),
            child: const Icon(
              FontAwesome.flash,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          Spacer,
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KiloWattText,
                const SizedBox(height: 2.0),
                Text(
                  'Power usage today',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: ColorLib.textSecondary,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
