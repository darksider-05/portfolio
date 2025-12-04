import 'dart:math';

import 'package:flutter/material.dart';
import '/settings/defaults.dart';

class Aboutme extends StatefulWidget {
  const Aboutme({super.key});

  @override
  State<Aboutme> createState() => _WideState();
}

class _WideState extends State<Aboutme> {
  @override
  Widget build(BuildContext context) {
    var defs = Defaults(context);
    var vw = defs.vw();
    var vh = defs.vh();

    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: vw > 600
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Textpart(), Imagecon()],
            )
          : Column(
              spacing: min(vh, vw * 0.8) * 0.8 * 0.66,
              children: [
                Column(
                  children: [
                    SizedBox(height: vh * 0.1 + 25),
                    Myimage(),
                  ],
                ),
                Textpart(),
              ],
            ),
    );
  }
}

class Myimage extends StatelessWidget {
  const Myimage({super.key});

  @override
  Widget build(BuildContext context) {
    var defs = Defaults(context);
    var vw = defs.vw();
    var vh = defs.vh();

    return ClipOval(
      child: ClipRRect(
        child: Center(
          child: ClipOval(
            child: SizedBox.square(
              dimension: min(vh, vw * 0.7) * 0.7 * 0.66,
              child: Transform.scale(
                scale: 1.5,
                child: Image.asset(
                  'assets/myimage.jpg',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Textpart extends StatelessWidget {
  const Textpart({super.key});

  @override
  Widget build(BuildContext context) {
    var defs = Defaults(context);
    var vw = defs.vw();
    var vh = defs.vh();

    return Container(
      color: Colors.transparent,
      width: vw * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.translate(
            offset: Offset(0, -vh * 0.2),
            child: Container(
              color: Colors.transparent,
              child: Center(
                child: Text("Introduction", style: TextStyle(fontSize: 28)),
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("explaination", style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

class Imagecon extends StatelessWidget {
  const Imagecon({super.key});

  @override
  Widget build(BuildContext context) {
    var defs = Defaults(context);
    var vw = defs.vw();
    var vh = defs.vh();

    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: ClipOval(
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              width: min(vh, vw * 0.7) * 0.8 * 0.66,
              height: min(vh, vw * 0.7) * 0.8 * 0.66,
            ),
          ),
        ),
        Myimage(),
      ],
    );
  }
}
