import 'dart:math';
import 'package:flutter/material.dart';

Color adjustLuminance(Color c, double amount) {
  final hsl = HSLColor.fromColor(c);
  final newLightness = (hsl.lightness + amount).clamp(0.0, 1.0);
  return hsl.withLightness(newLightness).toColor();
}

Color normalizeBackground(Color bg) {
  final hsl = HSLColor.fromColor(bg);

  if (hsl.lightness > 0.90) {
    return adjustLuminance(bg, -0.10);
  }

  if (hsl.lightness < 0.10) {
    return adjustLuminance(bg, 0.10);
  }

  return bg;
}

class ThemeProvider extends ChangeNotifier {
  late String _currentThemeName;
  late ThemeData _currentTheme;

  ThemeData get theme => _currentTheme;
  String get themeName => _currentThemeName;

  ThemeProvider() {
    _setRandomTheme();
    // use for testing a specific theme:
    //_currentTheme = generateTheme(portfolioThemes["MonochromeProDark"]!);
  }

  void _setRandomTheme() {
    final keys = portfolioThemes.keys.toList();
    final randomKey = keys[Random().nextInt(keys.length)];

    _currentThemeName = randomKey;
    _currentTheme = generateTheme(portfolioThemes[randomKey]!);

    notifyListeners();
  }

  void changeTheme(String name) {
    _currentThemeName = name;
    _currentTheme = generateTheme(portfolioThemes[name]!);
    notifyListeners();
  }
}

ThemeData generateTheme(Map<String, Color> colors) {
  final isLight = colors["background"]!.computeLuminance() > 0.5;
  Color autoTextFor(Color bg) {
    return bg.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }

  Color uncolor(Color normal) {
    return normal == Colors.black ? Colors.white : Colors.black;
  }

  final bg = normalizeBackground(colors["background"]!);

  return ThemeData(
    brightness: isLight ? Brightness.light : Brightness.dark,
    scaffoldBackgroundColor: bg,
    primaryColor: colors["primary"],
    colorScheme: ColorScheme(
      brightness: isLight ? Brightness.light : Brightness.dark,
      primary: colors["primary"]!,
      secondary: colors["secondary"]!,
      surface: bg,
      error: Colors.red,
      onPrimary: uncolor(autoTextFor(colors["secondary"]!)),
      onSecondary: autoTextFor(colors["secondary"]!),
      onSurface: colors["text"]!,
      onError: Colors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: colors["text"]),
      bodyMedium: TextStyle(color: colors["text"]),
      bodySmall: TextStyle(color: colors["text"]!.withAlpha(179)),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: bg,
      foregroundColor: colors["text"],
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors["primary"],
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}

final Map<String, Map<String, Color>> portfolioThemes = {
  "NeoClassical": {
    "primary": Color(0xFF2952A3),
    "secondary": Color(0xFFD8C69C),
    "background": Color(0xFFF7F7F7),
    "text": Color(0xFF2B2B2B),
  },
  "CitrusNova": {
    "primary": Color(0xFFFFC107),
    "secondary": Color(0xFF2EC4B6),
    "background": Color(0xFFF57c00),
    "text": Color(0xFFF9F9F9),
  },

  "AzureGilt": {
    "primary": Color(0xFFCCAF0B),
    "secondary": Color(0xFFCDD5DA),
    "background": Color(0xFF2B6F99),
    "text": Color(0xFFF2E2DA),
  },

  "StudioGlow": {
    "primary": Color(0xFFFF7C70),
    "secondary": Color(0xFFFFB65E),
    "background": Color(0xFF1B0F0A),
    "text": Color(0xFFF2E2DA),
  },

  "AquaSynthLight": {
    "primary": Color(0xFF21AB9D),
    "secondary": Color(0xFF9CD5E5),
    "background": Color(0xFFFAFEFE),
    "text": Color(0xFF1A1A1A),
  },
  "AquaSynthDark": {
    "primary": Color(0xFF24E3D7),
    "secondary": Color(0xFFA3FFC9),
    "background": Color(0xFF080E0F),
    "text": Color(0xFFE9FFFF),
  },

  "SylvanAura": {
    "primary": const Color(0xFF876254),
    "secondary": const Color(0xFF409844),
    "background": const Color(0xFF73CC78),
    "text": Color(0xFFEFFFFF),
  },
  "MinimalPastel": {
    "primary": Color(0xFFC9BDFF),
    "secondary": Color(0xFFAFFFD7),
    "background": Color(0xFF191A1F),
    "text": Color(0xFFF5F5F5),
  },

  "SolarAcademiaLight": {
    "primary": Color(0xFFFFF04E),
    "secondary": Color(0xFF2C2E42),
    "background": Color(0xFFFFFDF5),
    "text": Color(0xFF1F1F1F),
  },
  "SolarAcademiaDark": {
    "primary": Color(0xFFFFD858),
    "secondary": Color(0xFFFFA6D0),
    "background": Color(0xFF0E1427),
    "text": Color(0xFFEDEAFF),
  },

  "MonochromeProLight": {
    "primary": Color(0xFF6F7F8D),
    "secondary": Color(0xFFA1C4E8),
    "background": Color(0xFFFFFFFF),
    "text": Color(0xFF1A1A1A),
  },
  "MonochromeProDark": {
    "primary": Color(0xFFB9B9B9),
    "secondary": Color(0xFF3E5F89),
    "background": Color(0xFF111113),
    "text": Color(0xFFECECEC),
  },
};
