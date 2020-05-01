import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text('My First App'),
          centerTitle: true,
        ),
        body: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Center(
                  child: Text(
                    'My 1',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Text(
                    'My 2',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Text(
                    'My 3',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
