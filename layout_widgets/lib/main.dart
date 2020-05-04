import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Компоновка виджетов"),
        centerTitle: true,
      ),
      body: Padding(
        //padding: EdgeInsets.all(35),
        padding: EdgeInsets.only(left: 50, top: 40),
        child: Text(
          'Hello Flutter!',
          style: TextStyle(fontSize: 32),
        ),
      ),
    ));
  }
}
