import 'package:bloc_example/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(                
        //!!! BlocProvider - виджет,
        //который предоставляет bloc дочерним элементам через  BlocProvider.of<T>(context).
        //может быть предоставлен нескольким виджетам в поддереве.
        create: (context) => ColorBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // при использовании flutter_bloc нам не нужно закрывать потоки(в отличие от bloc) и поэтому мы используем StatelessWidget.
  //Данная библиотека делает это автоматически
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);  //!!!
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC with flutter_bloc'),
        centerTitle: true,
      ),
      body: Center(
        //на вход: блок ColorBloc. на выход Сolor
        child: BlocBuilder<ColorBloc, Color>(
          //!!! переписовка контента в ответ на новые состояния
          // bloc - необязательный параметр. для чего???
          builder: (context, currentColor) => AnimatedContainer(   //currentColor !!!!!
            height: 100,
            width: 100,
            color: currentColor,
            duration: Duration(milliseconds: 500),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              _bloc.add(ColorEvent.event_red);          //!!!
            },
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              _bloc.add(ColorEvent.event_green);          //!!!
            },
          ),
        ],
      ),
    );
  }
}