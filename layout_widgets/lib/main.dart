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
        body: Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Image.network('https://avatars.mds.yandex.net/get-pdb/2884572/a0387273-0bea-4d21-a7ca-18b6c22ea727/s1200?webp=false')
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                color: Colors.lightBlueAccent,
                child: Text('1'),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                color: Colors.yellowAccent,
                child: Text('2'),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                color: Colors.redAccent,
                child: Text('3'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
