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

  late List _pics;
  List? get pics => _pics;

  Future<void> init() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    _data = await jsonDecode(jsonString);
    getpics();
  }

  void getpics() {
    _pics = [];
    List lst = data?["myprojects"];
    for (int indx1 = 0; indx1 <= lst.length - 1; indx1++) {
      for (int indx2 = 0; indx2 <= 2; indx2++) {
        List imagelist = lst[indx1][2][indx2];
        if (imagelist.isNotEmpty) {
          _pics.add(
            Image.asset(
              lst[indx1][2][indx2][0],
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          );
        } else {
          _pics.add(Container());
        }
      }
    }

    isloading = Loadstate.finished;
    notifyListeners();
  }
}
