import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:money_manager/core/chartExampleData.dart';
import 'package:money_manager/ui/customWidget/customBarChart.dart';
import 'package:money_manager/core/databaseModels.dart';
import 'package:money_manager/core/databaseQuery.dart';

class ExpenseChart extends StatefulWidget {
  @override
  _ExpenseChartState createState() => _ExpenseChartState();
}

final incomeData = ChartExampleData.incomeData;
final expenseData = ChartExampleData.expenseData;
final categoryData = ChartExampleData.categoryData;
QueryMMCategory _query = new QueryMMCategory();

class _ExpenseChartState extends State<ExpenseChart> {
  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context).size;
    Map<String, double> _incomeData;
    return FutureBuilder<List>(
        future: _query.getCategoryAmount(),
        initialData: List(),
        builder: (context, snapshot) {
          //log('Snapshot: ${snapshot.data[1]}');
          _incomeData = Map.from(snapshot.data[1]);
          log('$_incomeData');
          return ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.only(left: 20), child: Text("Inflow")),
              Container(
                width: deviceData.width / 1,
                height: deviceData.width / 1.5,
                child: Card(
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
              ),
              Divider(),
              Container(
                  padding: EdgeInsets.only(left: 20), child: Text("Expense")),
              Container(
                width: deviceData.width / 1,
                height: deviceData.width / 1.5,
                child: Card(
                  child: PieChart(
                    legendOptions: LegendOptions(
                        legendPosition: LegendPosition.bottom,
                        showLegendsInRow: true),
                    chartValuesOptions: ChartValuesOptions(
                        showChartValuesInPercentage: true,
                        showChartValuesOutside: true),
                    dataMap: expenseData,
                    chartType: ChartType.disc,
                    centerText: "Expense",
                    chartRadius: deviceData.width,
                  ),
                ),
              ),
              Container(child: CustomBarChart(data: categoryData)),
            ],
          );
        });
  }
}
