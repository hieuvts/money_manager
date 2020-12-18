import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ExpenseChart extends StatefulWidget {
  @override
  _ExpenseChartState createState() => _ExpenseChartState();
}

class _ExpenseChartState extends State<ExpenseChart> {
  Map<String, double> dataMap = {
    "Foods": 25,
    "Transportation": 25,
    "Drink": 10,
    "Bill": 40,
    "Household": 12,
  };
  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      chartType: ChartType.disc,
      centerText: "Expense",
      chartRadius: MediaQuery.of(context).size.width,
    );
  }
}
