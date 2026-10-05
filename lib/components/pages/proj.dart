import 'package:flutter/material.dart';
import 'package:portfolio/components/proj_selector.dart';
import 'package:portfolio/settings/defaults.dart';
import 'package:portfolio/settings/jsonload.dart';
import 'package:portfolio/settings/providers.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final json = context.watch<Jsonload>();
    final List data = json.data?["myprojects"];
    final nav = context.watch<Nav>();
    final ScrollController sc = nav.sc;
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
    final Uri url = data[nav.proj][4] != null
        ? Uri.parse(data[nav.proj][4])
        : Uri.parse("");

    return Stack(
      children: [
        Positioned(
          top: vw > 450
              ? vh * (((data.length / 4).ceil() * 0.04) + 0.1)
              : vh * (((data.length / 2).ceil() * 0.04) + 0.1),
          bottom: vh * 0.01 + 5,
          child: SizedBox(
            width: vw > 450 ? vw : vw,
            height: vw > 450 ? vh * 0.8 : vh * 0.8,
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
                          children:
                              List<Widget>.generate(
                                texts.length,
                                (index) => Text(
                                  texts[index],
                                  style: TextStyle(fontSize: 20),
                                ),
                              ) +
                              [
                                TextButton(
                                  onPressed: () async {
                                    await launchUrl(
                                      url,
                                      webOnlyWindowName: '_blank',
                                    );
                                  },
                                  child: Text(
                                    data[nav.proj][4] ?? "",
                                    style: TextStyle(color: Colors.blue),
                                  ), //TextButton(onPressed: (){htto}, child: child),
                                ),
                              ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        vw > 800 ? SelectorW() : SelectorN(),
      ],
    );
  }
}
