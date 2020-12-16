import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[350],
      appBar: AppBar(
        title: Text("Money Management"),
      ),
      body: Center(
        child: Stack(children: <Widget>[
          Text("Home page"),
        ]),
      ),
      // floatingActionButton: new FloatingActionButton(
      //   backgroundColor: Colors.lightBlueAccent,
      //   onPressed: () {},
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //     size: 40,
      //   ),
      //   tooltip: "Thêm giao dịch mới",
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // bottomNavigationBar: BottomAppBar(
      //     color: Colors.lightBlueAccent,
      //     shape: CircularNotchedRectangle(),
      //     child: new Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: <Widget>[
      //           IconButton(
      //             icon: new Image.asset(
      //               'images/transaction.png',
      //               fit: BoxFit.fitHeight,
      //             ),
      //             onPressed: () {},
      //             tooltip: "Giao dịch",
      //           ),
      //           IconButton(
      //             icon: new Image.asset('images/graph.png'),
      //             onPressed: () {},
      //             tooltip: "Thống kê",
      //           ),
      //           IconButton(
      //             icon: Icon(Icons.no_cell),
      //             onPressed: () {},
      //             tooltip: "ABC",
      //           ),
      //           IconButton(
      //             icon: new Image.asset('images/settings.png'),
      //             onPressed: () {},
      //             tooltip: "Cài đặt",
      //           ),
      //         ])),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.blue[310],
        style: TabStyle.react,
        items: [
          TabItem(
              icon: new Image.asset('images/transaction.png'),
              title: 'Giao dịch'),
          TabItem(icon: new Image.asset('images/graph.png'), title: 'Thống kê'),
          TabItem(icon: new Image.asset('images/add.png'), title: 'Tạo'),
          //TabItem(icon: Icons.message, title: 'ABC'),
          TabItem(
              icon: new Image.asset('images/settings.png'), title: 'Cài đặt'),
        ],
        initialActiveIndex: 2, //optional, default as 0
        //onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}
