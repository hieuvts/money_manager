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
    print("Row $id has been added");
  }

  Future deleteACategory(int id) async {
    var dbClient = await con.db;
    var count = await dbClient
        .delete('Category', where: 'categoryId = ?', whereArgs: [id - 1]);
    print("Delete row $id has been deleted");
    print("$count row has been deleted");
  }
}
