import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/settings/defaults.dart';

class Line extends StatefulWidget {
  const Line({super.key});

  @override
  State<Line> createState() => _LineState();
}

class _LineState extends State<Line> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static List<LinearGradient> gradients = [
    LinearGradient(
      colors: [
        Color(0xFF2EC4B6),
        Color(0xFFBFA8FF),
        Color(0xFFFF6B66),
        Color(0xFFFFD15E),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.0, 0.33, 0.66, 1.0],
    ),
    LinearGradient(
      colors: [
        Color(0xFFBFA8FF),
        Color(0xFFFF6B66),
        Color(0xFFFFD15E),
        Color(0xFF2EC4B6),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.0, 0.33, 0.66, 1.0],
    ),
    LinearGradient(
      colors: [
        Color(0xFFFF6B66),
        Color(0xFFFFD15E),
        Color(0xFF2EC4B6),
        Color(0xFFBFA8FF),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.0, 0.33, 0.66, 1.0],
    ),
    LinearGradient(
      colors: [
        Color(0xFFFFD15E),
        Color(0xFF2EC4B6),
        Color(0xFFBFA8FF),
        Color(0xFFFF6B66),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.0, 0.33, 0.66, 1.0],
    ),
  ];

  int pre = 1;
  int nxt = 1;
  int index = 1;
  LinearGradient get previous => gradients[pre];
  LinearGradient get next => gradients[nxt];

  Timer? timer;

  void setpage(int target) {
    setState(() {
      pre = nxt;
      nxt = target;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   timer = Timer.periodic(const Duration(milliseconds: 2000), (self) {
  //     index = (index + 1) % 4;
  //     setpage(index);
  //   });
  // }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.addStatusListener((status) {
      debugPrint(
        '${DateTime.now().toIso8601String()}  '
        'status=$status  value=${_controller.value}',
      );

      if (status == AnimationStatus.completed) {
        index = (index + 1) % gradients.length;
        setpage(index);

        _controller.forward(from: 0);
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var defs = Defaults(context);
    var vw = defs.vw();
    var vh = defs.vh();

    return Positioned(
      bottom: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1500),
        width: vw,
        height: vh * 0.01,
        decoration: BoxDecoration(
          gradient: next,
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              spreadRadius: 2,
              color: next.colors[2].withAlpha(153),
            ),
          ],
        ),
      ),
    );
  }
}
