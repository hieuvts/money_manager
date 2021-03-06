import 'package:flutter/material.dart';
import 'package:money_manager/core/dateFormatter.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var _biggerText = TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    var _date = getVietnameseDateTime("2021-12-01");
    var deviceData = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
            child: Card(
          elevation: 5,
          child: Column(
            children: [
              Icon(
                Icons.person,
                size: deviceData.width,
              ),
              Text(
                "Đồ án 2",
                style: _biggerText,
              ),
              Spacer(),
              Text(
                "Ứng dụng quản lí thu chi cá nhân",
                style: _biggerText,
              ),
              Text(_date),
              Spacer(),
            ],
          ),
        ))
      ],
    );
  }
}
