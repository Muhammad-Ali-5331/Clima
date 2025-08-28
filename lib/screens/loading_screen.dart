import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLoc();
  }

  void getLoc() async {
    Location userLocation = Location();
    await userLocation.getLocation();
    if (userLocation.loc) {
      print(
        'User longitude: ' + userLocation.getLongitude().toStringAsFixed(2),
      );
      print('User latitude: ' + userLocation.getLatitude().toStringAsFixed(2));
    } else {
      print(userLocation.msg);
      print(userLocation.loc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
