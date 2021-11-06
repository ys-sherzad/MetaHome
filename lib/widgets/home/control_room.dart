import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

BoxDecoration outline(double radius) {
  return BoxDecoration(
    border: Border.all(color: Colors.black),
    borderRadius: BorderRadius.circular(radius),
  );
}

Widget EmptyContainer() {
  return Container(
    // height: 170.0,
    // width: 50.0,
    // margin: EdgeInsets.all(10.0),
    decoration: outline(20.0),
    padding: EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 24.0,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Icon'),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Living Room'), Text('5 devices')],
          ),
        ),
        Container(
          height: 30.0,
          width: 56.0,
          decoration: outline(20.0),
          child: null,
        )
      ],
    ),
  );
  // margin: EdgeInsets.all(5.0));
}

class ControlRoom extends HookWidget {
  const ControlRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.count(
        crossAxisSpacing: 28.0,
        mainAxisSpacing: 28.0,
        crossAxisCount: 2,
        // childAspectRatio: 3 / 2,
        children: List.generate(10, (index) {
          return EmptyContainer();
        }),
      ),
    );
  }
}
