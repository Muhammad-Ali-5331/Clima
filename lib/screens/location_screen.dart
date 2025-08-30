import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  var apiCallData;
  LocationScreen({required this.apiCallData});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();

  var condition;
  var temperature;
  var cityName;
  var weatherIcon;
  var weatherMessage;
  @override
  void initState() {
    super.initState();

    var weatherData = widget.apiCallData;
    try {
      condition = weatherData['weather'][0]['id'];
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      cityName = weatherData["name"];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      weatherMessage = '${weatherModel.getMessage(temperature)} in $cityName';
    } catch (e) {
      weatherIcon = 'Error';
      weatherMessage = 'Could not fetch weather updates.';
      temperature = 0;
    }
  }

  updateUI(weatherData) {
    setState(() {
      try {
        condition = weatherData['weather'][0]['id'];
        double temp = weatherData['main']['temp'];
        temperature = temp.toInt();
        cityName = weatherData["name"];
        weatherIcon = weatherModel.getWeatherIcon(condition);
        weatherMessage = '${weatherModel.getMessage(temperature)} in $cityName';
      } catch (e) {
        weatherIcon = 'Error';
        weatherMessage = 'Could not fetch weather updates.';
        temperature = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await WeatherModel()
                          .getLocationByCords();
                      updateUI(weatherData);
                    },
                    child: Icon(Icons.near_me, size: 50.0),
                  ),
                  TextButton(
                    onPressed: () async {
                      var cityName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (cityName != null) {
                        var weatherData = await weatherModel
                            .getLocationByCityName(cityName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(Icons.location_city, size: 50.0),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text('$temperature', style: kTempTextStyle),
                    Text(weatherIcon, style: kConditionTextStyle),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
