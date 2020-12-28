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
          Container(
              padding: EdgeInsets.all(5),
              child: Card(elevation: 5, child: IncomeAndOutcome())),

          Divider(
            thickness: 2,
          ),
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
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
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
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      ),
                      Divider(),
                      Text('  Outflow',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[600]))
                    ],
                  ),
                  Column(
                    children: [
                      Text('+ ' + _inflow.toString(),
                          style: TextStyle(
                              fontSize: 18, color: Colors.green[300])),
                      Divider(),
                      Text('- ' + _outflow.toString(),
                          style:
                              TextStyle(fontSize: 18, color: Colors.red[300]))
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
                  Text(
                    _sum.toString(),
                    style: TextStyle(color: Colors.red[300], fontSize: 18),
                  )
                ],
              )
            ])));
  }
}
