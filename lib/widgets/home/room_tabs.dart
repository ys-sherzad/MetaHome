import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../utils.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

class Tab {
  final String name;
  Tab({required this.name});
}

//FIXME: fake tabs, fix it later
List<Tab> tabs = [
  Tab(name: 'All Rooms'),
  Tab(name: 'Livig Room'),
  Tab(name: 'Bathroom'),
  Tab(name: 'Bedroom'),
  Tab(name: 'Kitchen'),
  Tab(name: 'Garage'),
];

var Line = Container(
  height: 3,
  // width: double.infinity,
  color: Colors.grey,
);

class RoomTabs extends HookWidget {
  const RoomTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: LAYOUT_HORIZONTAL_MARGIN),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (var tab in tabs)
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 80,
                margin: EdgeInsets.only(right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tab.name,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 2,
                      width: 30,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
