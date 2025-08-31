import 'package:clima/services/location.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Location userLocationObject;
  var Data;
  late http.Response response;
  NetworkHelper(this.userLocationObject);

  Future<void> fetchDataByCityName(cityName) async {
    String cityDataUrl = dotenv.env['CITY_DATA_URL']!
        .replaceAll('{CITY}', cityName)
        .replaceAll('{API}', dotenv.env['API_KEY'].toString());
    response = await http.get(Uri.parse(cityDataUrl));
    Data = jsonDecode(response.body);
    print(dotenv.env['API_KEY'].toString());
  }

  Future<void> fetchDataByCords() async {
    double latitude = userLocationObject.getLatitude();
    double longitude = userLocationObject.getLongitude();
    String cordsDataUrl = dotenv.env['CORDS_DATA_URL']!
        .replaceAll("{LAT}", latitude.toString())
        .replaceAll("{LONG}", longitude.toString())
        .replaceAll("{API}", dotenv.env['API_KEY']!);
    response = await http.get(Uri.parse(cordsDataUrl));
    Data = jsonDecode(response.body);
    print(dotenv.env['API_KEY'].toString());
  }

  dynamic getData() => Data;
}
