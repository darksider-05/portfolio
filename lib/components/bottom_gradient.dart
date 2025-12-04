import 'package:flutter/material.dart';
import 'package:portfolio/settings/defaults.dart';
import 'package:portfolio/settings/gradient.dart';
import 'package:provider/provider.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    final grad = Provider.of<Grad>(context);
    var defs = Defaults(context);
    var vw = defs.vw();

    return Positioned(
      bottom: 0,
      child: TweenAnimationBuilder<LinearGradient>(
        tween: GradientTween(begin: grad.previous, end: grad.lg),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        builder: (context, animGradient, _) {
          return Container(
            width: vw,
            height: 7,
            decoration: BoxDecoration(
              gradient: animGradient,
              boxShadow: [
                BoxShadow(
                  blurRadius: 12,
                  spreadRadius: 2,
                  color: grad.lg.colors[2].withAlpha(153),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class GradientTween extends Tween<LinearGradient> {
  GradientTween({required LinearGradient begin, required LinearGradient end})
    : super(begin: begin, end: end);

  @override
  LinearGradient lerp(double t) {
    return LinearGradient(
      begin: begin!.begin,
      end: begin!.end,
      colors: List.generate(begin!.colors.length, (i) {
        return Color.lerp(begin!.colors[i], end!.colors[i], t)!;
      }),
      stops: begin!.stops,
    );
  }
}
