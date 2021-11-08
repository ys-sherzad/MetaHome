import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../utils.dart';
import 'package:animate_do/animate_do.dart';

const _duration = Duration(milliseconds: 250);
const _curve = Curves.easeInOutQuad;

class Tab {
  final String id;
  final String name;
  final bool selected;
  Tab({required this.id, required this.name, required this.selected});

  copyWith({required bool selected}) {
    return Tab(id: id, name: name, selected: selected);
  }
}

List<Tab> tabs_data = [
  Tab(id: '1', name: 'All Rooms', selected: true),
  Tab(id: '2', name: 'Living Room', selected: false),
  Tab(id: '3', name: 'Bathroom', selected: false),
  Tab(id: '4', name: 'Bedroom', selected: false),
  Tab(id: '5', name: 'Kitchen', selected: false),
  Tab(id: '6', name: 'Garage', selected: false),
];

class RoomTabs extends HookWidget {
  const RoomTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tabs = useState(tabs_data);

    void _updateList(String id) {
      tabs.value = [
        for (final tab in tabs.value)
          if (tab.id == id)
            tab.copyWith(selected: true)
          else
            tab.copyWith(selected: false)
      ];
    }

    AnimatedDefaultTextStyle _renderTabText(Tab tab) {
      return AnimatedDefaultTextStyle(
        child: Text(tab.name),
        duration: duration,
        curve: curve,
        style: tab.selected
            ? TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ColorLib.primary,
              )
            : TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: ColorLib.primary.withOpacity(.4),
              ),
      );
    }

    return Container(
      // height: 35.0,
      width: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: LAYOUT_HORIZONTAL_OFFSET),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (var tab in tabs.value)
              SlideInRight(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 1300),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => _updateList(tab.id),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _renderTabText(tab),
                        SizedBox(height: 6),
                        AnimatedContainer(
                          duration: _duration,
                          curve: _curve,
                          height: 2.5,
                          width: tab.selected ? 40 : 0,
                          decoration: BoxDecoration(
                            color: ColorLib.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
