import 'package:flutter/material.dart';

class OnboardingNotifier with ChangeNotifier {
  // ignore: prefer_final_fields
  int _selectedPage = 0;

  int get selectedPage => _selectedPage;

  set setSelectedPage(int page) {
    _selectedPage = page;
    print(page);
    notifyListeners();
  }
}
