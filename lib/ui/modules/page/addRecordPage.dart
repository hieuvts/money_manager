import 'package:flutter/material.dart';
import 'package:money_manager/ui/modules/page/transactionPage.dart';

class CryptoData {
  static final getData = [
    {
      'name': 'Drink',
      'symbol': 'BTC',
      'icon': Icons.arrow_back,
      'iconColor': Colors.orange,
      'change': '-20.000',
      'changeValue': '-20.000',
      'changeColor': Colors.redAccent,
      'value': '20.000 VND',
    },
    {
      'name': 'Transportation',
      'symbol': 'ETH',
      'icon': Icons.arrow_back,
      'iconColor': Colors.black,
      'change': '-50.000',
      'changeValue': '-50.000',
      'changeColor': Colors.redAccent,
      'value': '50.000 VND'
    },
    {
      'name': 'Salary',
      'symbol': 'ETH',
      'icon': Icons.arrow_back,
      'iconColor': Colors.black,
      'change': '+1.000.000',
      'changeValue': '+1.000.000',
      'changeColor': Colors.green,
      'value': '1.000.000 VND'
    },
  ];
}

DateTime now = DateTime.now();

class Dashboard extends StatelessWidget {
  var cryptoData = CryptoData.getData;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
// scrollDirection: Axis.horizontal,
                itemCount: cryptoData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: 320,
                    width: double.maxFinite,
                    child: Card(
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                                width: 2.0,
                                color: cryptoData[index]['iconColor']),
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
                                          left: 10, top: 1),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              dateOfTransaction(
                                                  now.day.toString()),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              cryptoNameSymbol(
                                                  cryptoData[index]),
                                              Spacer(),
                                              walletChange(cryptoData[index]),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              changeIcon(cryptoData[index]),
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            children: <Widget>[
                                              transactionAmount(
                                                  cryptoData[index])
                                            ],
                                          ),
                                          IncomeAndOutcome(),
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

  Widget cryptoNameSymbol(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: '${data['name']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n${data['symbol']}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
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
              fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n${data['changeValue']}',
                style: TextStyle(
                    color: data['changeColor'],
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget changeIcon(data) {
    return Align(
        alignment: Alignment.topRight,
        child: data['change'].contains('-')
            ? Icon(
                Icons.new_releases,
                color: data['changeColor'],
                size: 30,
              )
            : Icon(
                Icons.new_releases,
                color: data['changeColor'],
                size: 30,
              ));
  }

  Widget transactionAmount(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: '\n${data['value']}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 35,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: '\n0.1349',
                      style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
