import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenomedia/Global/global.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

DatabaseReference _databaseReference;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance.reference().child("Credit");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Level:",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "1",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(name,
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
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  width: 400,
                  color: Colors.blue[900],
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "2",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Text(
                          "CONTRIBUTIONS",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 300,
                          height: 20,
                          child: LinearPercentIndicator(
                            width: 300.0,
                            lineHeight: 20.0,
                            percent: 0.2,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.green[700],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 200,
                  width: 400,
                  color: Colors.white60,
                  child: Center(
                      child: FirebaseAnimatedList(
                          defaultChild:
                              Center(child: CircularProgressIndicator()),
                          query: _databaseReference,
                          itemBuilder: (_, DataSnapshot snapshot,
                              Animation<double> animation, int index) {
                            return FutureBuilder(
                                future: _databaseReference
                                    .reference()
                                    .child(snapshot.key)
                                    .once(),
                                builder: (context, snapshot1) {
                                  return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text("Green Credits",
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
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          snapshot1.data.value['credit'],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Click here to redeem",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      ]);
                                });
                          })),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
