import 'package:flutter/material.dart';

class Nav extends ChangeNotifier {
  int currentpage = 1;

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
}
