import 'package:flutter/material.dart';
import 'package:portfolio/settings/defaults.dart';
import 'package:portfolio/settings/jsonload.dart';
import 'package:portfolio/settings/providers.dart';
import 'package:provider/provider.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key});

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  @override
  Widget build(BuildContext context) {
    var defs = Defaults(context);
    var vw = defs.vw();
    var vh = defs.vh();
    final scheme = Theme.of(context).colorScheme;
    final json = context.watch<Jsonload>();
    final List data = json.data?["myprojects"];
    final nav = context.watch<Nav>();
    final ScrollController sc = ScrollController();
    List imagedata = vw >= 1200
        ? data[nav.proj][2][0]
        : vw >= 900
        ? data[nav.proj][2][1]
        : data[nav.proj][2][2];

    Widget images = vw >= 1200
        ? json.pics![nav.proj * 3]
        : vw >= 900
        ? json.pics![nav.proj * 3 + 1]
        : json.pics![nav.proj * 3 + 2];

    bool hasimage = imagedata.isNotEmpty;
    List texts = data[nav.proj][3];

    return Stack(
      children: [
        vw > 450
            ? Positioned(
                right: 0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: vh,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          data.length,

                          //itemCount: data.length,
                          (index) => Listener(
                            behavior: HitTestBehavior.translucent,
                            ///////////onPointerHover: (_) => nav.setx(index),
                            onPointerDown: (_) => nav.setx(index),
                            child: Container(
                              decoration: BoxDecoration(
                                color: (nav.proj == index)
                                    ? scheme.primary
                                    : scheme.secondary,
                                border: Border(left: BorderSide(width: 0.25)),
                              ),

                              width: vw * 0.1,
                              height: vh * 0.095,
                              child: Center(
                                child: Text(
                                  data[index][0],
                                  style: TextStyle(
                                    color: (nav.proj == index)
                                        ? scheme.onPrimary
                                        : scheme.onSecondary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Positioned(
                top: vh * 0.11,
                child: SizedBox(
                  width: vw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () =>
                            nav.setx(((nav.proj - 1) % data.length).toInt()),
                        icon: Icon(Icons.arrow_back),
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (index) => Container(
                              color:
                                  (nav.proj ==
                                      (nav.proj - 1 + index) % data.length)
                                  ? scheme.primary
                                  : scheme.secondary,
                              width: vw * 0.7 / 3,
                              height: vh * 0.08,
                              child: Center(
                                child: Text(
                                  data[(nav.proj - 1 + index) % data.length][0],
                                  style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        (nav.proj ==
                                            (nav.proj - 1 + index) %
                                                data.length)
                                        ? scheme.onPrimary
                                        : scheme.onSecondary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () =>
                            nav.setx(((nav.proj + 1) % data.length).toInt()),
                        icon: Transform.flip(
                          flipX: true,
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

        Positioned(
          top: vw > 450 ? vh * 0.1 : vh * 0.2,
          bottom: vh * 0.01 + 5,
          child: SizedBox(
            width: vw > 450 ? vw * 0.82 : vw,
            height: vw > 450 ? vh * 0.9 : vh * 0.8,
            child: Scrollbar(
              controller: sc,

              thumbVisibility: true,
              child: ListView(
                controller: sc,
                children: [
                  SizedBox(width: vw > 450 ? vw * 0.82 : vw),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          child: Text(
                            data[nav.proj][0],
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            data[nav.proj][1],
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: hasimage
                        ? SizedBox(
                            width: imagedata[1],
                            height: imagedata[2],
                            child: images,
                          )
                        : Container(),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.only(top: 100),
                    child: SizedBox(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: vw * 0.03),
                        child: Column(
                          spacing: 100,
                          children: List.generate(
                            texts.length,
                            (index) => Text(
                              texts[index],
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
