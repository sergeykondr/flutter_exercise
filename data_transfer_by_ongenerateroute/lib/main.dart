import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: FirstHome(),
      onGenerateRoute: (settings) {
        // 1 !!!
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => FirstHome());
            break;

          case '/second':
            User user = settings.arguments;
            return MaterialPageRoute(
                builder: (context) => SecondHome(user: user));
        }
      },
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
            User user = User(name: 'Alex', age: 25);
            Navigator.pushNamed(context, '/second', arguments: user); // 2 !!!
          },
          child: Text('Second Home'),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  final User user; // 3 !!!
  SecondHome({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.user.name} - ${this.user.age}'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back'),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  User({this.name, this.age});
}
