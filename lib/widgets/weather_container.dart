import 'package:flutter/material.dart';
import 'package:lecture_04/models/weather.dart';

class WeatherContainer extends StatelessWidget {

  const WeatherContainer({Key key, @required this.weather, @required this.cities}): 
    assert(cities != null),
    super(key: key);

  final Weather weather;
  final List<Weather> cities;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return _portraitLayout(context);
        } else {
          return _landscapeLayout(context);
        }
      }
    );
  }

  Widget _landscapeLayout(BuildContext context) {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            _locationTemperatureText(context),
            _locationTemperatureIcon(),
          ],
        ),
        Expanded(
          child: _citiesList(),
        )
      ],
    );
  }

  Widget _portraitLayout(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _locationTemperatureText(context),
              _locationTemperatureIcon(),
            ],
          )
        ),
        Expanded(
          child: _citiesList(),
        )

      ],
    );
  }

  Widget _locationTemperatureText(BuildContext context) {
    return Text(
          '${weather.locationName}: ${weather.temperature.toStringAsFixed(0)} °C',
           style: Theme.of(context).textTheme.display1,
           textAlign: TextAlign.center,
    );
  }

  Widget _locationTemperatureIcon() {
    return Image.network(weather.iconUrl);
  }

  ListView _citiesList() {
    return ListView.builder(
      itemCount: cities.length,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          elevation: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: const Color.fromRGBO(64, 75, 96, .9)),
            child: _cityItem(cities[position]),
          ),
        );
      }
    );
  }

  Widget _cityItem(Weather cityWeather) {
    return ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: const EdgeInsets.only(right: 12.0),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: 1.0, color: Colors.white24)
            )
          ),
          child: Image.network(cityWeather.iconUrl),
        ),
        title: Text(
          cityWeather.locationName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${cityWeather.temperature.toStringAsFixed(0)} °C')
    );
  }
}