import 'package:flutter/material.dart';
import 'package:portfolio/components/pages/aboutme.dart';
import 'package:portfolio/settings/providers.dart';
import 'package:provider/provider.dart';

class Wide extends StatefulWidget {
  const Wide({super.key});

  @override
  State<Wide> createState() => _WideState();
}

class _WideState extends State<Wide> {
  @override
  Widget build(BuildContext context) {
    final nav = context.watch<Nav>();

    return switch (nav.currentpage) {
      1 => Aboutme(),
      2 => Container(),
      _ => Aboutme(),
    };
  }
}
