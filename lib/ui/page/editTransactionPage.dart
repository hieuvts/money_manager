import 'package:flutter/material.dart';
import 'package:money_manager/core/databaseQuery.dart';

class EditTransaction extends StatelessWidget {
  final int transactionId;
  final String transactionSubCategory;
  final String transactionIcon;
  final String transactionAmount;
  final String transactionDate;
  final String transactionNote;

  EditTransaction({
    Key key,
    @required this.transactionId,
    @required this.transactionSubCategory,
    @required this.transactionIcon,
    @required this.transactionAmount,
    @required this.transactionDate,
    @required this.transactionNote,
  }) : super(key: key);
  QueryMMTransaction _query = new QueryMMTransaction();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chỉnh sửa giao dịch"),
      ),
    );
  }
}
