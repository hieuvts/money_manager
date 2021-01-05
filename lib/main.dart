import 'package:flutter/material.dart';
import 'package:money_manager/ui/page/addTransactionPage.dart';
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
        accentColor: Colors.blueAccent,
        primaryColor: Colors.lightBlue,
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
          textAlign: TextAlign.center,
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
  var appBarTitle = 'Money Manager';
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
        title: Text(appBarTitle),
      ),
      body: _pages[_selectedPage],
      // bottomNavigationBar: SnakeNavigationBar.color(
      //   behaviour: SnakeBarBehaviour.pinned,
      //   //padding: EdgeInsets.all(1),
      //   snakeShape: SnakeShape.circle,
      //   snakeViewColor: Colors.blueAccent[100],
      //   currentIndex: _selectedPage,
      //   onTap: onItemTapped,
      //   items: navigationBarItem,
      // ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.add),
        label: const Text('Giao dịch'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTransactionPage()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: AutomaticNotchedShape(
            RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
                icon: Icon(Icons.bar_chart),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GraphPage()));
                }),
          ],
        ),
      ),
    ));
  }

  void onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          appBarTitle = 'Money Manager';
          break;
        case 1:
          appBarTitle = 'Thống kê lịch sử giao dịch';
          break;
        case 2:
          appBarTitle = 'Thêm giao dịch mới';
          break;
        case 3:
          appBarTitle = 'Cài đặt';
          break;
        default:
      }
      _selectedPage = index;
    });
  }
}
