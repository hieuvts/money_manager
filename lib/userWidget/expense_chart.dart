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

// final incomeData = ChartExampleData.incomeData;
// final expenseData = ChartExampleData.expenseData;
final categoryData = ChartExampleData.categoryData;
QueryMMCategory _query = new QueryMMCategory();

class _ExpenseChartState extends State<ExpenseChart> {
  @override
  Widget build(BuildContext context) {
    MMCategory _data;
    var deviceData = MediaQuery.of(context).size;

    return FutureBuilder<List>(
        future: _query.getCategoryAmount(),
        initialData: List(),
        builder: (context, snapshot) {
          final snapshotLength = snapshot.data.length;
          Map<String, double> expenseData = {};
          for (int i = 0; i < snapshotLength; i++) {
            _data = snapshot.data[i];
            var _categoryName = _data.categoryName;
            var _categoryAmount = _data.transactionAmount.toDouble();
            expenseData["$_categoryName"] = _categoryAmount;
          }
          return ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Biểu đồ thu nhập")),
              Container(
                width: deviceData.width / 1,
                height: deviceData.width / 1.2,
                child: Card(
                  child: PieChart(
                    legendOptions: LegendOptions(
                      legendPosition: LegendPosition.bottom,
                      showLegendsInRow: true,
                    ),
                    chartValuesOptions: ChartValuesOptions(
                        showChartValuesInPercentage: true,
                        showChartValuesOutside: true),
                    dataMap: expenseData,
                    chartType: ChartType.disc,
                  ),
                ),
              ),
              Divider(),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Biểu đồ chi tiêu",
                  )),
              Container(
                width: deviceData.width / 1,
                height: deviceData.width / 1.2,
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
                    chartRadius: deviceData.width,
                  ),
                ),
              ),
              //Container(child: CustomBarChart(data: categoryData)),
            ],
          );
        });
  }
}
