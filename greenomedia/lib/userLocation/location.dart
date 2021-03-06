import 'dart:async';
import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:env/Homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:greenomedia/Global/global.dart';
import 'package:greenomedia/bottomnavbaaar/bottombar.dart';
import 'package:greenomedia/userLocation/msg.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String _latitude;
  String _longitude;
  String add1;
  String add2;
  bool f = true;
  Future read() async {
    FirebaseDatabase.instance
        .reference()
        .child("Credit")
        .child(user1)
        .once()
        .then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values;
      values = snapshot.value;

      values.forEach((key, value) {
        //
        FirebaseDatabase.instance
            .reference()
            .child("Credit")
            .child(user1)
            .child("credit")
            .once()
            .then((DataSnapshot s) {
          credit = s.value;
          a = int.parse(credit);
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getlocation();
    startTime();
    read();
  }

  getlocation() async {
    final geoposition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _latitude = '${geoposition.latitude}';
      _longitude = '${geoposition.longitude}';
      var a = double.parse(_latitude);
      var b = double.parse(_longitude);
      address(a, b);
    });
  }

  address(var latitude, var longitude) async {
    final coordinates = new Coordinates(latitude, longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(() {
      add1 = addresses.first.featureName;
      address1 = addresses.first.addressLine;
      f = false;
    });
  }

  startTime() async {
    var duration = new Duration(seconds: 7);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Message()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            DelayedDisplay(
              delay: Duration(seconds: 2),
              fadeIn: true,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage("images/Location.gif"),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DelayedDisplay(
                delay: Duration(seconds: 3),
                fadeIn: true,
                child: Text(
                  f == true ? "HI" : address1,
                  style: f == true
                      ? TextStyle(color: Colors.white)
                      : TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
