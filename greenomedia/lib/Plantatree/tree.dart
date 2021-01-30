import 'dart:io';
import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:greenomedia/Global/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenomedia/Plantatree/sapling.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class Tree1 extends StatefulWidget {
  @override
  _Tree1State createState() => _Tree1State();
}

class _Tree1State extends State<Tree1> {
  String text = "Pending";
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
                    title: Text(
                        "Congrats you have contributed in saving Mother Earth",
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
                    content: Text(
                        "You get 5 green creits for your contribution",
                        style: GoogleFonts.kaushanScript(
                            letterSpacing: 5,
                            shadows: [
                              Shadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(2, 3))
                            ],
                            color: Colors.black,
                            fontSize: 18,
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
          text = "Done";
          check = !check;
          a = a + 5;
        });
        add();
        add1();
      });
    });
    return downloadurl;
  }

  Future<void> add1() async {
    var uuid = new Uuid().v1();
    DatabaseReference _color2 = databaseReference.child("Credit").child(user1);
    final TransactionResult transactionResult =
        await _color2.runTransaction((MutableData mutableData) async {
      mutableData.value = (mutableData.value ?? 0) + 1;

      return mutableData;
    });
    if (transactionResult.committed) {
      _color2
          .push()
          .set(<String, String>{"credit": "true", "uid": "true"}).then((_) {
        print('Transaction  committed.');
      });
    } else {
      print('Transaction not committed.');
      if (transactionResult.error != null) {
        print(transactionResult.error.message);
      }
    }
    _color2.set({"credit": a.toString(), "uid": user1});
  }

  Future<void> add() async {
    var uuid = new Uuid().v1();
    DatabaseReference _color2 =
        databaseReference.child("Video").child(user1).child(uuid);
    final TransactionResult transactionResult =
        await _color2.runTransaction((MutableData mutableData) async {
      mutableData.value = (mutableData.value ?? 0) + 1;

      return mutableData;
    });
    if (transactionResult.committed) {
      _color2
          .push()
          .set(<String, String>{"image": "true", "uid": "true"}).then((_) {
        print('Transaction  committed.');
      });
    } else {
      print('Transaction not committed.');
      if (transactionResult.error != null) {
        print(transactionResult.error.message);
      }
    }
    _color2.set({"video": downloadurl, "uid": uuid});
  }

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
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("No Sapling Available?",
                    style: GoogleFonts.kaushanScript(
                        shadows: [
                          Shadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              offset: Offset(2, 3))
                        ],
                        color: Colors.green[900],
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sapling()));
                  },
                  child: Text(" Click here ",
                      style: GoogleFonts.kaushanScript(
                          shadows: [
                            Shadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(2, 3))
                          ],
                          color: Colors.blue,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ),
                Text("to buy one",
                    style: GoogleFonts.kaushanScript(
                        shadows: [
                          Shadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              offset: Offset(2, 3))
                        ],
                        color: Colors.green[900],
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 7),
          Text("Upload your one video\n     of planting a tree",
              style: GoogleFonts.kaushanScript(
                  shadows: [
                    Shadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(2, 3))
                  ],
                  color: Colors.green[900],
                  fontSize: 43,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: MediaQuery.of(context).size.height / 12,
          ),
          Center(
            child: check == true
                ? GestureDetector(
                    onTap: () {
                      uploadToStorage();
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        CupertinoIcons.video_camera,
                        color: CupertinoColors.black,
                      ),
                    ),
                  )
                : Icon(
                    CupertinoIcons.checkmark,
                    color: CupertinoColors.black,
                    size: 30,
                  ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 12,
          ),
          Center(
            child: Text(text,
                style: GoogleFonts.kaushanScript(
                    shadows: [
                      Shadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(2, 3))
                    ],
                    color: Colors.green[900],
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
