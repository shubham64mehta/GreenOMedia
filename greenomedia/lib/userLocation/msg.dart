import 'dart:async';
import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
//import 'package:env/Homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenomedia/Global/global.dart';
import 'package:greenomedia/bottomnavbaaar/bottombar.dart';

class Message extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Message> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Bottom()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoAlertDialog(
        title: Text("Congrats ",
            style: GoogleFonts.kaushanScript(
                letterSpacing: 5,
                shadows: [
                  Shadow(
                      color: Colors.grey, blurRadius: 5, offset: Offset(2, 3))
                ],
                color: Colors.green[900],
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        content: Text("You have received 2 credits for registration",
            style: GoogleFonts.kaushanScript(
                letterSpacing: 5,
                shadows: [
                  Shadow(
                      color: Colors.grey, blurRadius: 5, offset: Offset(2, 3))
                ],
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
