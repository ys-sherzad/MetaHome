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
];

class RoomTabs extends HookWidget {
  const RoomTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      height: 50.0,
      width: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: LAYOUT_HORIZONTAL_MARGIN),
        scrollDirection: Axis.horizontal,
        child: Row(
          // mainAxisAlignment: Main
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var tab in tabs)
              Container(
                alignment: Alignment.center,
                height: 40,
                width: 100,
                margin: EdgeInsets.only(right: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(tab.name),
              ),
          ],
        ),
      ),
    );
  }
}
