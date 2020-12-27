import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:money_manager/core/chartExampleData.dart';
import 'package:money_manager/ui/modules/customWidget/customBarChart.dart';

class ExpenseChart extends StatefulWidget {
  @override
  _ExpenseChartState createState() => _ExpenseChartState();
}

final incomeData = ChartExampleData.incomeData;
final expenseData = ChartExampleData.expenseData;
final categoryData = ChartExampleData.categoryData;

class _ExpenseChartState extends State<ExpenseChart> {
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
        Container(child: CustomBarChart(data: categoryData)),
      ],
    );
  }
}
