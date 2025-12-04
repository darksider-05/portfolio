import 'package:flutter/material.dart';

class Grad extends ChangeNotifier {
  int reg = 1;

  static const Map<String, List<Color>> colors = {
    "1": [
      Color(0xFF2EC4B6),
      Color(0xFFBFA8FF),
      Color(0xFFFF6B66),
      Color(0xFFFFD15E),
    ],
    "2": [
      Color(0xFFBFA8FF),
      Color(0xFFFF6B66),
      Color(0xFFFFD15E),
      Color(0xFF2EC4B6),
    ],
    "3": [
      Color(0xFFFF6B66),
      Color(0xFFFFD15E),
      Color(0xFF2EC4B6),
      Color(0xFFBFA8FF),
    ],
    "4": [
      Color(0xFFFFD15E),
      Color(0xFF2EC4B6),
      Color(0xFFBFA8FF),
      Color(0xFFFF6B66),
    ],
  };

  late final Map<int, LinearGradient> _gradients = {
    1: LinearGradient(
      colors: colors["1"]!,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.0, 0.33, 0.66, 1.0],
    ),
    2: LinearGradient(
      colors: colors["2"]!,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.0, 0.33, 0.66, 1.0],
    ),
    3: LinearGradient(
      colors: colors["3"]!,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.0, 0.33, 0.66, 1.0],
    ),
    4: LinearGradient(
      colors: colors["4"]!,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.0, 0.33, 0.66, 1.0],
    ),
  };

  Grad() {
    previous = _gradients[reg]!;
  }

  LinearGradient get lg => _gradients[reg]!;
  late LinearGradient previous;

  void setpage(int target) {
    previous = lg;
    reg = target;
    notifyListeners();
  }
}
