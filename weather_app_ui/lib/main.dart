import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather Forecast',
            style: TextStyle(),
          ),
          bottomOpacity: 0.1,
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return Container(
    padding: EdgeInsets.all(10),
    color: Colors.red,
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.search, color: Colors.white),
            SizedBox(width: 20),
            Text('Enter City Name', style: TextStyle(color: Colors.white))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 35, 0, 5),
                  child: Center(
                    child: Text(
                      'St. Petersburg, RU',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      'Friday, Mar 20, 2020',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.wb_sunny, color: Colors.white, size: 75),
                      SizedBox(width: 25),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '14 °F',
                            style: TextStyle(fontSize: 50, color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Text(
                              'LIGHT SNOW',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 55),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(Icons.ac_unit, color: Colors.white, size: 32),
                          Text(
                            '5',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            'km/hr',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(width: 85),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.ac_unit,
                            color: Colors.white,
                            size: 32,
                          ),
                          Text(
                            '3',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text('%', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      SizedBox(width: 85),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.ac_unit,
                            color: Colors.white,
                            size: 32,
                          ),
                          Text(
                            '20',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            '%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    '7-DAY WEATHER FORECAST',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _week('Friday', 6),
              _week('Saturday', 5),
              _week('Sunday', 22),
              _week('Monday', 18),
              _week('Thuesday', 20),
              _week('Wednesday', 23),
              _week('Thursday', 19)
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _week(String day, int temperature) {
  double widthWeek = 150;

  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Container(
      width: widthWeek,
      color: Colors.red[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(day, style: TextStyle(fontSize: 24, color: Colors.white)),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    '$temperature °F',
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.wb_sunny,
                    color: Colors.white,
                    size: 40,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
