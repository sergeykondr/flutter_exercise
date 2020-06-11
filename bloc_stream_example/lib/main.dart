import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
    
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc with Stream'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedContainer(
          height: 100,
          width: 100,
          color: Colors.red,
          duration:  Duration(milliseconds: 500),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: (){}
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: (){}
          ),
          
        ],
      ),
    );
  }
}