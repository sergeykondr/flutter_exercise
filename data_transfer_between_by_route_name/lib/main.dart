import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: FirstHome(), routes: {
      '/first': (context) => FirstHome(), // 1 !!!
      '/second': (context) => SecondHome(),
    }),
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
            User user = User(name: 'Sergey', age: 30);
            Navigator.pushNamed(context, '/second', arguments: user); // 2 !!!
          },
          child: Text('Second Home'),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  User user; // 3 !!!

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings; // 3 !!!
    user = settings.arguments;
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
