import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/core/databaseQuery.dart';
import 'package:money_manager/core/getSubCategoryIcon.dart';
import 'package:money_manager/core/getSubCategoryName.dart';
import 'package:money_manager/ui/page/chooseCategoryPage.dart';

class EditTransaction extends StatefulWidget {
  int transactionId;
  int transactionSubCategoryId;
  String transactionIcon;
  String transactionAmount;
  String transactionDate;
  String transactionNote;

  EditTransaction({
    @required this.transactionId,
    @required this.transactionSubCategoryId,
    @required this.transactionIcon,
    @required this.transactionAmount,
    @required this.transactionDate,
    @required this.transactionNote,
  });
  @override
  _EditTransactionState createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  final QueryMMTransaction _query = new QueryMMTransaction();
  var transactionAmount = TextEditingController();
  var transactionNote = TextEditingController();
  var transactionSubCategoryIdTextController = TextEditingController();
  var transactionDate = TextEditingController();
  int transactionId;
  var transactionIcon;
  var transactionSubCategoryId;
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
    transactionId = widget.transactionId;
    transactionAmount.text = widget.transactionAmount;
    transactionNote.text = widget.transactionNote;
    transactionSubCategoryIdTextController.text =
        getSubCategoryName(widget.transactionSubCategoryId);
    transactionDate.text = widget.transactionDate;
    transactionIcon = widget.transactionIcon;

    return Scaffold(
        appBar: AppBar(
          title: Text("Chỉnh sửa giao dịch"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            child: Container(
              height: 420,
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 25)),
                              controller: transactionAmount,
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
                            controller: transactionSubCategoryIdTextController,
                            style: TextStyle(fontSize: 22, color: Colors.grey),
                            readOnly: true,
                            onTap: () {
                              _pushToNextScreen(context);
                            },
                            decoration: InputDecoration(
                                hintText: "Chọn danh mục",
                                hintStyle: TextStyle(
                                    fontSize: 22, color: Colors.grey)),
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
                              controller: transactionNote,
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
                                  hintText: widget.transactionDate,
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 22),
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
                                _updateTransaction();
                                Fluttertoast.showToast(
                                    msg: "Thêm giao dịch mới thành công",
                                    toastLength: Toast.LENGTH_LONG);
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.save, size: 40),
                              label: Text(
                                "Lưu",
                                style: TextStyle(fontSize: 18),
                              ))
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }

  void _pushToNextScreen(BuildContext context) async {
    var subCategoryId = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ChooseCategoryPage()));
    setState(() {
      //Cần insert vào MMTransaction ID của SubCategory, tuy nhiên ở màn hình này
      //cần phải hiển thị tên SubCategory đẻ người dùng dễ nhận biết
      var subCategoryName = getSubCategoryName(subCategoryId);
      transactionSubCategoryIdTextController.text = subCategoryName;
      transactionSubCategoryId = subCategoryId;
      //Lấy URI Icon của subCategory
      widget.transactionIcon = getSubCategoryIcon(subCategoryId);
      widget.transactionSubCategoryId = subCategoryId;
    });
  }

  void _updateTransaction() async {
    widget.transactionDate =
        DateFormat("dd-MM-yyyy", "vi_VN").format(selectedDate);
    //transactionDate = DateFormat("dd/MM/yyyy", "vi_VN").format(selectedDate);
    log('Invoked _addATransaction');
    await _query.updateATransaction(
        transactionId,
        widget.transactionSubCategoryId,
        transactionAmount.text,
        transactionIcon,
        widget.transactionDate,
        transactionNote.text);
  }
}
