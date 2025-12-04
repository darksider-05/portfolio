import 'package:flutter/material.dart';

class Defaults {
  late BuildContext context;
  late double width;
  late double height;
  late double scw;
  late double sch;
  late bool isver;

  Defaults(this.context) {
    scw = MediaQuery.of(context).size.shortestSide;
    sch = MediaQuery.of(context).size.longestSide;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    isver = MediaQuery.of(context).orientation == Orientation.portrait;
  }

  double vw() {
    return isver ? scw : sch;
  }

  double vh() {
    return isver ? sch : scw;
  }

  double ww() {
    return isver ? width : height;
  }

  double wh() {
    return isver ? height : width;
  }
}
