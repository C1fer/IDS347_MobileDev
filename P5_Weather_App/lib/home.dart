import 'dart:convert';

import 'package:flutter/material.dart';
import 'design.dart';
import 'city_selection.dart';
import 'weather.dart';
import 'weather_message.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.weatherData});
  var weatherData;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  var temp;
  var condition;
  var conditionIcon;
  var cityName;
  var countryCode;

  void setData(dct) {
    temp = '${dct["main"]["temp"].round()}';
    condition = dct["weather"][0]["main"].toString();
    conditionIcon = dct["weather"][0]["icon"];
    cityName = dct["name"].toString();
    countryCode = dct["sys"]["country"].toString();
  }

  void getWeatherByCity() async {
    final cityName =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CitySelection();
    }));

    //Set Open Weather Map API Key
    final url = "https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid={apiKey}&units=metric";
    Weather currWeather = Weather(url);
    var cityWeather = await currWeather.getWeather();
    setState(() {
      setData(cityWeather);
    });
  }

  @override
  void initState() {
    setData(widget.weatherData);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/app_bg.jpg'), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.near_me,
                      color: Colors.white70,
                      size: 45.0,
                    ),
                  ),
                  Text(
                    'Weather App',
                    style: kHeaderTextStyle,
                  ),
                  TextButton(
                    onPressed: () async {
                      getWeatherByCity();
                    },
                    child: Icon(
                      Icons.location_city,
                      color: Colors.white70,
                      size: 45.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 200,
                height: 200,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${cityName}, ${countryCode}',
                    style: kCityTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/condition_icons/${conditionIcon}@2x.png'),
                      Column(
                        children: [
                          Text(
                            '${temp}°C',
                            style: kTempTextStyle,
                          ),
                          Text(
                            condition,
                            style: kConditionTextStyle,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              WeatherMessage(int.parse(temp)),
            ],
          ),
        ),
      ),
    );
  }
}
