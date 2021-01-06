import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:money_manager/core/databaseModels.dart';
import 'package:money_manager/core/databaseQuery.dart';

class ExpenseChart extends StatefulWidget {
  @override
  _ExpenseChartState createState() => _ExpenseChartState();
}

QueryMMCategory _query = new QueryMMCategory();

class _ExpenseChartState extends State<ExpenseChart> {
  bool _togglePercent1 = true;
  bool _togglePercent2 = true;
  @override
  Widget build(BuildContext context) {
    MMCategory _data;
    var deviceData = MediaQuery.of(context).size;

    return FutureBuilder<List>(
        future: _query.getCategorySpendAmount(),
        initialData: List(),
        builder: (context, snapshot) {
          final snapshotLength = snapshot.data.length;
          Map<String, double> incomeData = {};
          Map<String, double> expenseData = {};
          for (int i = 0; i < snapshotLength; i++) {
            _data = snapshot.data[i];
            var _categoryName = _data.categoryName;
            var _categoryAmount = _data.transactionAmount.toDouble();
            expenseData["$_categoryName"] = _categoryAmount;
          }
          for (int i = 5; i < snapshotLength; i++) {
            _data = snapshot.data[i];
            var _categoryName = _data.categoryName;
            var _categoryAmount = _data.transactionAmount.toDouble();
            incomeData["$_categoryName"] = _categoryAmount;
          }
          return ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text("Biểu đồ thu nhập"),
                      Spacer(),
                      Switch(
                        value: _togglePercent1,
                        onChanged: (value) {
                          setState(() {
                            _togglePercent1 = value;
                            print(_togglePercent1);
                          });
                        },
                        activeTrackColor: Colors.lightBlue,
                        activeColor: Colors.lightBlue,
                      ),
                    ],
                  )),
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
                        showChartValuesInPercentage: _togglePercent1,
                        showChartValuesOutside: true),
                    dataMap: incomeData,
                    chartType: ChartType.disc,
                  ),
                ),
              ),
              Divider(),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        "Biểu đồ chi tiêu",
                      ),
                      Spacer(),
                      Switch(
                        value: _togglePercent2,
                        onChanged: (value) {
                          setState(() {
                            _togglePercent2 = value;
                            print(_togglePercent2);
                          });
                        },
                        activeTrackColor: Colors.lightBlue,
                        activeColor: Colors.lightBlue,
                      ),
                    ],
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
                        showChartValuesInPercentage: _togglePercent2,
                        showChartValuesOutside: true),
                    dataMap: expenseData,
                    chartType: ChartType.disc,
                    chartRadius: deviceData.width,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
