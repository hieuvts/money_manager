import 'package:flutter/material.dart';
import 'addRecordPage.dart';
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
      //fit: StackFit.expand,
      children: <Widget>[
        Column(children: [
          Divider(),
          Container(child: IncomeAndOutcome()),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Recent transactions",
              style: TextStyle(fontFamily: "RobotoLight", fontSize: 18),
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 10,
              )
            ],
          ),
          Container(height: 500, child: RecentTransaction()),
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
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      Text('  Outflow',
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]))
                    ],
                  ),
                  Column(
                    children: [
                      Text(_inflow.toString(),
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600])),
                      Text(_outflow.toString(),
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]))
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

class RecentTransaction extends StatefulWidget {
  @override
  _RecentTransactionState createState() => _RecentTransactionState();
}

class _RecentTransactionState extends State<RecentTransaction> {
  final List<String> _category = [
    'First',
    'Drink',
  ];
  final List<String> _totalCost = [
    '100000',
    '200.000',
  ];

  final List<String> _cost = [
    'First numb',
    '200.000',
  ];

  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.separated(
          itemCount: _category.length,
          separatorBuilder: (context, index) => Container(
                height: 8,
                decoration: BoxDecoration(color: Colors.grey[300]),
              ),
          itemBuilder: (context, index) {
            return ListTile(
              isThreeLine: true,
              leading: Text((now.day - 1).toString()),
              title: Text(
                _category[index],
                style: TextStyle(letterSpacing: 1.0),
              ),
              subtitle: Text(_cost[index]),
              trailing: Text(_totalCost[index]),
              onTap: () {
                print('Tap on $index');
              },
              onLongPress: () {
                print('Long press on $index');
              },
            );
          }),
    );
  }
}
