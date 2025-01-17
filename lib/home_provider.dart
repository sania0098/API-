import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int number = 0;

  void reset() {
    number = 0;
    notifyListeners();
  }

  void increase() {
    number++;
    notifyListeners();
  }

  void decrease() {
    if (number > 0) {
      number--;
      notifyListeners();
    }
  }
}
