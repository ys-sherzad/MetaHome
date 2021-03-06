import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meta_home/repo/control_room_model.dart';
import 'package:meta_home/utils.dart';
import 'package:meta_home/widgets/home/card.dart';
import 'package:animate_do/animate_do.dart';

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

    var size = MediaQuery.of(context).size;

    void _updateList(String id) {
      myList.value = [
        for (final cr in myList.value)
          if (cr.id == id) cr.copyWith(isOn: !cr.isOn) else cr
      ];
    }

    return Container(
      child: GridView.count(
        padding: const EdgeInsets.only(
          top: 10,
          left: LAYOUT_HORIZONTAL_OFFSET,
          right: LAYOUT_HORIZONTAL_OFFSET,
          bottom: 180,
        ),
        crossAxisSpacing: 26.0,
        mainAxisSpacing: 26.0,
        crossAxisCount: 2,
        childAspectRatio: .98,
        children: [
          for (var room in myList.value)
            SlideInUp(
              delay: Duration(milliseconds: int.parse(room.id) * 300),
              duration: const Duration(milliseconds: 600),
              from: size.width * .4,
              child: ControlCard(
                id: room.id,
                name: room.name,
                countOfDevices: room.countOfDevices,
                isOn: room.isOn,
                iconPath: iconPath[room.id] as String,
                updateList: () => _updateList(room.id),
              ),
            )
        ],
      ),
    );
  }
}
