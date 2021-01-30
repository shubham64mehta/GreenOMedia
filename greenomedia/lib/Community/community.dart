import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'community1.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  List<String> abc = ["Hello"];
  List<String> abc1 = ['Group1', 'Group2', 'Group3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
              child: Text("Community",
                  style: GoogleFonts.kaushanScript(
                      letterSpacing: 5,
                      shadows: [
                        Shadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(2, 3))
                      ],
                      color: Colors.green[900],
                      fontSize: 30,
                      fontWeight: FontWeight.bold))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Community1(
                                  groupname: "Earthlings",
                                )));
                  },
                  child: Card(
                      elevation: 20,
                      child: Container(
                        color: Colors.green[100],
                        height: 170,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: Text("Earthlings",
                                    style: GoogleFonts.kaushanScript(
                                        letterSpacing: 5,
                                        shadows: [
                                          Shadow(
                                              color: Colors.grey,
                                              blurRadius: 5,
                                              offset: Offset(2, 3))
                                        ],
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          ExactAssetImage("images/girl12.jpeg"),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          ExactAssetImage("images/girl11.jpeg"),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          ExactAssetImage("images/girl4.jpeg"),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          ExactAssetImage("images/girl5.jpeg"),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          ExactAssetImage("images/girl7.jpg"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Community1(
                                  groupname: "California Support Community",
                                )));
                  },
                  child: Card(
                      elevation: 20,
                      child: Container(
                        color: Colors.green[100],
                        height: 170,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: Text("California Support Community",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.kaushanScript(
                                        letterSpacing: 5,
                                        shadows: [
                                          Shadow(
                                              color: Colors.grey,
                                              blurRadius: 5,
                                              offset: Offset(2, 3))
                                        ],
                                        color: Colors.black,
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          ExactAssetImage("images/girl8.jpeg"),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          ExactAssetImage("images/girl7.jpg"),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          ExactAssetImage("images/girl9.jpeg"),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          ExactAssetImage("images/girl4.jpeg"),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          ExactAssetImage("images/girl10.jpeg"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Community1(
                                  groupname: "Green Warriors",
                                )));
                  },
                  child: Card(
                      elevation: 20,
                      child: Container(
                        color: Colors.green[100],
                        height: 170,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(
                                child: Text("Green Warriors",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.kaushanScript(
                                        letterSpacing: 5,
                                        shadows: [
                                          Shadow(
                                              color: Colors.grey,
                                              blurRadius: 5,
                                              offset: Offset(2, 3))
                                        ],
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          ExactAssetImage("images/girl11.jpeg"),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          ExactAssetImage("images/girl12.jpeg"),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          ExactAssetImage("images/girl13.jpeg"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
