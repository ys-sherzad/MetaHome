import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta_home/utils.dart';

const _duration = Duration(milliseconds: 260);
const _curve = Curves.easeInOut;

const iconPath = {
  '1': 'assets/images/statistics.svg',
  '2': 'assets/images/home.svg',
  '3': 'assets/images/user.svg',
};

class Tab {
  final String id;
  final String name;

  const Tab({
    required this.id,
    required this.name,
  });
}

List<Tab> tabs = [
  Tab(
    id: '1',
    name: 'Statistics',
  ),
  Tab(
    id: '2',
    name: 'Home',
  ),
  Tab(
    id: '3',
    name: 'Profile',
  ),
];

class BottomTabs extends HookWidget {
  const BottomTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedTabId = useState('2');

    return Container(
      width: double.infinity,
      height: BOTTOM_TAB_HEIGHT,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(BOTTOM_TAB_HEIGHT / 1.6),
          topRight: Radius.circular(BOTTOM_TAB_HEIGHT / 1.6),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (final tab in tabs)
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () => selectedTabId.value = tab.id,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // The animation here could be done
                    // by scaling the Container but heck, I'm lazy
                    AnimatedContainer(
                      duration: _duration,
                      curve: _curve,
                      height: tab.id == selectedTabId.value ? 26 : 22,
                      width: tab.id == selectedTabId.value ? 26 : 22,
                      child: SvgPicture.asset(
                        iconPath[tab.id] as String,
                        semanticsLabel: tab.name,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.contain,
                        color: ColorLib.primary,
                      ),
                    ),
                    SizedBox(height: 8),
                    AnimatedContainer(
                      duration: _duration,
                      curve: _curve,
                      width: tab.id == selectedTabId.value ? 6 : 0,
                      height: tab.id == selectedTabId.value ? 6 : 0,
                      decoration: BoxDecoration(
                        color: ColorLib.primary,
                        shape: BoxShape.circle,
                      ),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
