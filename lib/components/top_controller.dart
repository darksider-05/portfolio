import 'package:flutter/material.dart';
import 'package:portfolio/components/top_buttons.dart';
import 'package:portfolio/settings/defaults.dart';
import 'package:provider/provider.dart';

import '../settings/providers.dart';

class TC extends StatefulWidget {
  const TC({super.key});

  @override
  State<TC> createState() => _TCState();
}

class _TCState extends State<TC> {
  @override
  Widget build(BuildContext context) {
    var defs = Defaults(context);
    var vw = defs.vw();
    var vh = defs.vh();

    final nav = context.watch<Nav>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: vw),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          width: vw > 450 ? vw * 0.8 : vw,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: vh * 0.1),
              PageName(
                name: "Home",
                width: vw,
                height: vh,
                place: "l",
                f: nav.set1,
                target: 1,
                current: nav.currentpage,
              ),
              PageName(
                name: "About me",
                width: vw,
                height: vh,
                place: "m",
                f: nav.set2,
                target: 2,
                current: nav.currentpage,
              ),
              PageName(
                name: "My projects",
                width: vw,
                height: vh,
                place: "m",
                f: nav.set3,
                target: 3,
                current: nav.currentpage,
              ),
              PageName(
                name: "Contact me",
                width: vw,
                height: vh,
                place: "m",
                f: nav.set4,
                target: 4,
                current: nav.currentpage,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
