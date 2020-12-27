import 'package:flutter/material.dart';
import 'package:money_manager/ui/modules/page/addRecordPage.dart';
import 'ui/modules/page/transactionPage.dart';
import 'ui/modules/page/graphPage.dart';
import 'ui/modules/page/settingPage.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:splashscreen/splashscreen.dart';
//import 'ui/modules/page/pageController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme:
          ThemeData(fontFamily: "Helveticaneue"), //Set font chung toàn bộ app
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
  final String title;
  PageController({Key key, this.title}) : super(key: key);

  @override
  _PageControllerState createState() => _PageControllerState();
}

class _PageControllerState extends State<PageController> {
  //Danh sách các pages
  final List<Widget> _pages = <Widget>[
    TransactionPage(),
    GraphPage(),
    AddTransactionPage(),
    AddTransactionPage(),
    SettingPage()
  ];
  int _selectedPage = 0;
  //Danh sách các items trong SnakeNavBar
  List<BottomNavigationBarItem> navBarItems = [
    BottomNavigationBarItem(
      icon: new Image.asset(
        'images/transaction.png',
      ),
      label: 'Giao dịch',
    ),
    BottomNavigationBarItem(
        icon: new Image.asset(
          'images/graph.png',
        ),
        label: 'Thống kê'),
    BottomNavigationBarItem(
        icon: new Image.asset(
          'images/add.png',
        ),
        label: 'Thêm'),
    BottomNavigationBarItem(
        icon: new Image.asset(
          'images/settings.png',
        ),
        label: 'Cài đặt'),
  ];

  //Beginof Config SnakeNavBar
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(5);
  SnakeShape snakeShape = SnakeShape.rectangle;
  Color selectedColor = Colors.blueAccent[100];
  Gradient selectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.amber]);
  Color unselectedColor = Colors.blueGrey;
  Gradient unselectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.blueGrey]);
  //Endof Config SnakeNavBar

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _pages[_selectedPage],
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        snakeViewColor: selectedColor,
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _selectedPage,
        onTap: onTabTapped,
        selectedLabelStyle: const TextStyle(fontSize: 10),
        items: navBarItems,
      ),
    ));
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
