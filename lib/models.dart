/*
{
  "coord": {
    "lon": -122.08,
    "lat": 37.39
  },
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 282.55,
    "feels_like": 281.86,
    "temp_min": 280.37,
    "temp_max": 284.26,
    "pressure": 1023,
    "humidity": 100
  },
  "visibility": 10000,
  "wind": {
    "speed": 1.5,
    "deg": 350
  },
  "clouds": {
    "all": 1
  },
  "dt": 1560350645,
  "sys": {
    "type": 1,
    "id": 5122,
    "message": 0.0139,
    "country": "US",
    "sunrise": 1560343627,
    "sunset": 1560396563
  },
  "timezone": -25200,
  "id": 420006353,
  "name": "Mountain View",
  "cod": 200
  }
 */
class WeatherResponse {
  final String city;
  final TemperatureInfo temperatureInfo;
  final WeatherInfo weatherInfo;

  WeatherResponse({required this.city, required this.temperatureInfo,required this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      city: json['name'],
      temperatureInfo: TemperatureInfo.fromJson(json['main']),
      weatherInfo: WeatherInfo.fromJson(json['weather'][0]),
    );
  }
}

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    return TemperatureInfo(temperature: json['temp']);
  }
}
class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description,required this.icon});
  factory WeatherInfo.fromJson (Map<String,dynamic> json) {
    return WeatherInfo(
      description: json['description'],
      icon: json['icon'],
    );
  }
}