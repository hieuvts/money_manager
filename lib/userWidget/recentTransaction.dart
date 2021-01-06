import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:money_manager/core/databaseModels.dart';
import 'package:money_manager/core/databaseQuery.dart';
import 'package:money_manager/core/getSubCategoryName.dart';
import 'package:money_manager/core/transactionExampleData.dart';
import 'package:money_manager/core/moneyFormatter.dart';
import 'package:money_manager/userWidget/viewTransactionDetail.dart';
import 'package:money_manager/core/getContainerHeight.dart';
import 'package:intl/intl.dart';

DateTime now = DateTime.now();

class RecentTransaction extends StatefulWidget {
  @override
  _RecentTransactionState createState() => _RecentTransactionState();
}

class _RecentTransactionState extends State<RecentTransaction> {
  int transactionId;
  int transactionSubCategoryId;
  String transactionIcon;
  String transactionAmount;
  String transactionDate;
  String transactionNote;
  final transactionData = TransactionData.getData;
  // @override
  // void setState(fn) {
  //   super.setState(fn);
  // }

  QueryMMTransaction _query = new QueryMMTransaction();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        //future: _query.getAllTransaction(),
        future: _query.getTransactionByDate(),
        initialData: List(),
        builder: (context, snapshot) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Scrollbar(
                    thickness: 3,
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            //height: 250, //Chiều cao của mỗi card
                            width: double.maxFinite,
                            child: Card(
                              elevation: 5,
                              child: Container(
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Stack(
                                        children: <Widget>[
                                          Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      buildDayOfTransaction(
                                                          snapshot.data[index]),
                                                      Spacer(
                                                        flex: 2,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          //Format WEEKDAY
                                                          buildWeekdayOfTransaction(
                                                              snapshot
                                                                  .data[index]),
                                                          //Format YEAR_MONTH
                                                          buildMonthYearOfTransaction(
                                                              snapshot
                                                                  .data[index]),
                                                        ],
                                                      ),
                                                      Spacer(
                                                        flex: 10,
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 2.0,
                                                  ),
                                                  FutureBuilder<List>(
                                                      future: _query
                                                          .getAllTransactionIn(
                                                              snapshot
                                                                  .data[index]
                                                                  .transactionDate),
                                                      initialData: List(),
                                                      builder:
                                                          (context, _snapshot) {
                                                        return Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Container(
                                                              height:
                                                                  getContainerHeight(
                                                                      _snapshot
                                                                          .data
                                                                          .length),
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width -
                                                                  20,
                                                              child: ListView
                                                                  .builder(
                                                                      physics:
                                                                          const NeverScrollableScrollPhysics(),
                                                                      itemCount: _snapshot
                                                                          .data
                                                                          .length,
                                                                      itemBuilder:
                                                                          (snapshot,
                                                                              index) {
                                                                        return ListTile(
                                                                            leading:
                                                                                buildTransactionIcon(_snapshot.data[index]),
                                                                            title: buildTransactionSubCategory(_snapshot.data[index]),
                                                                            trailing: buildTransactionAmount(_snapshot.data[index]),
                                                                            onTap: () {
                                                                              updateTransactionValue(_snapshot.data[index]);
                                                                              _awaitValueFromViewTransactionScr(
                                                                                context,
                                                                                transactionId,
                                                                                transactionSubCategoryId,
                                                                                transactionIcon,
                                                                                transactionAmount,
                                                                                transactionDate,
                                                                                transactionNote,
                                                                              );
                                                                            });
                                                                      }),
                                                            )
                                                          ],
                                                        );
                                                      }),
                                                ],
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildDayOfTransaction(MMTransaction data) {
    var getDateTime =
        DateFormat("yyyy-MM-dd", "en_US").parse(data.transactionDate);
    return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            DateFormat.d('vi_VN').format(getDateTime),
            style: TextStyle(fontSize: 35),
          ),
        ));
  }

  Widget buildWeekdayOfTransaction(MMTransaction data) {
    var getDateTime =
        DateFormat("yyyy-MM-dd", "en_US").parse(data.transactionDate);
    return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            DateFormat.EEEE('vi_VN').format(getDateTime),
            style: TextStyle(fontSize: 18),
          ),
        ));
  }

  Widget buildMonthYearOfTransaction(MMTransaction data) {
    var getDateTime =
        DateFormat("yyyy-MM-dd", "en_US").parse(data.transactionDate);
    return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            DateFormat.yMMMM('vi_VN').format(getDateTime),
            style: TextStyle(fontSize: 14),
          ),
        ));
  }

  Widget buildTransactionSubCategory(MMTransaction data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: getSubCategoryName(data.transactionSubCategoryId),
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }

  Widget buildTransactionNote(MMTransaction data) {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
          text: data.transactionNote,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  Widget getTransactionId(MMTransaction data) {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
          text: data.transactionId.toString(),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  Widget buildTransactionIcon(MMTransaction data) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Image.asset(
        data.transactionIcon,
        width: 25,
        height: 25,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget buildTransactionAmount(MMTransaction data) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: moneyFormater(data.transactionAmount),
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 18,
        ),
      ),
    );
  }

  void updateTransactionValue(MMTransaction data) {
    transactionId = data.transactionId;
    transactionSubCategoryId = data.transactionSubCategoryId;
    transactionIcon = data.transactionIcon;
    transactionAmount = data.transactionAmount;
    transactionNote = data.transactionNote;
    var getDateTime = DateFormat("yyyy-MM-dd", "en_US").parse("2020-12-29");
    var _transactionDate = DateFormat.yMMMMd('vi_VN').format(getDateTime);
    transactionDate = _transactionDate;
    // log(data.transactionDate);
    // log(getDateTime.toString());
    // log(transactionDate);
  }

  //Chờ lấy các giá trị từ màn hình "Chỉnh sửa thông tin giao dịch"
  void _awaitValueFromViewTransactionScr(
      BuildContext context,
      int transactionId,
      int transactionSubCategory,
      String transactionIcon,
      String transactionAmount,
      String transationDate,
      String transactionNote) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ViewTransactionDetail(
                  transactionId: transactionId,
                  transactionSubCategoryId: transactionSubCategoryId,
                  transactionIcon: transactionIcon,
                  transactionAmount: transactionAmount,
                  transactionDate: transactionDate,
                  transactionNote: transactionNote,
                )));
    //Sau khi chỉnh sửa ở màn hình 2 hoàn tất thì update màn hình này
    setState(() {});
  }
}
