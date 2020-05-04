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
      body: Align( //Center
        //alignment: Alignment.topCenter,
        //alignment: Alignment(0.5, 0.5),
        alignment: Alignment.center,
        child: Text(
          'Hello Flutter!',
          style: TextStyle(fontSize: 32),
        ),
      ),
    ));
  }
}
