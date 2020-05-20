import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preference Demo',
      home: SharedPrefereceExample(),
    );
  }
}

class SharedPrefereceExample extends StatefulWidget {
  @override
  _SharedPrefereceExampleState createState() => _SharedPrefereceExampleState();
}

class _SharedPrefereceExampleState extends State<SharedPrefereceExample> {
  SharedPreferences _prefs;

  static const String kNumberPrefKey = 'number_pref';
  static const String kBoolPrefKey = 'bool_pref';

  int _numberPref = 0;
  bool _boolPref = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() => this._prefs = prefs);
      _loadNumberPref();
      _loadBoolPref();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preference Demo'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              TableRow(children: <Widget>[
                Text('Number Preference'),
                Text('${this._numberPref}'),
                RaisedButton(
                  child: Text('Increment (+1)'),
                  onPressed: () => this._setNumberPref(this._numberPref + 1),
                ),
              ]),
              TableRow(children: <Widget>[
                Text('Boolean Preference'),
                Text('${this._boolPref}'),
                RaisedButton(
                  child: Text('Toogle'),
                  onPressed: () => this._setBoolPref(!this._boolPref),
                ),
              ]),
            ],
          ),
          RaisedButton(
            child: Text('Reset Data'),
            onPressed: () => this._resetDataPref(),
          ),
        ],
      ),
    );
  }

  //sharedpreferences - https://pub.dev/documentation/shared_preferences/latest/shared_preferences/SharedPreferences-class.html
  //Записать данные. Метод возвращает объект Future c типом Null. метод является асинхронным
  Future<Null> _setNumberPref(int value) async {
    await this._prefs.setInt(kNumberPrefKey, value);
    _loadNumberPref();
  }

  //Записать данные для bool отдельный метод
  Future<Null> _setBoolPref(bool value) async {
    await this._prefs.setBool(kBoolPrefKey, value);
    _loadBoolPref();
  }

//Получить данные. int
  void _loadNumberPref() {
    setState(() {
      this._numberPref = this._prefs.getInt(kNumberPrefKey) ?? 0;
    });
  }

//Получить данные.
  void _loadBoolPref() {
    setState(() {
      this._boolPref = this._prefs.getBool(kBoolPrefKey) ?? false;
    });
  }

  Future<Null> _resetDataPref() async {
    await this._prefs.remove(kNumberPrefKey);
    await this._prefs.remove(kBoolPrefKey);
    _loadNumberPref();
    _loadBoolPref();
  }
}
