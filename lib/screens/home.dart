import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meta_home/widgets/home/music_player_popup.dart';
import 'package:meta_home/widgets/home/control_room.dart';
import 'package:meta_home/widgets/home/header.dart';
import 'package:meta_home/widgets/home/power_usage_today.dart';
import 'package:meta_home/widgets/home/room_tabs.dart';

BoxDecoration outline(double radius) {
  return BoxDecoration(
    border: Border.all(color: Colors.black),
    borderRadius: BorderRadius.circular(radius),
  );
}

Widget EmptyContainer() {
  return Container(
      // height: 30.0,
      // width: 50.0,
      // margin: EdgeInsets.all(10.0),
      decoration: outline(20.0));
  // margin: EdgeInsets.all(5.0));
}

class Home extends HookWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // useEffect(effect)
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: const Text('Something'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Header(),
              SizedBox(
                height: 20.0,
              ),
              PowerUsageToday(),
              SizedBox(
                height: 20.0,
              ),
              RoomTabs(),
              SizedBox(
                height: 20.0,
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
