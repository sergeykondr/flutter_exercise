import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app_api/api/weather_api.dart';
import 'package:weather_app_api/models/weather.dart';
import 'package:weather_app_api/screens/city_screen.dart';
import 'package:weather_app_api/widgets/bottom_list_view.dart';
import 'package:weather_app_api/widgets/city_view.dart';
import 'package:weather_app_api/widgets/detail_view.dart';
import 'package:weather_app_api/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;
  WeatherForecastScreen({this.locationWeather});

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast> forecastObject;
  String _cityname = 'London';
  //String _cityname;

  @override
  void initState() {
    super.initState();

    if (widget.locationWeather != null) {
      forecastObject = WeatherApi().fetchWeatherForecast();
    }
    //forecastObject = WeatherApi().fetchWeatherForecastWithCity(cityName: _cityname);
    // forecastObject.then((value) {
    //   print(value.list[0].weather[0].main);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('openweathermap'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.location_city),
              onPressed: () async {
                ///!!!
                var tappedName = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return CityScreen();
                }));
                if (tappedName != null) {
                  _cityname = tappedName;
                  setState(() {
                    forecastObject = WeatherApi().fetchWeatherForecast(cityName: _cityname, isCity: true);
                  });
                }
              })
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: FutureBuilder<WeatherForecast>(
                future: forecastObject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        CityView(snapshot: snapshot),
                        SizedBox(
                          height: 50,
                        ),
                        TempView(snapshot: snapshot),
                        SizedBox(
                          height: 50,
                        ),
                        DetailView(snapshot: snapshot),
                        SizedBox(
                          height: 50,
                        ),
                        BottomListView(snapshot: snapshot)
                      ],
                    );
                  } else {
                    return Center(
                        child: SpinKitThreeBounce(
                      color: Colors.black87,
                      size: 100,
                    ));
                  }
                }),
          )
        ],
      ),
    );
  }
}
