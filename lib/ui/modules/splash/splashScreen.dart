import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.9],
          colors: [Color(0xFFFC5C7D), Color(0xFF6A82FB)],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 90.0),
      child: Text(
        "Gradient Splash Screen",
        style: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
      ),
    );
  }
}
