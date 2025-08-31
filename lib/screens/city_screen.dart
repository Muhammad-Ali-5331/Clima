import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus(); // closes keyboard
                    // wait a short delay (200–300 ms is usually enough for keyboard closing)
                    await Future.delayed(Duration(milliseconds: 300));
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (val) => cityName = val,
                  style: TextStyle(color: Colors.black),
                  decoration: kTextFieldStyle,
                ),
              ),
              TextButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus(); // closes keyboard
                  // wait a short delay (200–300 ms is usually enough for keyboard closing)
                  await Future.delayed(Duration(milliseconds: 300));

                  Navigator.pop(context, cityName);
                },
                child: Text('Get Weather', style: kButtonTextStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
