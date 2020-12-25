import 'package:flutter/material.dart';

class AddRecordPage extends StatefulWidget {
  @override
  _AddRecordPageState createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 120,
      width: double.maxFinite,
      child: TransactionRecords(),
    ));
  }
}

class TransactionRecords extends StatelessWidget {
  const TransactionRecords({
    Key key,
  }) : super(key: key);

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
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.amber,
                                    size: 40,
                                  )),
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
