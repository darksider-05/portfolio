import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/settings/defaults.dart';
import 'package:portfolio/settings/jsonload.dart';
import 'package:portfolio/settings/providers.dart';
import 'package:provider/provider.dart';

class SelectorW extends StatefulWidget {
  const SelectorW({super.key});

  @override
  State<SelectorW> createState() => _SelectorWState();
}

class _SelectorWState extends State<SelectorW> {
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final nav = context.watch<Nav>();
    final json = context.watch<Jsonload>();
    final List data = json.data?["myprojects"];
    var defs = Defaults(context);
    var vw = defs.vw();
    var vh = defs.vh();

    return Positioned(
      top: vh * 0.1,
      child: Container(
        color: scheme.onPrimary,
        padding: EdgeInsets.only(top: vh * 0.02),
        width: vw,
        child: ListView.builder(
          itemCount: data.length ~/ 4 + data.length % 4,
          itemBuilder: (context, index1) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              min(data.length - (index1 * 4), 4),
              (index2) => GestureDetector(
                onTap: () {
                  nav.setx(index1 * 4 + index2);
                  nav.done();
                },
                child: Container(
                  color: scheme.secondary,
                  child: Center(
                    child: Text(
                      data[index1 * 4 + index2],
                      style: TextStyle(color: scheme.onSecondary, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectorN extends StatefulWidget {
  const SelectorN({super.key});

  @override
  State<SelectorN> createState() => _SelectorNState();
}

class _SelectorNState extends State<SelectorN> {
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final nav = context.watch<Nav>();
    final json = context.watch<Jsonload>();
    final List data = json.data?["myprojects"];
    var defs = Defaults(context);
    var vw = defs.vw();
    var vh = defs.vh();

    if (!nav.selFlag) {
      return Positioned(
        top: 0.1,
        child: GestureDetector(
          onTap: () => nav.selecting(),
          child: Container(
            width: vw * 0.9,
            height: 0.05,
            decoration: BoxDecoration(
              color: scheme.primary,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_downward, color: scheme.onPrimary),
                Text(
                  "Press to select the project",
                  style: TextStyle(color: scheme.onPrimary),
                ),
                Icon(Icons.arrow_downward, color: scheme.onPrimary),
              ],
            ),
          ),
        ),
      );
    } else {
      return Positioned(
        top: vh * 0.1,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => nav.selecting(),
              child: Container(
                width: vw * 0.9,
                height: 0.05,
                decoration: BoxDecoration(
                  color: scheme.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_upward, color: scheme.onPrimary),
                    Text(
                      "Press to cancel selecting the project",
                      style: TextStyle(color: scheme.onPrimary),
                    ),
                    Icon(Icons.arrow_upward, color: scheme.onPrimary),
                  ],
                ),
              ),
            ),
            Container(
              color: scheme.onPrimary,
              padding: EdgeInsets.only(top: vh * 0.02),
              width: vw * 0.9,
              child: ListView.builder(
                itemCount: data.length ~/ 2 + data.length % 2,
                itemBuilder: (context, index1) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    min(data.length - (index1 * 2), 2),
                    (index2) => GestureDetector(
                      onTap: () {
                        nav.setx(index1 * 2 + index2);
                        nav.done();
                      },
                      child: Container(
                        color: scheme.secondary,
                        child: Center(
                          child: Text(
                            data[index1 * 2 + index2],
                            style: TextStyle(
                              color: scheme.onSecondary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
