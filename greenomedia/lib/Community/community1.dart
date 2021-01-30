import 'dart:async';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenomedia/Global/global.dart';

int f, g, k;
String text1, text2;

class Community1 extends StatefulWidget {
  final String groupname;

  const Community1({Key key, this.groupname}) : super(key: key);
  @override
  _Community1State createState() => _Community1State();
}

class _Community1State extends State<Community1> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                f = 1;
                g = 0;
              });
            }),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Center(
          child: Text(widget.groupname,
              style: GoogleFonts.kaushanScript(
                  letterSpacing: 5,
                  shadows: [
                    Shadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(2, 3))
                  ],
                  color: Colors.green[900],
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.7,
              // color: Colors.green,
              child: Column(
                children: [
                  if (f == 0)
                    DelayedDisplay(
                      delay: Duration(seconds: 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: MediaQuery.of(context).size.width / 9,
                            decoration: BoxDecoration(
                                color: Colors.green[100],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 20,
                                    backgroundImage: NetworkImage(imageUrl),
                                  ),
                                  Center(
                                    child: Text(
                                      text1,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  if (g == 1)
                    DelayedDisplay(
                      delay: Duration(seconds: 5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.width / 9,
                            decoration: BoxDecoration(
                                color: Colors.green[100],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 20,
                                    backgroundImage:
                                        ExactAssetImage("images/girl4.jpeg"),
                                  ),
                                  Center(
                                    child: Text(
                                      "Welcome to our group",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (g == 1)
                    DelayedDisplay(
                      delay: Duration(seconds: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: MediaQuery.of(context).size.width / 9,
                            decoration: BoxDecoration(
                                color: Colors.green[100],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    backgroundImage:
                                        ExactAssetImage('images/girl6.jpeg'),
                                  ),
                                  Center(
                                    child: Text(
                                      "How are you doing ",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (g == 1)
                    DelayedDisplay(
                      delay: Duration(seconds: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: MediaQuery.of(context).size.width / 9,
                            decoration: BoxDecoration(
                                color: Colors.green[100],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    backgroundImage:
                                        ExactAssetImage('images/girl7.jpg'),
                                  ),
                                  Center(
                                    child: Text(
                                      "Hi",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6.8,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: "Write Something",
                      ),
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      text1 = controller.text;
                      controller.clear();
                      setState(() {
                        f = 0;
                        g = 1;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
