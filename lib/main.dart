import 'package:flutter/material.dart';
import 'package:money_manager/ui/page/addTransactionPage.dart';
import 'ui/page/transactionPage.dart';
import 'ui/page/graphPage.dart';
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
      ), //Set font chung toàn bộ app

      home: new SplashScreen(
        seconds: 2,
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: TransactionPage(),
      floatingActionButton: FloatingActionButton(
        elevation: 4.0,
        child: const Icon(Icons.add, color: Colors.white),
        tooltip: "Thêm giao dịch mới",
        onPressed: () async {
          final result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTransactionPage()));
          if (result) {
            setState(() {});
          }
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
              icon: Icon(
                Icons.home,
                color: Colors.blueAccent,
              ),
              onPressed: () {},
            ),
            IconButton(
                tooltip: "Biểu đồ thống kê",
                icon: Icon(
                  Icons.show_chart,
                  color: Colors.blueAccent,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GraphPage()));
                }),
          ],
        ),
      ),
    ));
  }
}
