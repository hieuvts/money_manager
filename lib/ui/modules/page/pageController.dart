import 'package:flutter/material.dart';
import 'transactionPage.dart';
import 'graphPage.dart';
import 'addRecordPage.dart';
import 'settingPage.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red[350],
      ),
      body: _pages[selectedPage],
      bottomNavigationBar: ConvexAppBar.badge(
        {0: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
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
