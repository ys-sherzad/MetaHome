import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meta_home/repo/control_room_model.dart';
import 'package:meta_home/utils.dart';
import 'package:meta_home/widgets/home/toggle_button.dart';

const _duration = Duration(milliseconds: 220);
const _curve = Curves.easeIn;

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

    Widget Card({
      required String id,
      required String name,
      required int countOfDevices,
      required bool isOn,
    }) {
      var _nameText = AnimatedDefaultTextStyle(
        child: Text(name),
        duration: _duration,
        curve: _curve,
        style: isOn
            ? TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )
            : TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorLib.primary,
              ),
      );

      var _devicesCountText = AnimatedDefaultTextStyle(
        child: Text('$countOfDevices device'),
        duration: _duration,
        curve: _curve,
        style: isOn
            ? TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              )
            : TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: ColorLib.primary,
              ),
      );

      return AnimatedContainer(
        duration: _duration,
        curve: _curve,
        decoration: BoxDecoration(
          border: Border.all(color: ColorLib.border),
          borderRadius: BorderRadius.circular(20.0),
          color: isOn ? ColorLib.primary : Colors.white,
          boxShadow: [
            BoxShadow(
              color: isOn ? Colors.black : Colors.transparent,
              blurRadius: isOn ? 2.0 : 0.0,
              spreadRadius: isOn ? 0.0 : 0.0,
              offset: isOn
                  ? Offset(2.0, 2.0)
                  : Offset.zero, // shadow direction: bottom right
            )
          ],
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
                children: [
                  _nameText,
                  SizedBox(height: 4.0),
                  _devicesCountText,
                ],
              ),
            ),
            ToggleButton(
              onPressed: () => _updateList(id),
              isOn: isOn,
            ),
          ],
        ),
      );
      // margin: EdgeInsets.all(5.0));
    }

    return Container(
      child: GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        crossAxisSpacing: 28.0,
        mainAxisSpacing: 28.0,
        crossAxisCount: 2,
        children: [
          for (var room in myList.value)
            Card(
              id: room.id,
              name: room.name,
              countOfDevices: room.countOfDevices,
              isOn: room.isOn,
            ),
        ],
      ),
    );
  }
}
