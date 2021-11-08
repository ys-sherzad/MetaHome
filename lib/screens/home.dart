import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meta_home/utils.dart';
import 'package:meta_home/widgets/home/bottom_tabs.dart';
import 'package:meta_home/widgets/home/music_player_popup.dart';
import 'package:meta_home/widgets/home/control_room.dart';
import 'package:meta_home/widgets/home/header.dart';
import 'package:meta_home/widgets/home/power_usage_today.dart';
import 'package:meta_home/widgets/home/room_tabs.dart';

class Home extends HookWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loaded = useState(false);

    // Not an optimized way to animate
    // the music player popup. better use controller
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        loaded.value = true;
      });
    }, []);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Header(),
              const SizedBox(
                height: 16.0,
              ),
              PowerUsageToday(),
              const SizedBox(
                height: 28.0,
              ),
              RoomTabs(),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: Stack(
                  children: [
                    ControlRoom(),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 650),
                      curve: Curves.easeInOut,
                      child: MusicPlayerPopup(),
                      bottom: loaded.value
                          ? MUSIC_PLAYER_OFFSET
                          : MUSIC_PLAYER_INITIAL_OFFSET,
                      right: 0,
                      left: 0,
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear,
                      child: BottomTabs(),
                      bottom: loaded.value ? 0 : -BOTTOM_TAB_HEIGHT,
                      left: 0,
                      right: 0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
