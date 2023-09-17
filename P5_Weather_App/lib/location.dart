import 'package:geolocator/geolocator.dart';

class Location {
  var lat;
  var lon;

  Future<void> getCurrentProsition() async {
    try {
      LocationPermission locPerm = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat = position.latitude;
      lon = position.longitude;
      print('Lat: ${position.latitude}, Lon: ${position.longitude}');
    } catch (err) {
      print(err);
    }
  }
}
