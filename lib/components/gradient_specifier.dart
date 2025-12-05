import 'package:flutter/material.dart';
import 'package:portfolio/settings/gradient.dart';
import 'package:provider/provider.dart';

class Definer extends StatelessWidget {
  const Definer({super.key});

  @override
  Widget build(BuildContext context) {
    final grad = Provider.of<Grad>(context);
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerHover: (_) => grad.setpage(1),
                    onPointerDown: (_) => grad.setpage(1),
                    child: const SizedBox.expand(),
                  ),
                ),
                Expanded(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerHover: (_) => grad.setpage(2),
                    onPointerDown: (_) => grad.setpage(2),
                    child: const SizedBox.expand(),
                  ),
                ),
                Expanded(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerHover: (_) => grad.setpage(3),
                    onPointerDown: (_) => grad.setpage(3),
                    child: const SizedBox.expand(),
                  ),
                ),
                Expanded(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerHover: (_) => grad.setpage(4),
                    onPointerDown: (_) => grad.setpage(4),
                    child: const SizedBox.expand(),
                  ),
                ),
              ],
            ),
          ),

          //second one
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerHover: (_) => grad.setpage(4),
                    onPointerDown: (_) => grad.setpage(4),
                    child: const SizedBox.expand(),
                  ),
                ),
                Expanded(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerHover: (_) => grad.setpage(3),
                    onPointerDown: (_) => grad.setpage(3),
                    child: const SizedBox.expand(),
                  ),
                ),
                Expanded(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerHover: (_) => grad.setpage(2),
                    onPointerDown: (_) => grad.setpage(2),
                    child: const SizedBox.expand(),
                  ),
                ),
                Expanded(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerHover: (_) => grad.setpage(1),
                    onPointerDown: (_) => grad.setpage(1),
                    child: const SizedBox.expand(),
                  ),
                ),
              ],
            ),
          ),

          //third one
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerHover: (_) => grad.setpage(1),
                    onPointerDown: (_) => grad.setpage(1),
                    child: const SizedBox.expand(),
                  ),
                ),
                Expanded(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerHover: (_) => grad.setpage(2),
                    onPointerDown: (_) => grad.setpage(2),
                    child: const SizedBox.expand(),
                  ),
                ),
                Expanded(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerHover: (_) => grad.setpage(3),
                    onPointerDown: (_) => grad.setpage(3),
                    child: const SizedBox.expand(),
                  ),
                ),
                Expanded(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerHover: (_) => grad.setpage(4),
                    onPointerDown: (_) => grad.setpage(4),
                    child: const SizedBox.expand(),
                  ),
                ),
              ],
            ),
          ),

          //fourth one
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerHover: (_) => grad.setpage(4),
                    onPointerDown: (_) => grad.setpage(4),
                    child: const SizedBox.expand(),
                  ),
                ),
                Expanded(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerHover: (_) => grad.setpage(3),
                    onPointerDown: (_) => grad.setpage(3),
                    child: const SizedBox.expand(),
                  ),
                ),
                Expanded(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerHover: (_) => grad.setpage(2),
                    onPointerDown: (_) => grad.setpage(2),
                    child: const SizedBox.expand(),
                  ),
                ),
                Expanded(
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerHover: (_) => grad.setpage(1),
                    onPointerDown: (_) => grad.setpage(1),
                    child: const SizedBox.expand(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
