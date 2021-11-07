import 'package:flutter/material.dart';
import 'package:meta_home/widgets/home/music_player_popup.dart';
import 'package:meta_home/widgets/home/control_room.dart';
import 'package:meta_home/widgets/home/header.dart';
import 'package:meta_home/widgets/home/power_usage_today.dart';
import 'package:meta_home/widgets/home/room_tabs.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    Positioned(
                      child: MusicPlayerPopup(),
                      bottom: 0,
                      right: 0,
                      left: 0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
