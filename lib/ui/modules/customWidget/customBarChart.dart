import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:money_manager/core/categorySpend_series.dart';

class CustomBarChart extends StatelessWidget {
  final List<CategorySpendSeries> data;

  CustomBarChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<CategorySpendSeries, String>> series = [
      charts.Series(
          id: "Expense amount",
          data: data,
          domainFn: (CategorySpendSeries series, _) =>
              series.categoryName, //Trục x
          measureFn: (CategorySpendSeries series, _) =>
              series.spendAmount, //Trục y
          colorFn: (CategorySpendSeries series, _) => series.barColor)
    ];
    return Container(
      height: 200,
      padding: EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Expense by category",
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
