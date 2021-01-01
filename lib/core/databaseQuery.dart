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

  Future insertNewCategory(int id) async {
    var dbClient = await con.db;
    await dbClient.insert('Category', {
      'categoryId': '$id',
      'categoryName': 'Parking',
      'categoryIcon': 'images/parking.png'
    });
  }

  Future deleteACategory(int id) async {
    var dbClient = await con.db;
    var categoryId = id - 1;
    var count = await dbClient.delete('Category', where: 'id=$categoryId');
    print("Row $count has been deleted");
  }
}
