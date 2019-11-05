import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lecture_04/models/coordinate.dart';
import 'package:lecture_04/models/weather.dart';

class WeatherProvider {

  static const String appId = '1ea55013049215603ece3fee22806975';
  static const String units = 'metric';
  static const String url = 'https://api.openweathermap.org/data/2.5/';

  Future<Weather> getCurrentWeather(String cityName) async {
    final dynamic response = await http.get(
      url+'weather?q='+cityName+'&units='+units+'&APPID='+appId
    );

    if(response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<Weather>> getCurrentWeatherInCircle(Coordinate coordinate) async {
    final String apiUrl = url+'find?lat='+coordinate.lat.toString()+'&lon='+coordinate.lon.toString()+'&units='+units+'&APPID='+appId;
    final dynamic response = await http.get(
      apiUrl
    );

    if(response.statusCode == 200) {
      final List<Weather> list = [];
      final Map<String, dynamic> responseBody = json.decode(response.body);
      final List<dynamic> cities = responseBody['list'];
      //cities.forEach((city) => list.add(Weather.fromJson(city)));
      //cities.forEach((dynamic city) => print(city));
      for (var city in cities) {
        list.add(Weather.fromJson(city));
      }

      return list;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}