import 'dart:io';

import 'package:flutter/material.dart';
import 'package:money_manager/ui/customWidget/customDatePicker.dart';
import 'package:flutter/services.dart';
import 'package:dropdownfield/dropdownfield.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Card(
        elevation: 3,
        child: SingleChildScrollView(
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
  File jsonFile;
  Directory directory;
  @override
  void dispose() {
    transactionAmountTextController.dispose();
    categoryTextController.dispose();
    noteTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context).size;
    return BuildFillTransactionForm(
        transactionAmountTextController: transactionAmountTextController,
        noteTextController: noteTextController,
        categoryTextController: categoryTextController,
        deviceData: deviceData);
  }
}

class BuildFillTransactionForm extends StatelessWidget {
  const BuildFillTransactionForm({
    Key key,
    @required this.transactionAmountTextController,
    @required this.noteTextController,
    @required this.categoryTextController,
    @required this.deviceData,
  }) : super(key: key);

  final TextEditingController transactionAmountTextController;
  final TextEditingController noteTextController;
  final TextEditingController categoryTextController;
  final Size deviceData;

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
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.money),
                      hintText: "0.00 ₫",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 25)),
                  controller: transactionAmountTextController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: TextField(
          //         decoration: InputDecoration(
          //             icon: Icon(Icons.category),
          //             hintText: "Select category",
          //             hintStyle: TextStyle(
          //               color: Colors.grey,
          //               fontSize: 22,
          //             )),
          //         controller: categoryTextController,
          //       ),
          //     )
          //   ],
          // ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      icon: Icon(Icons.note_add),
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
          SizedBox(
            height: 20,
          ),
          Row(children: [
            Icon(Icons.calendar_today),
            SizedBox(
              width: 20,
            ),
            CustomDatePicker(),
          ]),
          Row(children: [
            // SizedBox(width: 300, height: 200, child: CustomDropdownTextField()),
            Expanded(
                child: DropDownField(
              controller: categoryTextController,
              icon: Icon(Icons.category),
              labelText: "Choose a Category",
              hintText: "Other",
              itemsVisibleInDropdown: 6,
              strict: false,
              items: <String>[
                'Food',
                'Drink',
                'Transportation',
                'Household',
                'Bill',
                'Other',
              ],
              textStyle: TextStyle(fontSize: 18),
            )),
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
                            title: Text(
                              'Thông tin bạn đã nhập',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            content: Container(
                              height: deviceData.height / 3,
                              width: deviceData.width - 50,
                              child: Column(
                                children: [
                                  Text(transactionAmountTextController.text),
                                  Text(categoryTextController.text),
                                  Text(noteTextController.text),
                                ],
                              ),
                            ),
                          ));
                },
                child: Tooltip(message: "Save", child: Icon(Icons.save)),
              ),
            ],
          ),
        ]);
  }
}
