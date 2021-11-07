import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meta_home/utils.dart';

class BottomTabs extends HookWidget {
  const BottomTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: BOTTOM_TAB_HEIGHT,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(BOTTOM_TAB_HEIGHT / 2),
          topRight: Radius.circular(BOTTOM_TAB_HEIGHT / 2),
        ),
      ),
      child: null,
    );
  }
}
