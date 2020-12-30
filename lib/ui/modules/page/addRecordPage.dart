import 'package:flutter/material.dart';
import 'package:money_manager/ui/modules/customWidget/customDatePicker.dart';
import 'package:money_manager/ui/modules/customWidget/customImageFromAsset.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: Card(
        elevation: 3,
        child: Container(
            padding: EdgeInsets.all(10), child: FillTransactionInfo()),
      ),
    );
  }
}

class FillTransactionInfo extends StatefulWidget {
  @override
  _FillTransactionInfoState createState() => _FillTransactionInfoState();
}

class _FillTransactionInfoState extends State<FillTransactionInfo> {
  final transactionAmountTextController = TextEditingController();
  final categoryTextController = TextEditingController();
  final noteTextController = TextEditingController();
  @override
  void dispose() {
    transactionAmountTextController.dispose();
    categoryTextController.dispose();
    noteTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Nhập thông tin giao dịch",
              style: TextStyle(fontSize: 25, fontFamily: "HelveticaneueLight"),
            ),
          ),
          Row(
            children: [
              customImageFromAsset('images/BWcoin.png'),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "0.00 ₫",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 25)),
                  controller: transactionAmountTextController,
                ),
              ),
            ],
          ),
          Row(
            children: [
              customImageFromAsset('images/BWcategory.png'),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Select category",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                      )),
                  controller: categoryTextController,
                ),
              )
            ],
          ),
          Row(
            children: [
              customImageFromAsset('images/BWnote.png'),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Note",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                      )),
                  controller: noteTextController,
                ),
              )
            ],
          ),
          Row(children: [
            customImageFromAsset('images/BWcalendar.png'),
            SizedBox(
              width: 20,
            ),
            CustomDatePicker(),
          ]),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[300],
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: Text('Dialog Title'),
                            content: Text(noteTextController.text),
                          ));
                },
                child: Tooltip(message: "Save", child: Icon(Icons.save)),
              ),
            ],
          ),
        ]);
  }
}

String _validateTransactionAmount(String transactionAmount) {
  if (transactionAmount == null || transactionAmount == '') {
    return 'Cần nhập số tiền';
  }
  return null;
}
