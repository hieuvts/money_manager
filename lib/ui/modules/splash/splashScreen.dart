// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:money_manager/ui/home/homeScreen.dart';
// import 'package:splashscreen/splashscreen.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xFFA8DADC),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             children: [SizedBox(height: 150)],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 child: new Image.asset(
//                   "images/splash_logo.png",
//                   fit: BoxFit.fill,
//                 ),
//               )
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 200),
//               Text(
//                 "Money\nManagement",
//                 style: TextStyle(
//                     decoration: TextDecoration.none,
//                     fontSize: 40,
//                     color: Colors.white),
//                 textAlign: TextAlign.center,
//               )
//             ],
//           ),
//           Row(
//             children: [SizedBox(height: 90)],
//           ),
//           Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//             FloatingActionButton(
//                 child: Icon(Icons.navigate_next),
//                 backgroundColor: Colors.red,
//                 onPressed: () {
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (context) => HomeScreen()));
//                 })
//           ]),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               SizedBox(
//                 height: 60,
//               ),
//               Text(
//                 "Developing...",
//                 style: TextStyle(
//                     fontStyle: FontStyle.italic,
//                     color: Colors.white,
//                     decoration: TextDecoration.none,
//                     fontSize: 15),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:money_manager/ui/home/homeScreen.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new HomeScreen(),
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
