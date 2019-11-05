import 'package:flutter/material.dart';
import 'package:lecture_04/models/coordinate.dart';
import 'package:lecture_04/models/weather.dart';
import 'package:lecture_04/providers/weather_provider.dart';
import 'package:lecture_04/widgets/weather_container.dart';

class WeatherOverview extends StatelessWidget {
  final _weatherProvider = WeatherProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Overview'),
      ),
      body: Center(
        child: FutureBuilder<List<Weather>>(
          //future: _weatherProvider.getCurrentWeather('Gelendzhik'),
          future: _weatherProvider.getCurrentWeatherInCircle(Coordinate(lat: 49.98081, lon: 36.25272)),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return WeatherContainer(cities: snapshot.data, weather: snapshot.data[0],);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
