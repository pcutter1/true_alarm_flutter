import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  Location({this.latLng, this.address});

  LatLng latLng;
  String address;

  Future<dynamic> getCurrentCoordinates() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          forceAndroidLocationManager: true);
      latLng = LatLng(position.latitude, position.longitude);
    }
    catch (e) {
      print(e);
    }
    return latLng;
  }

}