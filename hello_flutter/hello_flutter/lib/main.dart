import 'package:flutter/material.dart';

void main() {
  runApp(Center(
      child: Text(
    'Hello flutter! My first!',
    textDirection: TextDirection.ltr,
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.blue
    ),
  )));
}