import 'package:flutter/material.dart';
import 'package:portfolio/components/bottom_gradient.dart';
import 'package:portfolio/components/frame.dart';
import 'package:portfolio/components/gradient_specifier.dart';
import 'package:portfolio/components/top_controller.dart';
import 'package:portfolio/settings/gradient.dart';
import 'package:portfolio/settings/jsonload.dart';
import 'package:portfolio/settings/providers.dart';
import 'package:portfolio/settings/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Nav()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => Jsonload()),
        ChangeNotifierProvider(create: (_) => Grad()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.theme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Jsonload>(context);
    return Scaffold(
      body: data.isloading == Loadstate.finished
          ? Stack(
              children: [
                Wide(),
                Line(),
                Positioned(top: 0, child: TC()),
                Definer(),
              ],
            )
          : Center(child: Text("Loading...")),
    );
  }
}
