import 'package:flutter/material.dart';
import 'package:login_layout/presentation/my_home_screen/my_home_screen.dart';

class ScreenNotifier extends ChangeNotifier {
  String _currentPage = MyHomePage.pageName;

  String get currentPage => _currentPage;

  void goToMain() {
    _currentPage = MyHomePage.pageName;
    notifyListeners();
  }

  void goToOtherPage(String name) {
    _currentPage = name;
    notifyListeners();
  }
}
