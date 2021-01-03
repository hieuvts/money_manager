import 'package:money_manager/core/models.dart';
import 'dart:async';
import 'package:money_manager/core/databaseHelper.dart';
import 'package:sqflite/sqflite.dart';

class QueryMMCategory {
  DatabaseHelper con = new DatabaseHelper();

  Future<List<MMCategory>> getAllCategory() async {
    var dbClient = await con.db;
    var res = await dbClient.query("Category");

    List<MMCategory> list =
        res.isNotEmpty ? res.map((c) => MMCategory.fromMap(c)).toList() : null;

    return list;
  }

  Future insertNewCategory(int id, String categoryName) async {
    var dbClient = await con.db;
    await dbClient.insert(
        'Category',
        {
          'categoryId': '$id',
          'categoryName': '$categoryName',
          'categoryIcon': 'images/parking.png'
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("Row $id has been added");
  }

  Future deleteACategory(int id) async {
    var dbClient = await con.db;
    var count = await dbClient
        .delete('Category', where: 'categoryId = ?', whereArgs: [id]);
    print("Delete row $id ");
    print("$count row has been deleted");
  }

  Future updateACategory(int id, String categoryName) async {
    var dbClient = await con.db;
    var count = await dbClient.update(
        'Category', {'categoryName': '$categoryName'},
        where: 'categoryId = ?',
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("Update row $id");
    print("$count row has been updated");
  }
}

class QueryMMTransaction {
  DatabaseHelper con = new DatabaseHelper();

  Future<List<MMTransaction>> getAllCategory() async {
    var dbClient = await con.db;
    var res = await dbClient.query("Transaction");
    //raw SQL
//     select transactionId, transactionAmount, MMsubCategory.subCategoryName,transactionDate, transactionIcon, transactionNote
// from MMTransaction, MMsubCategory where MMTransaction.transactionSubCategory=MMsubCategory.subCategoryId
    List<MMTransaction> list = res.isNotEmpty
        ? res.map((c) => MMTransaction.fromMap(c)).toList()
        : null;

    return list;
  }

  Future insertNewCategory(
      int id,
      int transactionCategory,
      double transactionAmount,
      String transactionIcon,
      String transactionDate,
      String transactionNote) async {
    var dbClient = await con.db;
    await dbClient.insert(
        'Transaction',
        {
          'transactionId': '$id',
          'transactionCategory': '$transactionCategory',
          'transactionAmount': '$transactionAmount',
          'transactionIcon': '$transactionIcon',
          'transactionDate': '$transactionDate',
          'transactionNote': '$transactionNote',
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
    //raw sql
//         INSERT INTO MMTransaction($transactionSubCategory, $transactionAmount, $transactionIcon, $transactionDate, $transactionNote)
// VALUES (4, '3000', 'images/parking.png', '29/12/2020', 'Bike parking 2')
    print("Row $id has been added");
  }

  Future deleteACategory(int id) async {
    var dbClient = await con.db;
    var count = await dbClient
        .delete('Transaction', where: 'transactionId = ?', whereArgs: [id]);
    print("Delete row $id ");
    print("$count row has been deleted");
  }

  Future updateACategory(
      int id,
      double transactionAmount,
      String transactionIcon,
      String transactionDate,
      String transactionNote) async {
    var dbClient = await con.db;
    var count = await dbClient.update(
        'Transaction',
        {
          'transactionAmount': '$transactionAmount',
          'transactionIcon': '$transactionIcon',
          'transactionDate': '$transactionDate',
          'transactionNote': '$transactionNote',
        },
        where: 'transactionId = ?',
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("Update row $id");
    print("$count row has been updated");
  }
}
