import 'package:flutter/material.dart';
import 'package:lecture_04/models/weather.dart';

class WeatherContainer extends StatelessWidget {

  const WeatherContainer({Key key, @required this.weather}): 
    assert(weather != null),
    super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '${weather.locationName} - ${weather.temperature.toStringAsFixed(0)} °C',
           style: Theme.of(context).textTheme.display1,
           textAlign: TextAlign.center,
        ),
        Image.network(weather.iconUrl),
      ],
    );
  }

}