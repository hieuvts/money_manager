import 'package:flutter/material.dart';
import 'package:money_manager/userWidget/incomeAndOutcome.dart';
import 'package:money_manager/userWidget/recentTransaction.dart';

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
