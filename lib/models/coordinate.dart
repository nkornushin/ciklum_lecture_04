class Coordinate {

  Coordinate({double lat, double lon}) : _lat = lat, _lon = lon;

  final double _lat;
  final double _lon;

  double get lat => _lat;
  double get lon => _lon;
}