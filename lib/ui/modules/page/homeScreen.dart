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
        child: HomePage(),
      ),
      bottomNavigationBar: ConvexAppBar(
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
        onTap: (int i) => print('click index=$i'),
        //controller: TabController(length: null, vsync: null),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listTitle = <String>['a', 'b', 'c'];
  List<String> listSubTitle = <String>['1', '2', '3'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: listTitle.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(
            Icons.account_circle,
            size: 40,
          ),
          title: Text(
            listTitle[index],
            style: TextStyle(fontSize: 30),
          ),
          subtitle: Text(
            listSubTitle[index],
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        );
      },
    );
  }
}
