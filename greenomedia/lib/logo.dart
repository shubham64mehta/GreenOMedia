import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:greenomedia/Onboarding/onboadinggreen.dart';

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 370,
              width: 370,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/Logo.jpeg"),
                      fit: BoxFit.cover)),
            ),
            FadeAnimatedTextKit(
              text: [
                "\"Creativity is just connecting things\"",
                "\"Our technology forces us to live mythically.\"",
                "\"The human spirit must prevail over technology.\""
              ],
              textStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5),
              onFinished: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => GreenApp()));
              },
              duration: Duration(seconds: 1),
              pause: Duration(milliseconds: 0),
              totalRepeatCount: 1,
            ),
          ],
        ),
      ),
    );
  }
}
