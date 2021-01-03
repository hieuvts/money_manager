import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_manager/ui/customWidget/customDatePicker.dart';

class EditTransaction extends StatefulWidget {
  @override
  _EditTransactionState createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  final transactionAmountTextController = TextEditingController();
  final categoryTextController = TextEditingController();
  final noteTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
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
