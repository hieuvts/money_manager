import 'package:flutter/material.dart';
import 'package:money_manager/ui/page/addRecordPage.dart';
import 'ui/page/transactionPage.dart';
import 'ui/page/graphPage.dart';
import 'ui/page/settingPage.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:money_manager/core/bottomNavBarItem.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('vi_VN', null).then((_) => runApp(MyApp()));
  //runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        fontFamily: "Helveticaneue",
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //     primary: Colors.teal,
        //     onPrimary: Colors.white,
        //     onSurface: Colors.grey,
        //   ),
        // ),
      ), //Set font chung toàn bộ app

      home: new SplashScreen(
        seconds: 0,
        navigateAfterSeconds: new PageController(),
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
          "Loading...",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic),
        ),
        loaderColor: Colors.red,
      ),
    );
  }
}

class PageController extends StatefulWidget {
  @override
  _PageControllerState createState() => _PageControllerState();
}

class _PageControllerState extends State<PageController> {
  final navigationBarItem = NavBarItem.getNavBarItems;
  //Danh sách các pages
  final List<Widget> _pages = <Widget>[
    TransactionPage(),
    GraphPage(),
    AddTransactionPage(),
    SettingPage()
  ];
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Money Manager'),
      ),
      body: _pages[_selectedPage],
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.pinned,
        //padding: EdgeInsets.all(1),
        snakeShape: SnakeShape.circle,
        snakeViewColor: Colors.blueAccent[100],
        currentIndex: _selectedPage,
        onTap: onItemTapped,
        items: navigationBarItem,
      ),
    ));
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
