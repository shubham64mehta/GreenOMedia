import 'package:delayed_display/delayed_display.dart';
//import 'package:env/plantatree/tree.dart';
//import 'package:env/userLocation/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenomedia/Language/language1.dart';
import 'package:greenomedia/Onboarding/onboadinggreen.dart';
import 'package:greenomedia/logo.dart';
import 'package:greenomedia/news.dart';
import 'package:greenomedia/userLocation/location.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'leader.dart';
import 'GoogleAuth/google.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Logo()));
}

String c;

class One1 extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _One1State state = context.findAncestorStateOfType<_One1State>();
    state.setLocale(locale);
  }

  @override
  _One1State createState() => _One1State();
}

class _One1State extends State<One1> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', 'ES'), // Hebrew, no country code
        // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
      locale: _locale,
      localizationsDelegates: [
        DemoLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (devicelocale, supportedlocale) {
        for (var locale in supportedlocale) {
          if (locale.languageCode == devicelocale.languageCode &&
              locale.countryCode == devicelocale.countryCode) {
            return devicelocale;
          }
        }
        return supportedlocale.first;
      },
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void _changelanguage(String change1) {
    Locale _temp;
    switch (change1) {
      case 'en':
        _temp = Locale(change1, 'US');
        break;
      case 'es':
        _temp = Locale(change1, 'ES');
        break;
    }

    One1.setLocale(context, _temp);
  }

  List<String> a = ["English", "español", "français", "বাংলা", "ਪੰਜਾਬੀ"];
  List<String> b = ["en", "es"];
  bool f = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final formkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  var email = "";
  var passwd = "";

  Future<AuthResult> signIn(String email, String password) async {
    try {
      AuthResult user = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      assert(user != null);
      assert(await user.user.getIdToken() != null);

      final FirebaseUser currentUser = await auth.currentUser();
      assert(user.user.uid == currentUser.uid);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(23.0),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    icon: Icon(
                      Icons.language_outlined,
                      size: 29,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height / 1.5,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            "Please Select Your Language",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                      ),
                                      Text("Por favor seleccione su idioma",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2.5,
                                        child: ListView.builder(
                                            itemCount: a.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  ListTile(
                                                    focusColor: Colors.blue,
                                                    hoverColor: Colors.blue,
                                                    onTap: () {
                                                      c = b[index];
                                                    },
                                                    title: Center(
                                                        child: Text(a[index])),
                                                  ),
                                                  Divider()
                                                ],
                                              );
                                            }),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                40,
                                      ),
                                      SizedBox(
                                        width: 100,
                                        height: 50,
                                        child: RaisedButton(
                                            color: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Center(
                                              child: Text(
                                                "Next",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            onPressed: () {
                                              _changelanguage(c);
                                              Navigator.pop(context);
                                            }),
                                      )
                                    ]));
                          });
                    }),
              ),
            ),
            Container(
              width: 500,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/tree.png'),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DelayedDisplay(
                    fadeIn: true,
                    delay: Duration(seconds: 1),
                    child: Text("Green O Media",
                        style: GoogleFonts.kaushanScript(
                            shadows: [
                              Shadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(2, 3))
                            ],
                            color: Colors.green[900],
                            fontSize: 55,
                            fontWeight: FontWeight.bold)),
                  ),
                  DelayedDisplay(
                    fadeIn: true,
                    delay: Duration(seconds: 2),
                    child: Text(
                        DemoLocalization.of(context)
                            .gettranslatedvalue('welcome to'),
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
                  )
                ],
              ),
            ),
            DelayedDisplay(
              fadingDuration: Duration(seconds: 1),
              fadeIn: true,
              delay: Duration(
                seconds: 1,
              ),
              child: SlidingUpPanel(
                borderRadius: BorderRadius.only(topRight: Radius.circular(140)),
                color: Colors.green[900],
                maxHeight: MediaQuery.of(context).size.height / 1.9,
                minHeight: MediaQuery.of(context).size.height / 3.5,
                collapsed: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Text(
                      DemoLocalization.of(context)
                          .gettranslatedvalue('Patient'),
                      style: TextStyle(
                          shadows: [
                            Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 5,
                                color: CupertinoColors.systemGrey)
                          ],
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
                panel: Center(
                  child: RaisedButton(
                    color: CupertinoColors.systemGrey,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: CupertinoColors.systemGrey),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage("images/google.jpg"),
                          ),
                          SizedBox(
                            width: 55.0,
                          ),
                          FittedBox(
                            child: Text(
                              "Continue With Google ",
                              style: TextStyle(
                                  color: CupertinoColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    onPressed: () {
                      // Navigator.push(context,
                      //   MaterialPageRoute(builder: (context) => Location()));
                      signInWithGoogle().whenComplete(() async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Location();
                            },
                          ),
                        );
                      });
                    },
                  ),
                ),
                defaultPanelState: PanelState.CLOSED,
                onPanelOpened: () {
                  setState(() {
                    f = true;
                  });
                },
                onPanelClosed: () {
                  setState(() {
                    f = false;
                  });
                },
              ),
            ),
            DelayedDisplay(
              fadingDuration: Duration(seconds: 1),
              fadeIn: true,
              delay: Duration(
                seconds: 1,
              ),
              child: SlidingUpPanel(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(140)),
                color: Colors.green[100],
                maxHeight: MediaQuery.of(context).size.height / 2,
                minHeight: f == false
                    ? MediaQuery.of(context).size.height / 7
                    : MediaQuery.of(context).size.height / 8,
                collapsed: Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                        DemoLocalization.of(context)
                            .gettranslatedvalue('Doctor'),
                        style: TextStyle(
                            shadows: [
                              Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 5,
                                  color: CupertinoColors.systemGrey)
                            ],
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                ),
                panel: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 7.5),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Center(
                            child: Card(
                              elevation: 20,
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: CupertinoColors.white),
                                width: 350,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty ||
                                          !value.contains("@")) {
                                        return "Please Enter the correct emailid";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (value) {
                                      email = value;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Input Email",
                                        prefixIcon: Icon(
                                          CupertinoIcons.person,
                                          color: CupertinoColors.systemGrey,
                                        ),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Center(
                          child: Card(
                            elevation: 20,
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: CupertinoColors.white),
                              width: 350,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty || value.length < 7) {
                                      return "Password must be 7 characters long";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  obscureText: true,
                                  onSaved: (value) {
                                    passwd = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    prefixIcon: Icon(CupertinoIcons.lock,
                                        color: CupertinoColors.systemGrey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                            child: Card(
                          elevation: 20,
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Container(
                            width: 200,
                            height: 60,
                            child: FlatButton(
                                color: CupertinoColors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                onPressed: () async {
                                  if (formkey.currentState.validate()) {
                                    formkey.currentState.save();
                                    signIn(email, passwd).then((user) {
                                      if (user != null) {
                                        // Navigator.push(context,
                                        //   MaterialPageRoute(builder: (context) => Test()));
                                      } else {
                                        print("not");
                                      }
                                    });
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: CupertinoColors.black,
                                        fontSize: 20),
                                  ),
                                )),
                          ),
                        )),
                      ],
                    )),
                defaultPanelState: PanelState.CLOSED,
              ),
            )
          ],
        ),
      ),
    );
  }
}
