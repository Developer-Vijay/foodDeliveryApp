import 'package:flutter/material.dart';
import 'package:shoppable_ecommerce_app/Database/database_helper.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        FlatButton(
          onPressed: () async {
            int i = await DatabaseHelper.instance
                .insert({DatabaseHelper.columnName: "Sahib"});
            print("The inserted id is $i");
          },
          child: Text("insert"),
        ),
        FlatButton(
          onPressed: () async {
            List<Map<String, dynamic>> queryRows =
                await DatabaseHelper.instance.queryAll();
            print(queryRows);
          },
          child: Text("query"),
        ),
        FlatButton(
          onPressed: () async {
            int updateId = await DatabaseHelper.instance.update({
              DatabaseHelper.columnId: 3,
              DatabaseHelper.columnName: "Shivam",
            });
            print(updateId);
          },
          child: Text("update"),
        ),
        FlatButton(
          onPressed: () async {
            int rowsEffected = await DatabaseHelper.instance.delete(3);
            print(rowsEffected);
          },
          child: Text("delete"),
        ),
      ],
    ));
  }
}
