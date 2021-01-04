import 'package:flutter/material.dart';
import 'package:money_manager/core/transactionExampleData.dart';
import 'package:money_manager/core/moneyFormatter.dart';
import 'package:money_manager/userWidget/viewTransactionDetail.dart';
import 'package:intl/intl.dart';

DateTime now = DateTime.now();

class OldRecentTransaction extends StatefulWidget {
  @override
  _OldRecentTransactionState createState() => _OldRecentTransactionState();
}

class _OldRecentTransactionState extends State<OldRecentTransaction> {
  int transactionId;
  String transactionSubCategory;
  String transactionIcon;
  String transactionAmount;
  String transactionDate;
  String transactionNote;
  final transactionData = TransactionData.getData;
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: transactionData.length,
                itemBuilder: (context, index) {
                  return Container(
                    //padding: EdgeInsets.fromLTRB(5, 8, 8, 0),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 372, //Chiều cao của mỗi card
                    width: double.maxFinite,
                    child: Card(
                      elevation: 5,
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(1),
                          child: Stack(children: <Widget>[
                            Align(
                              alignment: Alignment.centerRight,
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              buildDayOfTransaction(
                                                  transactionData[index]),
                                              Spacer(
                                                flex: 2,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  //Format WEEKDAY
                                                  buildWeekdayOfTransaction(
                                                      transactionData[index]),
                                                  //Format YEAR_MONTH
                                                  buildMonthYearOfTransaction(
                                                      transactionData[index]),
                                                ],
                                              ),
                                              Spacer(
                                                flex: 1,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Spacer(
                                                flex: 10,
                                              ),
                                              buildTransactionNote(
                                                  transactionData[index]),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 2.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                height: 290,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    20,
                                                child: ListView.builder(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemCount: 19,
                                                    itemBuilder:
                                                        (context1, index1) {
                                                      return ListTile(
                                                          leading:
                                                              buildTransactionIcon(
                                                                  transactionData[
                                                                      index]),
                                                          title:
                                                              buildTransactionSubCategory(
                                                                  transactionData[
                                                                      index]),
                                                          trailing:
                                                              buildTransactionAmount(
                                                                  transactionData[
                                                                      index]),
                                                          onTap: () {
                                                            updateTransactionValue(
                                                                transactionData[
                                                                    index]);
                                                            _awaitValueFromEditTransactionScr(
                                                              context,
                                                              transactionId,
                                                              transactionSubCategory,
                                                              transactionIcon,
                                                              transactionAmount,
                                                              transactionDate,
                                                              transactionNote,
                                                            );
                                                            print("Tapped");
                                                          });
                                                    }),
                                              )
                                            ],
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget buildDayOfTransaction(data) {
    var getDateTime =
        DateFormat("dd/MM/yyyy", "vi_VN").parse('${data['transactionDate']}');
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

  Widget buildWeekdayOfTransaction(data) {
    var getDateTime =
        DateFormat("dd/MM/yyyy", "vi_VN").parse('${data['transactionDate']}');
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

  Widget buildMonthYearOfTransaction(data) {
    var getDateTime =
        DateFormat("dd/MM/yyyy", "vi_VN").parse('${data['transactionDate']}');
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

  Widget buildTransactionSubCategory(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: '${data['transactionSubCategory']}',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }

  Widget buildTransactionNote(data) {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
          text: '${data['transactionNote']}',
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  Widget getTransactionId(data) {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
          text: '${data['transactionId']}',
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  Widget buildTransactionIcon(data) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Image.asset(
        data['transactionIcon'],
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget buildTransactionAmount(data) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: moneyFormater(data['transactionAmount']),
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 20,
        ),
      ),
    );
  }

  void updateTransactionValue(data) {
    transactionId = int.parse('${data['transactionId']}');
    transactionSubCategory = '${data['transactionSubCategory']}';
    transactionIcon = '${data['transactionIcon']}';
    transactionAmount = '${data['transactionAmount']}';
    transactionNote = '${data['transactionNote']}';
    var getDateTime =
        DateFormat("dd/MM/yyyy", "vi_VN").parse('${data['transactionDate']}');
    transactionDate = getDateTime.toString();
  }

  //Chờ lấy các giá trị từ màn hình "Chỉnh sửa thông tin giao dịch"
  void _awaitValueFromEditTransactionScr(
      BuildContext context,
      int transactionId,
      String transactionSubCategory,
      String transactionIcon,
      String transactionAmount,
      String transationDate,
      String transactionNote) async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ViewTransactionDetail(
                  transactionId: transactionId,
                  transactionSubCategory: transactionSubCategory,
                  transactionIcon: transactionIcon,
                  transactionAmount: transactionAmount,
                  transactionDate: transactionDate,
                  transactionNote: transactionNote,
                )));
    //Sau khi chỉnh sửa ở màn hình 2 hoàn tất thì update màn hình này
    setState(() {});
  }
}
