class Weather {
  Weather(this._temperature, this._locationName, this._iconUrl);

  Weather.fromJson(Map<String, dynamic> json)
    :_temperature = json['main']['temp'],
     _locationName = json['name'],
     _iconUrl = _generateIconUrl(json['weather'][0]['icon']);


  final double _temperature;
  final String _locationName;
  final String _iconUrl;

  double get temperature => _temperature;
  String get locationName => _locationName;
  String get iconUrl => _iconUrl;  

  static String _generateIconUrl(String icon) {
    return 'https://openweathermap.org/img/wn/$icon@2x.png';
  }
}