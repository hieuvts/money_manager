import 'package:flutter/material.dart';
import 'package:money_manager/core/moneyFormatter.dart';

class IncomeAndOutcome extends StatefulWidget {
  @override
  _IncomeAndOutcomeState createState() => _IncomeAndOutcomeState();
}

class _IncomeAndOutcomeState extends State<IncomeAndOutcome> {
  String _inflow = '2000000';
  String _outflow = '1500000';
  final _sum = '500000';
  var customTextStyle = TextStyle(fontSize: 18, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Inflow', style: customTextStyle),
                  Divider(),
                  Text('  Outflow', style: customTextStyle)
                ],
              ),
              Column(
                children: [
                  Text('+ ' + moneyFormater(_inflow),
                      style: TextStyle(fontSize: 18, color: Colors.green)),
                  Divider(),
                  Text('- ' + moneyFormater(_outflow),
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
              Text(moneyFormater(_sum),
                  style: TextStyle(fontSize: 18, color: Colors.black))
            ],
          )
        ]));
  }
}
