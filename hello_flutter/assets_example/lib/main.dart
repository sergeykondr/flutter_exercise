import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'ConcertOne',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Adding Assets'),
        ),
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/bg.jpg'),
              ),
              Image.asset('assets/icons/icon.png'),
              Positioned(
                top: 570,
                left: 110,
                child: Text(
                  'My custom font',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 42,
                    //fontFamily: 'ConcertOne'
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
