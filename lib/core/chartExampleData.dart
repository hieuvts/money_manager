import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:money_manager/core/categorySpend_series.dart';

class ChartExampleData {
  static final Map<String, double> incomeData = {
    "Salaray": 10000000,
    "Gift": 500000,
    "Other": 7000000,
  };
  static final Map<String, double> expenseData = {
    "Foods": 20000,
    "Transportation": 25000,
    "Drink": 10000,
    "Bill": 40000,
    "Household": 12000,
  };
  static final List<CategorySpendSeries> categoryData = [
    CategorySpendSeries(
      categoryName: "Foods",
      spendAmount: 20000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    CategorySpendSeries(
      categoryName: "Transportation",
      spendAmount: 25000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    CategorySpendSeries(
      categoryName: "Drink",
      spendAmount: 10000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    CategorySpendSeries(
      categoryName: "Bill",
      spendAmount: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    CategorySpendSeries(
      categoryName: "Household",
      spendAmount: 12000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
  ];
}
