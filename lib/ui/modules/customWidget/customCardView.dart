import 'package:flutter/material.dart';

class CustomCardView extends StatefulWidget {
  @override
  _CustomCardViewState createState() => _CustomCardViewState();
}

class _CustomCardViewState extends State<CustomCardView> {
  @override
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
  final List<String> _totalCost = [
    '100000',
    '200.000',
    '100.000',
    '200.000',
    '1.200.000',
    'Drink',
    'Transportation',
    'Gas',
    'Last numb'
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

  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Stack(children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: ListView.builder(
                      itemCount: _category.length,
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
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
