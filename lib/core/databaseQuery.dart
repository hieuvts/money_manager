import 'package:money_manager/core/models.dart';
import 'dart:async';
import 'package:money_manager/core/databaseHelper.dart';

class QueryCtr {
  DatabaseHelper con = new DatabaseHelper();

  Future<List<Category>> getAllCategory() async {
    var dbClient = await con.db;
    var res = await dbClient.query("Category");

    List<Category> list =
        res.isNotEmpty ? res.map((c) => Category.fromMap(c)).toList() : null;

    return list;
  }

  Future<List<Category>> insertNewCategory() async {
    var dbClient = await con.db;
    await dbClient.insert('Category', {
      'categoryId': '3',
      'categoryName': 'Parking',
      'categoryIcon': 'images/parking.png'
    });
  }
}
