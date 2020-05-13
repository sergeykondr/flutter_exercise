import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var date = DateTime.parse("1988-09-06 12:18:04Z");
    var dt = DateFormat.EEEE().format(date);
    print(dt);
    print(new DateFormat.yMMMd().format(new DateTime.now()));

    var rawDate = DateTime(1485789600);
    var dateFormat = DateFormat('EEEE');
    print(dateFormat.format(rawDate));

    return MaterialApp(
      title: 'Dependencies',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dependencies & Package'),
          centerTitle: true,
        ),
      ),
    );
  }
}