import 'package:flutter/material.dart';
import 'package:money_manager/core/databaseQuery.dart';
import 'package:money_manager/ui/customWidget/customImageFromAsset.dart';

// class EditTransaction extends StatefulWidget {
//   @override
//   _EditTransactionState createState() => _EditTransactionState();
// }

class EditTransaction extends StatelessWidget {
  final int transactionId;
  final String transactionSubCategory;
  final String transactionIcon;
  final String transactionAmount;
  final String transactionDate;
  final String transactionNote;

  EditTransaction({
    Key key,
    @required this.transactionId,
    @required this.transactionSubCategory,
    @required this.transactionIcon,
    @required this.transactionAmount,
    @required this.transactionDate,
    @required this.transactionNote,
  }) : super(key: key);
  QueryMMTransaction _query = new QueryMMTransaction();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Thông tin chi tiết'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            elevation: 5,
            child: Container(
              height: 350,
              child: Column(
                children: [
                  Row(
                    children: [
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_rounded)),
                      Spacer(),
                      FlatButton(onPressed: () {}, child: Icon(Icons.edit)),
                      FlatButton(
                          onPressed: () {
                            print('Button Delete is pressed');
                            _deleteThisTransaction(transactionId);
                          },
                          child: Icon(Icons.delete)),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          customImageFromAsset(transactionIcon),
                          SizedBox(
                            height: 15,
                          ),
                          Icon(Icons.money_off),
                          SizedBox(
                            height: 15,
                          ),
                          Icon(Icons.calendar_today),
                          SizedBox(
                            height: 15,
                          ),
                          Icon(Icons.line_style),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(transactionSubCategory),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            transactionAmount,
                            style: TextStyle(color: Colors.red, fontSize: 28),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            transactionDate,
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            transactionNote,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _sendValueBack(BuildContext context) {
    //String textToSendBack = textFieldController.text;
    //Navigator.pop(context, textToSendBack);
  }
  void _deleteThisTransaction(int id) {
    print('Invoke delete transaction command');
    _query.deleteATransaction(id);
  }
}
