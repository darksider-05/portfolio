import 'dart:convert'; // for jsonDecode
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle; // for loadString

enum Loadstate { loading, finished }

class Jsonload extends ChangeNotifier {
  Loadstate isloading = Loadstate.loading;

  Jsonload() {
    init();
  }

  late Map _data;
  Map? get data => _data;

  Future<void> init() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    _data = await jsonDecode(jsonString);
    isloading = Loadstate.finished;
    notifyListeners();
  }
}
