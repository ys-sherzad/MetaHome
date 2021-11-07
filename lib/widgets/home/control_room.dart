import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meta_home/repo/control_room_model.dart';
import 'package:meta_home/widgets/home/card.dart';

var iconPath = {
  '1': 'assets/images/living-room.svg',
  '2': 'assets/images/bathroom.svg',
  '3': 'assets/images/bedroom.svg',
  '4': 'assets/images/dining-room.svg',
  '5': 'assets/images/kitchen.svg',
  '6': 'assets/images/garage.svg',
};

class ControlRoom extends HookWidget {
  const ControlRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myList = useState(controlRooms);

    void _updateList(String id) {
      myList.value = [
        for (final cr in myList.value)
          if (cr.id == id) cr.copyWith(isOn: !cr.isOn) else cr
      ];
    }

    return Container(
      child: GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        crossAxisSpacing: 28.0,
        mainAxisSpacing: 28.0,
        crossAxisCount: 2,
        childAspectRatio: .95,
        children: [
          for (var room in myList.value)
            ControlCard(
              id: room.id,
              name: room.name,
              countOfDevices: room.countOfDevices,
              isOn: room.isOn,
              iconName: iconPath[room.id] ?? '1',
              updateList: () => _updateList(room.id),
            ),
        ],
      ),
    );
  }
}
