import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/core/databaseQuery.dart';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:money_manager/ui/page/chooseCategoryPage.dart';
import 'package:money_manager/core/getSubCategoryName.dart';
import 'package:money_manager/core/getSubCategoryIcon.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Thêm giao dịch mới"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Card(
          elevation: 3,
          child: SingleChildScrollView(
              padding: EdgeInsets.all(10), child: BuildFillTransactionForm()),
        ),
      ),
    );
  }
}

class BuildFillTransactionForm extends StatefulWidget {
  @override
  _BuildFillTransactionFormState createState() =>
      _BuildFillTransactionFormState();
}

class _BuildFillTransactionFormState extends State<BuildFillTransactionForm> {
  var transactionAmountTextController = TextEditingController();
  var noteTextController = TextEditingController();
  var categoryTextController = TextEditingController();
  var datepickerTextController = TextEditingController();

  int transactionId;
  int transactionSubCategory;
  String transactionAmount;
  String transactionIcon;
  String transactionDate;
  String transactionNote;
  final QueryMMTransaction _query = new QueryMMTransaction();
  DateTime selectedDate = DateTime.now();
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.money,
                        color: Colors.black,
                      ),
                      hintText: " 0.00 ₫",
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
          Row(children: [
            Icon(Icons.category),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                controller: categoryTextController,
                style: TextStyle(fontSize: 22, color: Colors.grey),
                readOnly: true,
                onTap: () {
                  _pushToNextScreen(context);
                },
                decoration: InputDecoration(
                    hintText: "Chọn danh mục",
                    hintStyle: TextStyle(fontSize: 22, color: Colors.grey)),
              ),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.note_add,
                        color: Colors.black,
                      ),
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
            Expanded(
              child: InkWell(
                onTap: () {
                  _selectDate(context); // Gọi hàm showDatePicker()
                },
                child: IgnorePointer(
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      hintText: DateFormat("dd/MM/yyyy", "vi_VN")
                          .format(selectedDate),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 22),
                    ),
                    maxLength: 10,
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton.icon(
                  onPressed: () {
                    print('invoked');
                    _addATransaction();
                    Fluttertoast.showToast(
                        msg: "Thêm giao dịch mới thành công",
                        toastLength: Toast.LENGTH_LONG);
                  },
                  icon: Icon(Icons.save, size: 40),
                  label: Text(
                    "Lưu",
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ]);
  }

  void _pushToNextScreen(BuildContext context) async {
    var subCategoryId = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ChooseCategoryPage()));
    setState(() {
      //Cần insert vào MMTransaction ID của SubCategory, tuy nhiên ở màn hình này
      //cần phải hiển thị tên SubCategory đẻ người dùng dễ nhận biết
      var subCategoryName = getSubCategoryName(subCategoryId);
      categoryTextController.text = subCategoryName;
      //Lấy URI Icon của subCategory
      transactionIcon = getSubCategoryIcon(subCategoryId);
      transactionSubCategory = subCategoryId;
    });
  }

  void _addATransaction() async {
    transactionDate = DateFormat("yyyy-MM-dd", "vi_VN").format(selectedDate);
    log('Invoked _addATransaction');
    await _query.insertNewTransaction(
        transactionSubCategory,
        transactionAmountTextController.text,
        transactionIcon,
        transactionDate,
        noteTextController.text);
  }
}
