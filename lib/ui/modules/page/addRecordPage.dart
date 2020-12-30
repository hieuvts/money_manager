import 'package:flutter/material.dart';
import 'package:money_manager/ui/modules/customWidget/customDatePicker.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: FillTransactionInfo(),
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
    return Column(children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Nhập thông tin giao dịch",
          style: TextStyle(fontSize: 25, fontFamily: "HelveticaneueLight"),
        ),
      ),
      SizedBox(
        height: 50,
      ),
      Row(
        children: [
          Image.asset(
            'images/BWcoin.png',
            width: 35,
            height: 35,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "0.00 ₫",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 20)),
              controller: transactionAmountTextController,
            ),
          ),
        ],
      ),
      Row(
        children: [
          Image.asset(
            'images/BWcategory.png',
            width: 35,
            height: 35,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Select category",
                  hintStyle: TextStyle(color: Colors.grey)),
              controller: categoryTextController,
            ),
          )
        ],
      ),
      Row(children: [
        Image.asset(
          'images/BWcalendar.png',
          width: 35,
          height: 35,
        ),
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
            onPressed: () {},
            child: Tooltip(message: "Save", child: Icon(Icons.save)),
          ),
        ],
      ),
    ]);
  }
}
