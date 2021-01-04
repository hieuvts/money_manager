import 'package:flutter/material.dart';
import 'package:money_manager/core/databaseQuery.dart';

class ChooseCategoryPage extends StatelessWidget {
  String chosenCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chọn danh mục"),
      ),
      body: Padding(
        padding: EdgeInsets.all(1),
        child: Card(
          elevation: 3,
          child: Container(),
        ),
      ),
    );
  }

  void _sendValueBack(BuildContext context) {
    Navigator.pop(context, chosenCategory);
  }
}
