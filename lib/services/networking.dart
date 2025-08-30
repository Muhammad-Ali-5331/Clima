import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String api_key = '';

class NetworkHelper {
  Location userLocationObject;
  var Data;
  late http.Response response;
  NetworkHelper(this.userLocationObject);

  Future<void> fetchDataByCityName(cityName) async {
    response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$api_key&units=metric',
      ),
    );
    Data = jsonDecode(response.body);
  }

  Future<void> fetchDataByCords() async {
    double latitude = userLocationObject.getLatitude();
    double longitude = userLocationObject.getLongitude();
    response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api_key&units=metric',
      ),
    );
    Data = jsonDecode(response.body);
  }

  dynamic getData() => Data;
}
