import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sapling extends StatefulWidget {
  @override
  _SaplingState createState() => _SaplingState();
}

class _SaplingState extends State<Sapling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text("GreenOMedia Store",
              style: GoogleFonts.kaushanScript(
                  letterSpacing: 5,
                  shadows: [
                    Shadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(2, 3))
                  ],
                  color: Colors.green[900],
                  fontSize: 26,
                  fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 60),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: ExactAssetImage("images/Soil.jpeg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: MediaQuery.of(context).size.height / 4,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Soil and\nfertilizers",
                          style: GoogleFonts.kaushanScript(
                              letterSpacing: 5,
                              shadows: [
                                Shadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    offset: Offset(2, 3))
                              ],
                              color: Colors.green[900],
                              fontSize: 24,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: ExactAssetImage("images/seeds.jpeg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: MediaQuery.of(context).size.height / 4,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Seeds",
                        style: GoogleFonts.kaushanScript(
                            letterSpacing: 5,
                            shadows: [
                              Shadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(2, 3))
                            ],
                            color: Colors.green[900],
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 35,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: ExactAssetImage("images/combo.jpeg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: MediaQuery.of(context).size.height / 4,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Combo\nPlants",
                        style: GoogleFonts.kaushanScript(
                            letterSpacing: 5,
                            shadows: [
                              Shadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(2, 3))
                            ],
                            color: Colors.green[900],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: ExactAssetImage("images/saplimg.jpeg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: MediaQuery.of(context).size.height / 4,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Saplings",
                        style: GoogleFonts.kaushanScript(
                            letterSpacing: 5,
                            shadows: [
                              Shadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(2, 3))
                            ],
                            color: Colors.green[900],
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
