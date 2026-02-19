import 'package:flutter/material.dart';
import 'package:portfolio/settings/defaults.dart';
import "dart:convert";
import 'package:http/http.dart' as http;

class Contactme extends StatefulWidget {
  const Contactme({super.key});

  @override
  State<Contactme> createState() => _ContactmeState();
}

class _ContactmeState extends State<Contactme> {
  var name = TextEditingController();
  var email = TextEditingController();
  var subject = TextEditingController();
  var mess = TextEditingController();
  String? result;
  bool flag1 = false;
  bool flag2 = false;
  bool flag3 = false;
  List<String> empties() {
    List<String> answer = [];
    if (name.text.isEmpty) {
      answer.add("\nname");
    }
    if (subject.text.isEmpty) {
      answer.add("\nsubject");
    }
    if (mess.text.isEmpty) {
      answer.add("\nmessage");
    }

    if (email.text.isNotEmpty) {
      if (!RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      ).hasMatch(email.text)) {
        answer.add("\n*email is not valid");
      }
    }

    if (answer.isEmpty) {
      flag2 = false;
      flag3 = true;
    }

    return answer;
  }

  Future<void> send(
    String name,
    String? email,
    String subject,
    String message,
  ) async {
    final url = Uri.parse("https://portfolio-relay.darksider-05.workers.dev/");

    final Map<String, dynamic> data = {
      "name": name,
      "email": email == "" ? "Not Given" : email,
      "message": "Subject:  $subject\n\n$message",
    };

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          result =
              " thank you for your time. the message was sent successfully.";
        });
      } else {
        setState(() {
          result = "Error: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        result = "Exception: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var defs = Defaults(context);
    var vw = defs.vw();
    var vh = defs.vh();
    var wid = vw > 450 ? vw * 0.4 : vw * 0.3;
    var hei = vh * 0.05;
    final scheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.only(top: vh * 0.1),
      child: Stack(
        children: [
          SizedBox(
            width: vw,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: vh * 0.025,
              children: [
                SizedBox(
                  width: wid,
                  height: hei,
                  child: TextField(
                    controller: name,
                    autocorrect: false,
                    textAlign: TextAlign.center,

                    decoration: InputDecoration(
                      hint: Text("name", textAlign: TextAlign.center),
                    ),
                  ),
                ),
                SizedBox(
                  width: wid,
                  height: hei,
                  child: TextField(
                    controller: email,
                    autocorrect: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hint: Text(
                        "email (optional)",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  width: wid,
                  height: hei,
                  child: TextField(
                    controller: subject,
                    autocorrect: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hint: Text("subject", textAlign: TextAlign.center),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      flag1 = true;
                    });
                  },
                  child: Text(
                    "Rules",
                    style: TextStyle(color: scheme.onPrimary),
                  ),
                ),
                SizedBox(
                  width: vw * 0.6,
                  height: vh * 0.4,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextField(
                      controller: mess,
                      autocorrect: false,
                      maxLines: null,
                      decoration: InputDecoration(hint: Text("message")),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      flag2 = true;
                    });
                  },
                  child: Text(
                    "send",
                    style: TextStyle(color: scheme.onPrimary),
                  ),
                ),
              ],
            ),
          ),

          flag1
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      flag1 = false;
                    });
                  },
                  child: Container(
                    width: vw,
                    height: vh,
                    color: Colors.black12,
                    child: Container(
                      width: vw * 0.7,
                      height: vh * 0.6,
                      color: scheme.secondary,
                      child: Center(
                        child: Text(
                          "Rules:\n\nAll fields except the email need to be filled\n\nPlease use a consistent name so I recognize repeat senders\n\nThe server will only accept one message about every hour.\n\nThis includes other people's messages also.",
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),

          flag2
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      flag2 = false;
                    });
                  },
                  child: Container(
                    width: vw,
                    height: vh,
                    color: Colors.black12,
                    child: Center(
                      child: Container(
                        width: vw * 0.7,
                        height: vh * 0.8,
                        color: scheme.secondary,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("The following fields must be filled:"),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List.generate(
                                empties().length,
                                (index) => Text(empties()[index]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),

          flag3
              ? result == null
                    ? Container(
                        width: vw,
                        height: vh,
                        color: Colors.black12,
                        child: Center(
                          child: Container(
                            width: vw * 0.7,
                            height: vh * 0.8,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: vh * 0.01,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "All is ready",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "Please be aware that:",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "The server will only accept one message about every hour.",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "This includes other people's messages also.",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Row(
                                  spacing: vw * 0.05,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          flag3 = false;
                                        });
                                      },
                                      child: Center(
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),

                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                      ),
                                      onPressed: () {
                                        send(
                                          name.text,
                                          email.text,
                                          subject.text,
                                          mess.text,
                                        );

                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text("sending..."),
                                            duration: Duration(seconds: 3),
                                          ),
                                        );
                                      },
                                      child: Center(
                                        child: Text(
                                          //"Send",
                                          "send",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            flag3 = false;
                            result = null;
                          });
                        },
                        child: Container(
                          width: vw,
                          height: vh,
                          color: Colors.black12,
                          child: Container(
                            width: vw * 0.7,
                            height: vh * 0.6,
                            color: scheme.secondary,
                            child: Center(
                              child: Text(
                                result ?? "",
                                style: TextStyle(color: scheme.onSecondary),
                              ),
                            ),
                          ),
                        ),
                      )
              : Container(),
        ],
      ),
    );
  }
}
