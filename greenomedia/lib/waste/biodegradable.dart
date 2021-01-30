import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenomedia/Global/global.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class Biodegradable extends StatefulWidget {
  @override
  _BiodegradableState createState() => _BiodegradableState();
}

class _BiodegradableState extends State<Biodegradable> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final formkey = GlobalKey<FormState>();
  TextEditingController description = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  String email1 = "";
  bool check = true;
  final picker = ImagePicker();
  File image1;
  final databaseReference = FirebaseDatabase.instance.reference();
  var uid = Uuid();
  Future uploadToStorage() async {
    try {
      final DateTime now = DateTime.now();
      final int millSeconds = now.millisecondsSinceEpoch;
      final String month = now.month.toString();
      final String date = now.day.toString();
      final String storageId = (millSeconds.toString() + uid.toString());
      final String today = ('$month-$date');

      final file = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      image1 = File(file.path);
      uploadVideo(image1).then((value) => {
            showDialog(
                context: context,
                builder: (context) {
                  Future.delayed(Duration(seconds: 4), () {
                    Navigator.of(context).pop(true);
                  });
                  return CupertinoAlertDialog(
                    title: Text("Successfully Uploaded",
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
                            fontWeight: FontWeight.bold)),
                  );
                })
          });
    } catch (error) {
      print(error);
    }
  }

  Future<String> uploadVideo(var videofile) async {
    var uuid = new Uuid().v1();
    StorageReference ref =
        FirebaseStorage.instance.ref().child("post_$uuid.jpg");

    await ref.putFile(videofile).onComplete.then((val) {
      val.ref.getDownloadURL().then((val) {
        print(val);
        downloadurl = val;
        setState(() {
          check = !check;
        });
        add();
      });
    });
    return downloadurl;
  }

  Future<void> add() async {
    var uuid = new Uuid().v1();
    DatabaseReference _color2 =
        databaseReference.child("Waste").child(user1).child(uuid);
    final TransactionResult transactionResult =
        await _color2.runTransaction((MutableData mutableData) async {
      mutableData.value = (mutableData.value ?? 0) + 1;

      return mutableData;
    });
    if (transactionResult.committed) {
      _color2
          .push()
          .set(<String, String>{"Waste": "true", "uid": "true"}).then((_) {
        print('Transaction  committed.');
      });
    } else {
      print('Transaction not committed.');
      if (transactionResult.error != null) {
        print(transactionResult.error.message);
      }
    }
    _color2.set({"Waste": downloadurl, "uid": uuid});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Center(
              child: Text("Welcome",
                  style: GoogleFonts.kaushanScript(
                      letterSpacing: 5,
                      shadows: [
                        Shadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(2, 3))
                      ],
                      color: Colors.green[900],
                      fontSize: 80,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text("Your 1 step can save the environment",
                    style: GoogleFonts.kaushanScript(
                        letterSpacing: 5,
                        shadows: [
                          Shadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              offset: Offset(2, 3))
                        ],
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.6,
              decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(70, 300),
                    bottomLeft: Radius.elliptical(60, 300),
                  )),
              child: Column(
                children: [
                  Form(
                      key: formkey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text("Sell Your Waste Here",
                              style: GoogleFonts.kaushanScript(
                                  letterSpacing: 5,
                                  shadows: [
                                    Shadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                        offset: Offset(2, 3))
                                  ],
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 50),
                          Center(
                            child: Card(
                              elevation: 20,
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: CupertinoColors.white),
                                width: 350,
                                height: 50,
                                child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      name,
                                      style: TextStyle(fontSize: 18),
                                    )),
                              ),
                            ),
                          ),
                          Center(
                            child: Card(
                              elevation: 20,
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: CupertinoColors.white),
                                width: 350,
                                height: 59,
                                child: Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Text(
                                      address1,
                                      style: TextStyle(fontSize: 18),
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Center(
                              child: Card(
                                elevation: 20,
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: CupertinoColors.white),
                                  width: 350,
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: TextFormField(
                                      controller: description,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Please Enter the description";
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      onSaved: (value) {
                                        email1 = value;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Description *",
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Card(
                              elevation: 20,
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: CupertinoColors.white),
                                width: 350,
                                height: 50,
                                child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      email,
                                      style: TextStyle(fontSize: 18),
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Center(
                              child: Card(
                                elevation: 20,
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: CupertinoColors.white),
                                  width: 350,
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: TextFormField(
                                      controller: phone,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Please Enter your contact";
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      onSaved: (value) {
                                        email1 = value;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Your Phone *",
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text("Upload the image of the waste",
                                style: GoogleFonts.kaushanScript(
                                    letterSpacing: 5,
                                    shadows: [
                                      Shadow(
                                          color: Colors.grey,
                                          blurRadius: 5,
                                          offset: Offset(2, 3))
                                    ],
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Center(
                            child: IconButton(
                                icon: Icon(Icons.upload_file),
                                onPressed: () {
                                  uploadToStorage();
                                }),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Card(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Container(
                                  width: 110,
                                  height: 40,
                                  child: FlatButton(
                                      color: CupertinoColors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      onPressed: () async {
                                        if (formkey.currentState.validate()) {
                                          formkey.currentState.save();
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                Future.delayed(
                                                    Duration(seconds: 4), () {
                                                  Navigator.of(context)
                                                      .pop(true);
                                                });
                                                return CupertinoAlertDialog(
                                                  title: Text(
                                                      "Yours details have submitted successfully",
                                                      style: GoogleFonts
                                                          .kaushanScript(
                                                              letterSpacing: 5,
                                                              shadows: [
                                                                Shadow(
                                                                    color: Colors
                                                                        .grey,
                                                                    blurRadius:
                                                                        5,
                                                                    offset:
                                                                        Offset(
                                                                            2,
                                                                            3))
                                                              ],
                                                              color: Colors
                                                                  .green[900],
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                  content: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        "One of the sellers will contact you soon",
                                                        style: GoogleFonts
                                                            .kaushanScript(
                                                                letterSpacing:
                                                                    5,
                                                                shadows: [
                                                                  Shadow(
                                                                      color: Colors
                                                                          .grey,
                                                                      blurRadius:
                                                                          5,
                                                                      offset:
                                                                          Offset(
                                                                              2,
                                                                              3))
                                                                ],
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                  ),
                                                );
                                              });
                                          description.clear();
                                          phone.clear();
                                        }
                                      },
                                      child: Center(
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(
                                              color: CupertinoColors.black,
                                              fontSize: 20),
                                        ),
                                      )),
                                ),
                              )),
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
