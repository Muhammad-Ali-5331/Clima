import 'dart:ffi';

import 'package:geolocator/geolocator.dart';

class Location {
  bool loc = false;
  String msg = "👉 getLocation called";

  double _longitude = 0.0;
  double _latitude = 0.0;

  final LocationSettings _locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  Future<Null> getLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled().timeout(
        Duration(seconds: 5),
        onTimeout: () {
          msg = "⏱️ Timeout waiting for isLocationServiceEnabled";
          return false;
        },
      );
      // print("Location Service enabled: $serviceEnabled");

      if (!serviceEnabled) {
        msg = "❌ Location services are disabled.";
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      // print("Permission before: $permission");

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        // print("Permission after request: $permission");
        if (permission == LocationPermission.denied) {
          msg = '❌ Location permissions are denied';
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        msg = '❌ Location permissions are permanently denied';
        await Geolocator.openAppSettings();
        return;
      }

      // print("✅ Permissions OK, getting position...");
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: _locationSettings,
      );
      msg = '✅ Got location';
      loc = true;
      _longitude = position.longitude;
      _latitude = position.latitude;
    } catch (e) {
      msg = "⚠️ Error in getLocation: $e";
    }
  }

  double getLatitude() => _latitude;
  double getLongitude() => _longitude;
}
