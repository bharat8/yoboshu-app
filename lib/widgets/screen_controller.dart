import 'package:flutter/material.dart';
import 'package:yoboshu/widgets/bottom_navigation.dart';
import 'package:yoboshu/widgets/selection_on_change.dart';

class ScreenController extends StatefulWidget {
  @override
  _ScreenControllerState createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: mediaQuery.width,
            height: mediaQuery.height * 0.92,
            child: SelectionOnChange(),
          ),
          Container(
            width: mediaQuery.width,
            height: mediaQuery.height * 0.08,
            child: BottomNavigation(),
          )
        ],
      ),
    );
  }
}
