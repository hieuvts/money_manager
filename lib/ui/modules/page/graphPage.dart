import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:money_manager/ui/modules/custom_widgets/expense_chart.dart';

class GraphPage extends StatefulWidget {
  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  @override
  Widget build(BuildContext context) {
    return ExpenseChart();
    // return Column(
    //   children: [
    //     Text(
    //       "Helvet normal font",
    //       style: TextStyle(fontSize: 30),
    //     ),
    //     Text(
    //       "Helvet normal font",
    //       style: TextStyle(fontFamily: "Helveticaneue", fontSize: 30),
    //     ),
    //     Text(
    //       "Helvet BOLD font",
    //       style: TextStyle(fontFamily: "Raleway", fontSize: 30),
    //     ),
    //     Text(
    //       "1.2.3.4.55.999.000",
    //       style: TextStyle(fontFamily: "RobotoLight", fontSize: 30),
    //     )
    //   ],
    // );
  }
}
