import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoboshu/providers/navigation_provider.dart';
import 'package:yoboshu/screens/bootcamp_screen.dart';
import 'package:yoboshu/screens/fitness_screen.dart';
import 'package:yoboshu/screens/home_screen.dart';
import 'package:yoboshu/screens/more_screen.dart';
import 'package:yoboshu/screens/trainers_screen.dart';

class SelectionOnChange extends StatelessWidget {
  final List<Widget> selectedWidget = [
    HomeScreen(),
    TrainersScreen(),
    BootCampScreen(),
    FitnessScreen(),
    MoreScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (__, selector, _) => Container(
        child: selectedWidget[selector.selectedIndex],
      ),
    );
  }
}
