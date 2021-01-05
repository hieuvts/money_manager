import 'package:flutter/material.dart';
import 'package:money_manager/userWidget/expense_chart.dart';

class GraphPage extends StatefulWidget {
  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "Biểu đồ thống kê",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body:
          PageView(scrollDirection: Axis.vertical, children: [ExpenseChart()]),
    );
  }
}
