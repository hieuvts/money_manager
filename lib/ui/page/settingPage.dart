import 'package:flutter/cupertino.dart';
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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _query.getAllCategory(),
      initialData: List(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("A"),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(10.0),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return _buildRow(snapshot.data[i]);
                      },
                    ),
                  ),
                  RaisedButton(
                      child: Text('Delete Row ${snapshot.data.length}'),
                      onPressed: () {
                        _query.deleteACategory(snapshot.data.length);
                        setState(() {});
                      })
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

// ListView.builder(
//                 padding: const EdgeInsets.all(10.0),
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (context, i) {
//                   return _buildRow(snapshot.data[i]);
//                 },
//               )
  Widget _buildRow(Category category) {
    var id = category.categoryId;
    return new ListTile(
        title: new Text(category.categoryName, style: _biggerFont),
        subtitle: new Text(category.categoryId.toString(), style: _biggerFont),
        trailing: new RaisedButton(
            elevation: 3,
            child: Text("Add new "),
            onPressed: () {
              _query.insertNewCategory(id + 1);
              setState(() {});
            }));
  }
}
