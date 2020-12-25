import 'package:flutter/material.dart';
import 'package:money_manager/ui/modules/page/transactionPage.dart';

class TransactionData {
  static final getData = [
    {
      'name': 'Food',
      'icon': 'images/burger.png',
      'change': '-20.000',
      'changeColor': Colors.redAccent,
      'value': '20.000 VND',
    },
    {
      'name': 'Parking',
      'icon': 'images/parking.png',
      'change': '-50.000',
      'changeColor': Colors.redAccent,
      'value': '50.000 VND'
    },
    {
      'name': 'Salary',
      'icon': 'images/salary.png',
      'change': '+1.000.000',
      'changeColor': Colors.green,
      'value': '1.000.000 VND'
    },
    {
      'name': 'Salary',
      'icon': 'images/salary.png',
      'change': '+1.000.000',
      'changeColor': Colors.green,
      'value': '1.000.000 VND'
    },
    {
      'name': 'Salary',
      'icon': 'images/salary.png',
      'change': '+1.000.000',
      'changeColor': Colors.green,
      'value': '1.000.000 VND'
    },
    {
      'name': 'Salary',
      'icon': 'images/salary.png',
      'change': '+1.000.000',
      'changeColor': Colors.green,
      'value': '1.000.000 VND'
    },
    {
      'name': 'Salary',
      'icon': 'images/salary.png',
      'change': '+1.000.000',
      'changeColor': Colors.green,
      'value': '1.000.000 VND'
    },
  ];
}

DateTime now = DateTime.now();

class Dashboard extends StatelessWidget {
  var transactionData = TransactionData.getData;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IncomeAndOutcome(),
          Expanded(
            child: ListView.builder(
// scrollDirection: Axis.horizontal,
                itemCount: transactionData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: 180,
                    width: double.maxFinite,
                    child: Card(
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 2.0, color: Colors.grey),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(7),
                          child: Stack(children: <Widget>[
                            Align(
                              alignment: Alignment.centerRight,
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 1, top: 1),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              dateOfTransaction(
                                                  now.day.toString()),
                                              Spacer(
                                                flex: 1,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              nameOfTransaction(
                                                  transactionData[index]),
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
                                            thickness: 1.5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(
                                                  height: 50,
                                                  width: 50,
                                                  child: icon_typeOfTransaction(
                                                      transactionData[index])),
                                              transactionAmount(
                                                  transactionData[index]),
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

  Widget dateOfTransaction(date) {
    return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            date,
            style: TextStyle(fontSize: 40),
          ),
        ));
  }

  Widget nameOfTransaction(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: '${data['name']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }

  Widget walletChange(data) {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
          text: '${data['change']}',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: data['changeColor'],
              fontSize: 20),
        ),
      ),
    );
  }

  Widget icon_typeOfTransaction(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Image.asset(data['icon']),
    );
  }

  Widget transactionAmount(data) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Row(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: '\n${data['value']}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
