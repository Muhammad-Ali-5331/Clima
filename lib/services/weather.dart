import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  Future<dynamic> getLocationByCityName(cityName) async {
    Location userLocation = Location();
    NetworkHelper apiCall = NetworkHelper(userLocation);
    await apiCall.fetchDataByCityName(cityName);
    return apiCall.Data;
  }

  Future<dynamic> getLocationByCords() async {
    Location userLocation = Location();
    await userLocation.getLocation();
    NetworkHelper apiCall = NetworkHelper(userLocation);
    await apiCall.fetchDataByCords();
    return apiCall.Data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return "It's 🍦 time";
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
