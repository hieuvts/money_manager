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
    // return MaterialApp(
    //   home: new PageController(title: "Money Manager"),
    // );
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
    //AddRecordPage(),
    Dashboard(),
    SettingPage()
  ];
  int _selectedPage = 0;
  final BorderRadius _borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(0),
    bottomLeft: Radius.circular(10),
  );
  ShapeBorder bottomBarShape = new Border();
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(12);
  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.rectangle;
  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;
  Color selectedColor = Colors.blueAccent[100];
  Gradient selectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.amber]);
  Color unselectedColor = Colors.blueGrey;
  Gradient unselectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.blueGrey]);
  Color containerColor;
  List<Color> containerColors = [
    const Color(0xFFFDE1D7),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
    const Color(0xFFF4E4CE),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _pages[_selectedPage],

      // bottomNavigationBar: ConvexAppBar(
      //   top: 0,
      //   initialActiveIndex: 0, //Page "Giao dịch"
      //   backgroundColor: Colors.blueAccent,
      //   style: TabStyle.textIn,
      //   items: [
      //     TabItem(
      //         icon: new Image.asset('images/transaction.png'),
      //         title: 'Giao dịch'),
      //     TabItem(icon: new Image.asset('images/graph.png'), title: 'Thống kê'),
      //     TabItem(icon: new Image.asset('images/add.png'), title: 'Tạo'),
      //     TabItem(
      //         icon: new Image.asset('images/settings.png'), title: 'Cài đặt'),
      //   ],
      //   //onTap: (int i) => print('click index=$i'),
      //   onTap: onTabTapped,
      // ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,

        ///configuration for SnakeNavigationBar.color
        snakeViewColor: selectedColor,
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: Colors.blueGrey,

        ///configuration for SnakeNavigationBar.gradient
        // snakeViewGradient: selectedGradient,
        // selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        // unselectedItemGradient: unselectedGradient,

        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: _selectedItemPosition,
        onTap: (index) {
          setState(() => _selectedItemPosition = index);
          onTabTapped(index);
          print('tapped page $index');
        },

        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        items: [
          BottomNavigationBarItem(
              icon: new Image.asset('images/transaction.png'),
              label: 'Giao dịch'),
          BottomNavigationBarItem(
              icon: new Image.asset('images/graph.png'), label: 'Thống kê'),
          BottomNavigationBarItem(
              icon: new Image.asset('images/add.png'), label: 'Thêm'),
          BottomNavigationBarItem(
              icon: new Image.asset('images/settings.png'), label: 'Cài đặt'),
        ],
      ),
    ));
  }

  void _onPageChanged(int page) {
    containerColor = containerColors[page];
    switch (page) {
      case 0:
        print('invoke page 0');
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.pinned;
          snakeShape = SnakeShape.rectangle;
          padding = EdgeInsets.zero;
        });
        break;
      case 1:
        print('invoke page 1');
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.pinned;
          snakeShape = SnakeShape.rectangle;
          padding = EdgeInsets.zero;
        });
        break;

      case 2:
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.pinned;
          snakeShape = SnakeShape.rectangle;
          padding = EdgeInsets.zero;
        });
        break;
      case 3:
        setState(() {
          snakeBarStyle = SnakeBarBehaviour.pinned;
          snakeShape = SnakeShape.rectangle;
          padding = EdgeInsets.zero;
        });
        break;
    }
  }

  void onTabTapped(int index) {
    _onPageChanged(index);
    setState(() {
      _selectedPage = index;
    });
  }
}
