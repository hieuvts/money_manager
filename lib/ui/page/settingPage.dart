import 'package:flutter/cupertino.dart';
import 'package:money_manager/core/databaseHelper.dart';
import 'package:money_manager/core/databaseQuery.dart';
import 'package:money_manager/core/models.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SettingPageState();
  }
}

class SettingPageState extends State<SettingPage> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  QueryCtr _query = new QueryCtr();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _query.getAllCategory(),
      initialData: List(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return _buildRow(snapshot.data[i]);
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget _buildRow(Category category) {
    return new ListTile(
        title: new Text(category.categoryName, style: _biggerFont),
        trailing: new RaisedButton(onPressed: () {
          _query.insertNewCategory();
        }));
  }
}
