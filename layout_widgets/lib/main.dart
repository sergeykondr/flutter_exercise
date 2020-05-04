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
        body: Stack(
          //alignment: Alignment.center,
          children: <Widget>[
            Icon(Icons.airplay, size: 300, color: Colors.purple),
            Positioned(
              top: 65,
              left: 50,
              child: Text(
                'TV',
                style: TextStyle(fontSize: 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}
