import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenomedia/Global/global.dart';
import 'package:greenomedia/calendar/Calendar.dart';

DatabaseReference _databaseReference;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance.reference().child("Credit");
    if (a == null) {
      setState(() {
        a = 2;
      });
    }
    print(name);
    print(a);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(name,
                style: GoogleFonts.kaushanScript(
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
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green[700],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("GREEN CREDITS: ",
                              style: GoogleFonts.kaushanScript(
                                  shadows: [
                                    Shadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                        offset: Offset(2, 3))
                                  ],
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            a.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Environment\nNews",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Latest Updates on\nWorld Environment",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Container(
                          height: 230,
                          width: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/t.jpg"),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 30, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 230,
                          width: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/s.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Air Quality",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Quality of air in\nyour city",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Calendar()));
                  },
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: Colors.orange[100],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 30, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Environment\nCalendar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Your environment\nevents\nCalendar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Container(
                            height: 230,
                            width: 180,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/c.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
