import 'package:flutter/material.dart';
import 'package:money_manager/ui/customWidget/expense_chart.dart';

class GraphPage extends StatefulWidget {
  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  @override
  Widget build(BuildContext context) {
    return PageView(scrollDirection: Axis.vertical, children: [ExpenseChart()]);
  }
}
