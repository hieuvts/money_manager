import 'package:flutter/material.dart';
import 'package:money_manager/core/databaseModels.dart';
import 'package:money_manager/core/databaseQuery.dart';
import 'package:money_manager/core/moneyFormatter.dart';

class IncomeAndOutcome extends StatefulWidget {
  @override
  _IncomeAndOutcomeState createState() => _IncomeAndOutcomeState();
}

QueryMMCategory _query = new QueryMMCategory();

class _IncomeAndOutcomeState extends State<IncomeAndOutcome> {
  MMCategory _data;
  int _inflow = 0;
  int _outflow = 0;
  var _sum = 0;
  var customTextStyle = TextStyle(fontSize: 18, color: Colors.grey);
  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: _query.getSpendAmount(),
        initialData: List(),
        builder: (context, snapshot) {
          _inflow = 0;
          _outflow = 0;
          for (int i = 0; i < snapshot.data.length; i++) {
            _data = snapshot.data[i];

            if (_data.categoryId <= 8) {
              MMCategory _temp2 = snapshot.data[i];
              _outflow += _temp2.transactionAmount;
            } else {
              MMCategory _temp1 = snapshot.data[i];
              _inflow += _temp1.transactionAmount;
            }
          }

          _sum = _inflow - _outflow;
          return Container(
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('Tổng thu', style: customTextStyle),
                        Divider(),
                        Text('  Tổng chi', style: customTextStyle)
                      ],
                    ),
                    Column(
                      children: [
                        Text('+ ' + moneyFormater(_inflow.toString()),
                            style:
                                TextStyle(fontSize: 18, color: Colors.green)),
                        Divider(),
                        Text('- ' + moneyFormater(_outflow.toString()),
                            style: TextStyle(fontSize: 18, color: Colors.red))
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "______________________",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    new Padding(padding: EdgeInsets.all(15)),
                    Text(moneyFormater(_sum.toString()),
                        style: TextStyle(fontSize: 18, color: Colors.black))
                  ],
                )
              ]));
        });
  }
}
