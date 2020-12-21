import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:money_manager/ui/modules/page/homeScreen.dart';
import 'package:money_manager/ui/modules/page/pageController.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      //navigateAfterSeconds: new PageController(),
      title: new Text(
        'Money Management',
        style: new TextStyle(
            fontWeight: FontWeight.bold, fontSize: 40.0, color: Colors.white),
      ),
      image: new Image.asset(
        'images/splash_logo.png',
        fit: BoxFit.contain,
      ),
      photoSize: 120.0,
      backgroundColor: Color(0xFFA8DADC),
      loadingText: new Text(
        "Loading",
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic),
      ),
      loaderColor: Colors.red,
    );
  }
}
