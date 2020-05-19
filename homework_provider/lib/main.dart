import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ColorChangeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ColorChangeNotifier _state = Provider.of<ColorChangeNotifier>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Provider - Homework',
            style: TextStyle(color: _state._color),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                color: _state._color,
                width: 200,
                height: 200,
              ),
              Switch(
                value: _state._valueChecked,
                onChanged: (isChecked) {
                  _state.rndColor(isChecked);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ColorChangeNotifier extends ChangeNotifier {
  bool _valueChecked = false;
  Color _color = Colors.green;

  void rndColor(isChecked) {
    _valueChecked = isChecked;
    _color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    notifyListeners();
  }
}
