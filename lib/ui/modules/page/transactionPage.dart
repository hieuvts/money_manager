import 'package:flutter/material.dart';

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
          Container(child: IncomeAndOutcome()),
          Row(
            children: [
              SizedBox(
                height: 30,
              )
            ],
          ),
          Container(height: 520, child: RecentTransaction()),
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
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
            alignment: Alignment.center,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [Text('Income'), Text('  Outcome')],
                  ),
                  Column(
                    children: [Text('2.000.000 VND'), Text('1.500.000 VND')],
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Container(
              //       height: 20,
              //       decoration: BoxDecoration(color: Colors.deepOrangeAccent),
              //       child: Container(
              //         color: Colors.red,
              //       ),
              //     )
              //   ],
              // ),
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
                    "500.000 VND",
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
    'Transportation',
    'Gas',
    'Electric 11Bill',
    'Drink',
    'Transportation',
    'Gas',
    'Last'
  ];
  final List<String> _cost = [
    'First numb',
    '200.000',
    '100.000',
    '200.000',
    '1.200.000',
    'Drink',
    'Transportation',
    'Gas',
    'Last numb'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
          itemCount: _category.length,
          itemBuilder: (context, index) {
            return ListTile(
              isThreeLine: true,
              leading: Icon(Icons.account_circle),
              title: Text(
                _category[index],
                style: TextStyle(letterSpacing: 1.0),
              ),
              subtitle: Text(_cost[index]),
              trailing: Text('trail'),
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
