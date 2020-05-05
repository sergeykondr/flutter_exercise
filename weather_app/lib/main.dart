import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather', style: TextStyle(color: Colors.black87)),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          iconTheme: IconThemeData(color: Colors.black54),
          brightness: Brightness.light,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            )
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _weatherDescription(),
                Divider(),
                _temperature(),
                Divider(),
                _temperatureForecast(),
                Divider(),
                _footerRating(),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget _headerImage() {
  return Image(
      image: NetworkImage(
          'https://storge.pic2.me/c/1360x800/292/5c63dfb7313ed.jpg'),
      fit: BoxFit.cover);
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        'Tuesday - May 22',
        style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      ),
      Divider(),
      Text(
        'Lorem das fasd fads fads fads fd jb mkjjhs kjhklhwe fiwuher fqkwheqk fklqhw rkhew ew eqlwrhek  wrhelqhwre qrqwkrqkjhfaosihef qauiwflkjhasvfkqnjw hfinkasf qw.',
        style: TextStyle(color: Colors.black54),
      ),
    ],
  );
}

Row _temperature() {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.wb_sunny,
          color: Colors.yellow,
        ),
      ],
    ),
    SizedBox(width: 16.0),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              '15 Clear',
              style: TextStyle(color: Colors.deepPurple),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              'St Petersburg',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    )
  ]);
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10.0,
    children: List.generate(7, (int index) {
      return Chip(
        label: Text(
          '${index + 20} C',
          style: TextStyle(fontSize: 15.0),
        ),
        avatar: Icon(Icons.wb_cloudy, color: Colors.blue.shade300),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.grey.shade100,
      );
    }),
  );
}

Row _footerRating() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(Icons.star, size: 15.0,color: Colors.yellow[600]),
      Icon(Icons.star, size: 15.0,color: Colors.yellow[600]),
      Icon(Icons.star, size: 15.0,color: Colors.black12),
      Icon(Icons.star, size: 15.0,color: Colors.black12),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text('Info with openweathermap.org', style: TextStyle(fontSize: 15.0)),
      stars,
    ],
  );
}
