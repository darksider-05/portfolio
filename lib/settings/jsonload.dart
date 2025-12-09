import 'dart:convert'; // for jsonDecode
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle; // for loadString

class Jsonload extends ChangeNotifier {
  Jsonload() {
    init();
  }

  Map? _data;
  Map? get data => _data;

  Future<void> init() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    _data = await jsonDecode(jsonString);
    notifyListeners();
  }
}
