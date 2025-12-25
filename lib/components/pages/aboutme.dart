import 'package:flutter/material.dart';
import 'package:portfolio/settings/defaults.dart';
import 'package:portfolio/settings/jsonload.dart';
import 'package:provider/provider.dart';

class Aboutme extends StatelessWidget {
  const Aboutme({super.key});

  @override
  Widget build(BuildContext context) {
    var defs = Defaults(context);
    var vw = defs.vw();
    var vh = defs.vh();
    final json = context.watch<Jsonload>();
    final data = json.data?["aboutme"]["blocks"];

    return SizedBox(
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: vw * 0.9,
          child: ListView(
            children: List.generate(
              data.length,
              (index1) => SizedBox(
                child: Column(
                  spacing: vh * 0.05,
                  children: [
                    index1 == 0 ? SizedBox(height: vh * 0.1) : SizedBox(),
                    // title
                    Text(data[index1][0], style: TextStyle(fontSize: 30)),
                    // body of contents
                    Container(
                      margin: index1 == data.length
                          ? EdgeInsets.only(bottom: vh * 0.025)
                          : null,
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(
                          data[index1][1].length,
                          (index2) => Container(
                            margin: EdgeInsets.symmetric(vertical: vh * 0.03),
                            child: Text(
                              data[index1][1][index2],
                              softWrap: true,
                              style: TextStyle(fontSize: 20),
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
        ),
      ),
    );
  }
}
