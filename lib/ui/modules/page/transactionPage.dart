import 'package:flutter/material.dart';
import 'package:money_manager/ui/modules/customWidget/customCardView.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.clip,
      alignment: AlignmentDirectional.center,
      fit: StackFit.expand,
      children: <Widget>[
        Column(children: [
          Divider(),
          Container(child: IncomeAndOutcome()),
          //Padding(padding: EdgeInsets.only(bottom: 10)),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white12,
                    offset: Offset(0, 2),
                  )
                ]),
            alignment: Alignment.topLeft,
            child: Text(
              "Recent transactions",
              style: TextStyle(fontFamily: "RobotoLight", fontSize: 18),
            ),
          ),
          Divider(),
          Expanded(child: RecentTransaction()), //CustomCardView
        ]),
      ],
    );
  }
}

class IncomeAndOutcome extends StatefulWidget {
  @override
  _IncomeAndOutcomeState createState() => _IncomeAndOutcomeState();
}

class _IncomeAndOutcomeState extends State<IncomeAndOutcome> {
  var _inflow = 2000000;
  var _outflow = 1500000;
  final _sum = 500000;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
            alignment: Alignment.center,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Inflow',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      Text('  Outflow',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600]))
                    ],
                  ),
                  Column(
                    children: [
                      Text(_inflow.toString(),
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600])),
                      Text(_outflow.toString(),
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600]))
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "______________",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  new Padding(padding: EdgeInsets.all(15)),
                  Text(
                    _sum.toString(),
                    style: TextStyle(color: Colors.red),
                  )
                ],
              )
            ])));
  }
}
