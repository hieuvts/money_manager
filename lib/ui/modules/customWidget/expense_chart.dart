import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:money_manager/core/categorySpend_series.dart';

class ExpenseChart extends StatefulWidget {
  @override
  _ExpenseChartState createState() => _ExpenseChartState();
}

class _ExpenseChartState extends State<ExpenseChart> {
  final Map<String, double> incomeData = {
    "Salaray": 10000000,
    "Gift": 500000,
    "Other": 7000000,
  };
  final Map<String, double> expenseData = {
    "Foods": 20000,
    "Transportation": 25000,
    "Drink": 10000,
    "Bill": 40000,
    "Household": 12000,
  };
  final List<SubscriberSeries> data = [
    SubscriberSeries(
      categoryName: "Foods",
      spendAmount: 20000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      categoryName: "Transportation",
      spendAmount: 25000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      categoryName: "Drink",
      spendAmount: 10000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    SubscriberSeries(
      categoryName: "Bill",
      spendAmount: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    SubscriberSeries(
      categoryName: "Household",
      spendAmount: 12000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context).size;
    return ListView(
      children: [
        Text("Income"),
        Container(
          width: deviceData.width / 1,
          height: deviceData.width / 1.5,
          child: PieChart(
            legendOptions: LegendOptions(
              legendPosition: LegendPosition.bottom,
              showLegendsInRow: true,
            ),
            chartValuesOptions: ChartValuesOptions(
                showChartValuesInPercentage: true,
                showChartValuesOutside: true),
            dataMap: incomeData,
            chartType: ChartType.disc,
            centerText: "Income",
          ),
        ),
        Text("Expense"),
        Container(
          width: deviceData.width / 1,
          height: deviceData.width / 1.5,
          child: PieChart(
            legendOptions: LegendOptions(
                legendPosition: LegendPosition.bottom, showLegendsInRow: true),
            chartValuesOptions: ChartValuesOptions(
                showChartValuesInPercentage: true,
                showChartValuesOutside: true),
            dataMap: expenseData,
            chartType: ChartType.disc,
            centerText: "Expense",
            //chartRadius: deviceData.width,
          ),
        ),
        Container(child: SubscriberChart(data: data)),
      ],
    );
  }
}

class SubscriberChart extends StatelessWidget {
  final List<SubscriberSeries> data;

  SubscriberChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
          id: "Expense amount",
          data: data,
          domainFn: (SubscriberSeries series, _) => series.categoryName,
          measureFn: (SubscriberSeries series, _) => series.spendAmount,
          colorFn: (SubscriberSeries series, _) => series.barColor)
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
