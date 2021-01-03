import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
// class DatabaseHelper {
//   static final DatabaseHelper _instance = new DatabaseHelper.internal();
//   factory DatabaseHelper() => _instance;

//   static Database _db;

//   Future<Database> get db async {
//     if (_db != null) {
//       return _db;
//     }
//     _db = await initDb();
//     return _db;
//   }

//   DatabaseHelper.internal();
//   initDb() async {
//     Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path, "money_manager.db");

//     // Only copy if the database doesn't exist
//     if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
//       // Load database from asset and copy
//       ByteData data = await rootBundle.load(join('data', 'money_manager.db'));
//       List<int> bytes =
//           data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

//       // Save copied asset to documents
//       await new File(path).writeAsBytes(bytes);

//       var ourDb = await openDatabase(path);
//       return ourDb;
//     }
//   }
// }

class DatabaseHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  var dbName = 'money_manager.db';
  initDb() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, dbName);

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("data", dbName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
// open the database
    _db = await openDatabase(path, readOnly: false);
    return _db;
  }
}
