import 'package:flutter/material.dart';
import 'package:portfolio/settings/providers.dart';

Color lighten(Color color, [double amount = 0.12]) {
  final hsl = HSLColor.fromColor(color);
  final light = (hsl.lightness + amount).clamp(0.0, 1.0);
  return hsl.withLightness(light).toColor();
}

class PageName extends StatefulWidget {
  final String name;
  final double width;
  final double height;
  final String place;
  final VoidCallback f;
  final int target;
  final Nav nav;
  final bool selector;

  const PageName({
    super.key,
    required this.name,
    required this.width,
    required this.height,
    required this.place,
    required this.f,
    required this.target,
    required this.nav,
    required this.selector,
  });

  @override
  State<PageName> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<PageName> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final bool isSelected = widget.nav.currentpage == widget.target;

    final Color baseColor = isSelected
        ? scheme.primary
        : scheme.secondary.withAlpha(89);

    final Color hoverColor = lighten(baseColor, 0.12);

    final Color bgColor = isHovered
        ? isSelected
              ? baseColor
              : hoverColor
        : baseColor;

    return MouseRegion(
      onEnter: (_) => setState(() {
        if (!isHovered) isHovered = true;
        if (widget.selector) {
          if (!widget.nav.selFlag) {
            widget.nav.selecting();
          }
        } else {
          if (widget.nav.selFlag) {
            widget.nav.done();
          }
        }
      }),
      onExit: (_) => setState(() {
        if (isHovered) isHovered = false;
      }),
      child: InkWell(
        onTap: widget.f,
        borderRadius: BorderRadius.only(
          bottomLeft: widget.place == "l"
              ? const Radius.circular(30)
              : Radius.zero,
          bottomRight: widget.place == "r"
              ? const Radius.circular(30)
              : widget.width > 450
              ? Radius.zero
              : const Radius.circular(30),
        ),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.only(
              bottomLeft: widget.place == "l"
                  ? const Radius.circular(30)
                  : Radius.zero,
              bottomRight: widget.place == "r"
                  ? const Radius.circular(30)
                  : Radius.zero,
            ),
          ),
          width: widget.width > 450 ? widget.width * 0.8 / 4 : widget.width / 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: widget.height * 0.1),
              Center(
                child: Text(
                  widget.name,
                  style: TextStyle(
                    color: isSelected ? scheme.onPrimary : scheme.onSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
