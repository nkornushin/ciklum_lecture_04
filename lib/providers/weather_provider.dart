import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lecture_04/models/weather.dart';

class WeatherProvider {

  static const String appId = '1ea55013049215603ece3fee22806975';

  Future<Weather> getCurrentWeather(String cityName) async {
    final dynamic response = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?q='+cityName+'&units=metric&APPID='+appId
    );

    if(response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}