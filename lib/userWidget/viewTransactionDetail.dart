import 'package:flutter/material.dart';
import 'package:money_manager/core/databaseQuery.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:money_manager/core/getSubCategoryName.dart';
import 'package:money_manager/ui/customWidget/customImageFromAsset.dart';
import 'package:money_manager/ui/page/editTransactionPage.dart';
import 'package:money_manager/core/moneyFormatter.dart';

class ViewTransactionDetail extends StatefulWidget {
  final int transactionId;
  final int transactionSubCategoryId;
  final String transactionIcon;
  final String transactionAmount;
  final String transactionDate;
  final String transactionNote;

  ViewTransactionDetail({
    Key key,
    @required this.transactionId,
    @required this.transactionSubCategoryId,
    @required this.transactionIcon,
    @required this.transactionAmount,
    @required this.transactionDate,
    @required this.transactionNote,
  }) : super(key: key);
  @override
  _ViewTransactionDetailState createState() => _ViewTransactionDetailState();
}

class _ViewTransactionDetailState extends State<ViewTransactionDetail> {
  final QueryMMTransaction _query = new QueryMMTransaction();
  @override
  Widget build(BuildContext context) {
    int transactionId = widget.transactionId;
    int transactionSubCategoryId = widget.transactionSubCategoryId;
    String transactionIcon = widget.transactionIcon;
    String transactionAmount = widget.transactionAmount;
    String transactionDate = widget.transactionDate;
    String transactionNote = widget.transactionNote;
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
                          child: Tooltip(
                              message: "Quay về trang trước đó",
                              child: Icon(Icons.arrow_back_rounded))),
                      Spacer(),
                      FlatButton(
                          onPressed: () async {
                            final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditTransaction(
                                          transactionId: transactionId,
                                          transactionSubCategoryId:
                                              transactionSubCategoryId,
                                          transactionIcon: transactionIcon,
                                          transactionAmount: transactionAmount,
                                          transactionDate: transactionDate,
                                          transactionNote: transactionNote,
                                        )));
                            if (result) {
                              setState(() {});
                            }
                          },
                          onLongPress: () {
                            _showToast('Chỉnh sửa giao dịch này');
                          },
                          child: Icon(Icons.edit)),
                      FlatButton(
                          onPressed: () {
                            print('Button Delete is pressed');
                            _deleteThisTransaction(transactionId);
                            _showToast('Xoá thành công');
                            Navigator.pop(context, true);
                          },
                          child: Tooltip(
                              message: "Xoá giao dịch này",
                              child: Icon(Icons.delete))),
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
                              Text(
                                  getSubCategoryName(transactionSubCategoryId)),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            moneyFormater(transactionAmount),
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

  void _deleteThisTransaction(int id) async {
    print('Invoke delete transaction command');
    await _query.deleteATransaction(id);
  }

  void _showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[400],
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
