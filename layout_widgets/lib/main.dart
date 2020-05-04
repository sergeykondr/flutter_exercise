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
      body: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(),
        ),
        width: 250,
        height: 150,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(65),
        alignment: Alignment.center ,
        child: Text(
          'Hello Flutter!',
          style: TextStyle(fontSize: 32),
        ),
      ),
    ));
  }
}
