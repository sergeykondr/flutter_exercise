import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      theme: ThemeData(primaryColor: Colors.indigoAccent[200]),
      home: Scaffold(
        backgroundColor: Colors.indigoAccent[100],
        appBar: AppBar(
          title: Text('Counter'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(110),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Tap "-" to decrement',
                  style: TextStyle(color: Colors.white),
                ),
                CounterWidget(),
                Text(
                  'Tap "+" to encrement',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 50;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    _count--;
                  });
                },
              ),
            ),
            Container(
              child: Text(
                '$_count',
                style: TextStyle(fontSize: 22),
              ),
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    _count++;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
