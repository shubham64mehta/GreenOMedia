import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greenomedia/main.dart';

import 'package:introduction_screen/introduction_screen.dart';

class GreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Login()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('images/$assetName.png', width: 400.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white70,
      //pageColor: Color.fromRGBO(255, 192, 203, 50),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Gamified Eco friendly app",
          body:
              "GreenOMedia: an app which motivates you to do your part for saving Mother Earth ",
          image: _buildImage('eco'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Green Credits and leaderboard",
          body:
              "Earn green credits for taking part in environmental activities and redeem them with our partnered stores.\nAlso increase your contributions to climb up the leaderboard",
          image: _buildImage('credits'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Be Aware about the Environment",
          body:
              "Stay updated about the latest happenings,environmental events,air quality and much more",
          image: _buildImage('awareness'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Community Forum ",
          body: "Join various discussions forums and meet like-minded people.",
          image: _buildImage('communitynew'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Small actions x Pool of helpful people = big change ",
          body:
              "Happiness doesn't result from what we get, but from what we give.\nSo lets GO GREEN.",
          image: _buildImage('many'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Get started',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.green,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
