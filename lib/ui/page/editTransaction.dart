import 'package:flutter/material.dart';
import 'package:money_manager/ui/customWidget/customImageFromAsset.dart';
import 'package:money_manager/ui/page/addRecordPage.dart';

class EditTransaction extends StatefulWidget {
  @override
  _EditTransactionState createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  final String transactionAmount;

  final String transactionSubCategory;

  final String transactionIcon;
  final String transactionNote;
  final String transactionDate;

  _EditTransactionState(
      {this.transactionAmount,
      this.transactionNote,
      this.transactionDate,
      this.transactionSubCategory,
      this.transactionIcon});
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
              height: 400,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_rounded)),
                      Spacer(),
                      FlatButton(onPressed: () {}, child: Icon(Icons.edit)),
                      FlatButton(onPressed: () {}, child: Icon(Icons.delete)),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          customImageFromAsset('images/foodAndBeverage.png'),
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
                          Text("Food & Beverage"),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "-10.000",
                            style: TextStyle(color: Colors.red, fontSize: 30),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Sunday, 29/12/2020",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "A note here",
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
}
