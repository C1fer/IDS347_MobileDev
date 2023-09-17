import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/home.dart';
import 'location.dart';
import 'weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getData() async {
    // Get current device location
    Location position = Location();
    await position.getCurrentProsition();

    //Set Open Weather Map API Key
    final url = 'https://api.openweathermap.org/data/2.5/weather?lat=${position.lat}&lon=${position.lon}&appid={apiKey}&units=metric';

    // Get weather from device location
    Weather currWeather = Weather(url);
    var weatherData = await currWeather.getWeather();

    //Send weather data to home screen
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Home(weatherData: weatherData);
    }));

    // Call method recursively on Navigator pop
    getData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
