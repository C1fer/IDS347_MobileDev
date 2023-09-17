import 'dart:convert';
import 'package:http/http.dart' as http;

class Weather{

  final url;
  Weather(this.url);

  Future getWeather() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200){
      var weatherData = jsonDecode(response.body);
      return weatherData;
    }
    else{
      print(response.statusCode);
    }
  }
}