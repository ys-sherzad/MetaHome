import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../utils.dart';

class Header extends HookWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: LAYOUT_HORIZONTAL_OFFSET),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(right: 20.0),
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              height: HEADER_HEIGHT,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome home,',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: ColorLib.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // SizedBox(height: 4.0),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(.4),
            backgroundImage: AssetImage('assets/images/john-doe.png'),
            minRadius: 28.0,
          )
        ],
      ),
    );
  }
}
