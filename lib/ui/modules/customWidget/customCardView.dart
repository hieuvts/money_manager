import 'package:flutter/material.dart';
import 'package:money_manager/core/transactionExampleData.dart';
import 'package:money_manager/core/monthToString.dart';
import 'package:intl/intl.dart';

DateTime now = DateTime.now();

class RecentTransaction extends StatelessWidget {
  final transactionData = TransactionData.getData;
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
                                              dateOfTransaction(
                                                  now.day.toString()),
                                              Spacer(
                                                flex: 2,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(DateFormat.EEEE().format(
                                                      new DateTime.now())),
                                                  Text(DateFormat.yMMMM()
                                                      .format(
                                                          new DateTime.now())),
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
                                              walletChange(
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
                                                    itemCount: 9,
                                                    itemBuilder:
                                                        (context1, index1) {
                                                      return ListTile(
                                                        leading:
                                                            iconTypeOfTransaction(
                                                                transactionData[
                                                                    index]),
                                                        title:
                                                            nameOfTransaction(
                                                                transactionData[
                                                                    index]),
                                                        trailing:
                                                            transactionAmount(
                                                                transactionData[
                                                                    index]),
                                                      );
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

  Widget dateOfTransaction(data) {
    return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            data,
            style: TextStyle(fontSize: 40),
          ),
        ));
  }

  Widget monthOfTransaction(data) {
    final getMonth = DateTimeToMonth.monthToString;
    return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            getMonth[data -
                1], //Tháng từ 1-12 tuy nhiên hàm monthToString xác định từ index 0 tới 11
            style: TextStyle(fontSize: 15),
          ),
        ));
  }

  Widget nameOfTransaction(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: '${data['name']}',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }

  Widget walletChange(data) {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
          text: '${data['change']} VND',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: data['changeColor'],
              fontSize: 20),
        ),
      ),
    );
  }

  Widget iconTypeOfTransaction(data) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Image.asset(
        data['icon'],
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget transactionAmount(data) {
    var amount = int.parse('${data['value']}');
    String moneyData = NumberFormat.currency(locale: 'vi')
        .format(amount); //Format theo kieu tien Vietnam
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: moneyData,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 20,
        ),
      ),
    );
  }
}
