import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meta_home/repo/control_room_model.dart';
import 'package:meta_home/utils.dart';
import 'package:meta_home/widgets/home/toggle_button.dart';
import 'package:meta_home/repo/control_room_model.dart';

BoxDecoration outline(double radius) {
  return BoxDecoration(
    border: Border.all(color: Colors.black),
    borderRadius: BorderRadius.circular(radius),
  );
}

class ControlRoom extends HookWidget {
  const ControlRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget Card({
      required String name,
      required int countOfDevices,
      required bool isOn,
    }) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: ColorLib.border),
          borderRadius: BorderRadius.circular(20.0),
        ),
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
                children: [Text(name), Text('$countOfDevices device')],
              ),
            ),
            ToggleButton(),
          ],
        ),
      );
      // margin: EdgeInsets.all(5.0));
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.count(
        crossAxisSpacing: 28.0,
        mainAxisSpacing: 28.0,
        crossAxisCount: 2,
        // childAspectRatio: 3 / 2,
        children: [
          for (var room in ControlRoomList.controlRooms)
            Card(
              name: room.name,
              countOfDevices: room.countOfDevices,
              isOn: room.isOn,
            ),
        ],
      ),
    );
  }
}
