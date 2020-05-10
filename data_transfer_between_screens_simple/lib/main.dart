import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: FirstHome(),
    ),
  );
}

class FirstHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Home'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            User user = User(name: 'Konstantin', age: 34);
            Route route =
                MaterialPageRoute(builder: (context) => SecondHome(user: user));
            Navigator.push(context, route);
          },
          child: Text('Second Home'),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  final User user;
  SecondHome({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.user.name} - ${this.user.age}'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Go back'),),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  User({this.name, this.age});
}
