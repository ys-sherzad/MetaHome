import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../utils.dart';

BoxDecoration _decoration() {
  return BoxDecoration(
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(12.0),
  );
}

// SizedBox _spacer() {
//   return SizedBox(
//     width: 15.0,
//   );
// }

const SizedBox Spacer = SizedBox(width: 15.0);

BoxDecoration outline(double radius) {
  return BoxDecoration(
    border: Border.all(color: Colors.black),
    borderRadius: BorderRadius.circular(radius),
  );
}

class PowerUsageToday extends HookWidget {
  const PowerUsageToday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      margin: EdgeInsets.symmetric(horizontal: LAYOUT_HORIZONTAL_MARGIN),
      padding: EdgeInsets.symmetric(horizontal: 26.0),
      decoration: _decoration(),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 55.0,
            width: 55.0,
            decoration: outline(99),
            child: null,
          ),
          Spacer,
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('30.4 kWh'),
                Text('Power usage today'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
