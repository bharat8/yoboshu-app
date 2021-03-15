import 'package:flutter/material.dart';
import 'package:yoboshu/widgets/navigation_button.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Colors.indigo.withOpacity(0.2), boxShadow: [
        BoxShadow(
            color: Color(0xd9d9d9),
            offset: Offset(0, 0),
            blurRadius: 1,
            spreadRadius: 4)
      ]),
      child: NavigationButton(),
    );
  }
}
