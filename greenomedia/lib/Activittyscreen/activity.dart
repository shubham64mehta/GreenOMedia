import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenomedia/Plantatree/tree.dart';
import 'package:greenomedia/waste/biodegradable.dart';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  List<String> images = [
    "images/conference.jpeg",
    "images/Greenexpo.jpeg",
    "images/Plantation.jpeg",
  ];
  List<String> names = [
    "Crop Science \nand Exhibition ",
    "Green \nexpo",
    "Plantation \ndrive"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("GreenOMedia",
            style: GoogleFonts.kaushanScript(
                letterSpacing: 5,
                shadows: [
                  Shadow(
                      color: Colors.grey, blurRadius: 5, offset: Offset(2, 3))
                ],
                color: Colors.green[900],
                fontSize: 30,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 19,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Events Nearby",
                    style: GoogleFonts.kaushanScript(
                        shadows: [
                          Shadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              offset: Offset(2, 3))
                        ],
                        color: Colors.green[900],
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shadowColor: Colors.grey,
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: MediaQuery.of(context).size.height / 3.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width / 1.8,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: ExactAssetImage(
                                          images[index],
                                        ),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20))),
                              ),
                              Text(names[index],
                                  style: GoogleFonts.kaushanScript(
                                      shadows: [
                                        Shadow(
                                            color: Colors.grey,
                                            blurRadius: 5,
                                            offset: Offset(2, 3))
                                      ],
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Activities",
                    style: GoogleFonts.kaushanScript(
                        shadows: [
                          Shadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              offset: Offset(2, 3))
                        ],
                        color: Colors.green[900],
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 29),
            Center(
              child: CupertinoContextMenu(
                actions: [
                  CupertinoContextMenuAction(
                    trailingIcon: CupertinoIcons.forward,
                    child: const Text(
                      'Do it Now',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Tree1()));
                      });
                    },
                  ),
                  CupertinoContextMenuAction(
                    trailingIcon: CupertinoIcons.time,
                    child: const Text(
                      'Remind me later',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
                child: Card(
                  shadowColor: Colors.black,
                  elevation: 34,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 3.8,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width / 1.8,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: ExactAssetImage(
                                    "images/plant.jpg",
                                  ),
                                  fit: BoxFit.fitHeight),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                        ),
                        Text("Plant a\nTree",
                            style: GoogleFonts.kaushanScript(
                                shadows: [
                                  Shadow(
                                      color: Colors.grey,
                                      blurRadius: 5,
                                      offset: Offset(2, 3))
                                ],
                                color: Colors.black,
                                fontSize: 34,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 29),
            Center(
              child: CupertinoContextMenu(
                actions: [
                  CupertinoContextMenuAction(
                    child: const Text(
                      'Biodegradable',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Biodegradable()));
                    },
                  ),
                  CupertinoContextMenuAction(
                    child: const Text(
                      'Non-Biodegradable',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Biodegradable()));
                    },
                  ),
                  CupertinoContextMenuAction(
                    child: const Text(
                      'E-Waste',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Biodegradable()));
                    },
                  ),
                ],
                child: Card(
                  shadowColor: Colors.black,
                  elevation: 34,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 3.8,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width / 1.8,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: ExactAssetImage(
                                    "images/waste.png",
                                  ),
                                  fit: BoxFit.fitHeight),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                        ),
                        Flexible(
                          child: Text("Sell your\nWaste",
                              style: GoogleFonts.kaushanScript(
                                  shadows: [
                                    Shadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                        offset: Offset(2, 3))
                                  ],
                                  color: Colors.black,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 29),
            Center(
              child: CupertinoContextMenu(
                actions: [
                  CupertinoContextMenuAction(
                    child: const Text(
                      'Coming Soon....',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
                child: Card(
                  shadowColor: Colors.black,
                  elevation: 34,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 3.8,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width / 1.8,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: ExactAssetImage(
                                    "images/blog.jpg",
                                  ),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                        ),
                        Flexible(
                          child: Text(" blog On\nenvironment",
                              style: GoogleFonts.kaushanScript(
                                  shadows: [
                                    Shadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                        offset: Offset(2, 3))
                                  ],
                                  color: Colors.black,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 29),
            Center(
              child: CupertinoContextMenu(
                actions: [
                  CupertinoContextMenuAction(
                    trailingIcon: CupertinoIcons.forward,
                    child: const Text(
                      'Do it Now',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Tree1()));
                    },
                  ),
                  CupertinoContextMenuAction(
                    trailingIcon: CupertinoIcons.time,
                    child: const Text(
                      'Remind me later',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
                child: Card(
                  shadowColor: Colors.black,
                  elevation: 34,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 3.8,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width / 1.8,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: ExactAssetImage(
                                    "images/donate.jpg",
                                  ),
                                  fit: BoxFit.fitHeight),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                        ),
                        Text("Donate",
                            style: GoogleFonts.kaushanScript(
                                shadows: [
                                  Shadow(
                                      color: Colors.grey,
                                      blurRadius: 5,
                                      offset: Offset(2, 3))
                                ],
                                color: Colors.black,
                                fontSize: 34,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 29),
            Center(
              child: CupertinoContextMenu(
                actions: [
                  CupertinoContextMenuAction(
                    child: const Text(
                      'Coming Soon....',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
                child: Card(
                  shadowColor: Colors.black,
                  elevation: 34,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 3.8,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width / 1.8,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: ExactAssetImage(
                                    "images/group.jpg",
                                  ),
                                  fit: BoxFit.fitHeight),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                        ),
                        Flexible(
                          child: Text("Participate and\nCreate awareness",
                              style: GoogleFonts.kaushanScript(
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
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
