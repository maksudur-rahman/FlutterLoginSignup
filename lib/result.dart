import 'package:flutter/material.dart';
import 'package:login_singnup_flutter_app/database/database_helper.dart';
import 'package:login_singnup_flutter_app/models/user.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List<User> items = new List();
  List<User> values;

  User get user => null;
  @override
  Widget build(BuildContext context) {
    Future<List<User>> users = _getData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: Column(
        children: <Widget>[
          Text(users.toString()),

        ]
      )

    );
  }

  Future<List<User>> _getData() async {
    var dbHelper = DatabaseHelper();
    await dbHelper.selectUser(user).then((value) {
      items = values;
    });

    return items;
  }
}
