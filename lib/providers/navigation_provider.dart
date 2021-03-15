import 'package:flutter/cupertino.dart';

class NavigationProvider extends ChangeNotifier {
  List<String> _navigationTitles = [
    "Home",
    "Trainers",
    "Boot Camp",
    "Fitness Tools",
    "More"
  ];

  List<String> _navigationImages = [
    "assets/images/home.png",
    "assets/images/running.png",
    "assets/images/group.png",
    "assets/images/tools.png",
    "assets/images/more.png"
  ];

  List<String> _navigationImagesColored = [
    "assets/images/home-colored.png",
    "assets/images/running-colored.png",
    "assets/images/group-colored.png",
    "assets/images/tools-colored.png",
    "assets/images/more-colored.png"
  ];

  List<bool> _tileCurrentState = [true, false, false, false, false];

  int _selectedIndex = 0;

  List<String> get navigationTitles => _navigationTitles;
  List<String> get navigationImages => _navigationImages;
  List<String> get navigationImagesColored => _navigationImagesColored;
  List<bool> get tileCurrentState => _tileCurrentState;
  int get selectedIndex => _selectedIndex;

  void selectedTile(int index) {
    _tileCurrentState = List.generate(5, (_) => false);
    _selectedIndex = index;
    _tileCurrentState[index] = true;
    notifyListeners();
  }
}
