import 'package:flutter_naver_map/flutter_naver_map.dart' show LatLng;

class LocationClass extends LatLng {
  final double latitude;
  final double longitude;

  const LocationClass({required this.latitude, required this.longitude})
      : super(latitude, longitude);
}
