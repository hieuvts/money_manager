import 'package:flutter/cupertino.dart';
import 'package:money_manager/core/databaseQuery.dart';
import 'package:money_manager/core/databaseModels.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SettingPageState();
  }
}

class SettingPageState extends State<SettingPage> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  var addCategoryTextController = new TextEditingController();
  QueryMMCategory _query = new QueryMMCategory();
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RaisedButton(
                          elevation: 3,
                          child: Text("Add new "),
                          onPressed: () {
                            _query.insertNewCategory(snapshot.data.length + 1,
                                addCategoryTextController.text);
                            setState(() {});
                          }),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            autofocus: false,
                            decoration: InputDecoration(
                                hintText: "Enter new category",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 22,
                                )),
                            controller: addCategoryTextController,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RaisedButton(
                          child: Text('Delete Row ${snapshot.data.length}'),
                          onPressed: () {
                            _query.deleteACategory(snapshot.data.length);
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                          child: Text('Update Row ${snapshot.data.length}'),
                          onPressed: () {
                            _query.updateACategory(snapshot.data.length,
                                addCategoryTextController.text);
                            setState(() {});
                          }),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            autofocus: false,
                            decoration: InputDecoration(
                                hintText: "Update category",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 22,
                                )),
                            controller: addCategoryTextController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget _buildRow(MMCategory category) {
    var id = category.categoryId;
    return new ListTile(
      title: new Text(category.categoryName, style: _biggerFont),
      subtitle: new Text(category.categoryId.toString(), style: _biggerFont),
    );
  }
}
