import 'package:flutter/material.dart';
import 'package:money_manager/ui/modules/page/addRecordPage.dart';
import 'ui/modules/page/transactionPage.dart';
import 'ui/modules/page/graphPage.dart';
import 'ui/modules/page/settingPage.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:splashscreen/splashscreen.dart';
//import 'ui/modules/page/pageController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: new PageController(title: "Money Manager"),
    // );
    return new MaterialApp(
      theme: ThemeData(fontFamily: "Helveticaneue"),
      home: new SplashScreen(
        seconds: 0,
        navigateAfterSeconds: new PageController(title: "Money Manager"),
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
      ),
    );
  }
}

class PageController extends StatefulWidget {
  final String title;
  PageController({Key key, this.title}) : super(key: key);

  @override
  _PageControllerState createState() => _PageControllerState();
}

class _PageControllerState extends State<PageController> {
  final List<Widget> _pages = <Widget>[
    TransactionPage(),
    GraphPage(),
    AddRecordPage(),
    SettingPage()
  ];
  int selectedPage = 0;

  final Map<int, dynamic> _badges = {0: '19+', 1: null, 2: null, 3: null};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red[350],
      ),
      body: _pages[selectedPage],
      bottomNavigationBar: ConvexAppBar.badge(
        _badges,
        backgroundColor: Colors.blue[310],
        style: TabStyle.react,
        items: [
          TabItem(
              icon: new Image.asset('images/transaction.png'),
              title: 'Giao dịch'),
          TabItem(icon: new Image.asset('images/graph.png'), title: 'Thống kê'),
          TabItem(icon: new Image.asset('images/add.png'), title: 'Tạo'),
          TabItem(
              icon: new Image.asset('images/settings.png'), title: 'Cài đặt'),
        ],
        initialActiveIndex: 0, //Page "Giao dịch"
        //onTap: (int i) => print('click index=$i'),
        onTap: onTabTapped,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      selectedPage = index;
    });
  }
}
