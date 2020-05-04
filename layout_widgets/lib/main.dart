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
          color: Colors.indigo[100],
        ),
        child: Column( //Row
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.battery_full, size: 50, color: Colors.red),
            Icon(Icons.battery_full, size: 150, color: Colors.green),
            Icon(Icons.battery_full, size: 50, color: Colors.yellow),
            Icon(Icons.battery_full, size: 50, color: Colors.blue),
          ],
        ),
      ),
    ));
  }
}
