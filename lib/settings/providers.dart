import 'package:flutter/material.dart';

class Nav extends ChangeNotifier {
  int currentpage = 1;
  int proj = 0;
  bool _projSelectionFlag = false;

  /// the flag for the selection menu
  bool get selFlag => _projSelectionFlag;

  /// the method to call to open the selection menu
  void selecting() {
    _projSelectionFlag = true;
  }

  /// the method to call when selection of the project is done
  void done() {
    _projSelectionFlag = false;
  }

  void set1() {
    if (currentpage != 1) currentpage = 1;
    notifyListeners();
  }

  void set2() {
    if (currentpage != 2) currentpage = 2;
    notifyListeners();
  }

  void set3() {
    if (currentpage != 3) currentpage = 3;
    notifyListeners();
  }

  void set4() {
    if (currentpage != 4) currentpage = 4;
    notifyListeners();
  }

  void setx(int x) {
    if (proj != x) {
      proj = x;
      notifyListeners();
    }
  }
}
