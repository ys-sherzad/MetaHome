import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../utils.dart';

// double HEADER_HEIGHT = 70.0;
// double LAYOUT_HORIZONTAL_MARGIN = 20.0;

BoxDecoration outline(double radius) {
  return BoxDecoration(
    border: Border.all(color: Colors.black),
    borderRadius: BorderRadius.circular(radius),
  );
}

class Header extends HookWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: LAYOUT_HORIZONTAL_MARGIN),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(right: 20.0),
              padding: EdgeInsets.symmetric(vertical: 13.0),
              height: HEADER_HEIGHT,
              // decoration: outline(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome home,'),
                  Text('Yasir Sherzad'),
                ],
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/me.png'),
            minRadius: 28.0,
          )
        ],
      ),
    );
  }
}
