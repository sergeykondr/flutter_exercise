import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future <void> getCurrentLocation() async {
    try {
      // Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low)
      // .timeout(Duration(seconds: 25));
      // latitude = position.latitude;
      // longitude = position.longitude;
      latitude = 51.509865;
      longitude = -0.118092;

       
    } catch(e) {
      throw 'Something goes wrong: $e';
    }
  }
}