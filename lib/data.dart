import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_a/models.dart';

class DataService {
  final String appid = '456aa72a6aa7dd717ad577ea7cad888a';

  Future<WeatherResponse> getWeather(String city) async {
    // - https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    // * http://api.openweathermap.org/geo/1.0/direct?q={city name},{state code},{country code}&limit={limit}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': '456aa72a6aa7dd717ad577ea7cad888a',
      'units' : 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    return WeatherResponse.fromJson(jsonDecode(response.body));
  }
}
