/*
{
  "base": "stations",
  "visibility": 10000,
  "dt": 1560350645,
  "timezone": -25200,
  "id": 420006353,
  "name": "Mountain View",
  "cod": 200
  }
 */
class WeatherResponse {
  final Coord coord;
  final Weather weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final double? dt;
  final SYS sys;
  final double? timezone;
  final double? id;
  final String name;
  final double? cod;

  WeatherResponse({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      coord: Coord.fromJson(json['coord']),
      weather: Weather.fromJson(json['weather'][0]),
      base: json['base'],
      main: Main.fromJson(json['main']),
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind']),
      clouds: Clouds.fromJson(json['clouds']),
      dt: json['dt'],
      sys: SYS.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}

/*
"coord": {
    "lon": -122.08,
    "lat": 37.39
  },
*/
class Coord {
  final double? lon;
  final double? lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}

/*
"sys": {
    "type": 1,
    "id": 5122,
    "message": 0.0139,
    "country": "US",
    "sunrise": 1560343627,
    "sunset": 1560396563
  },
 */
class SYS {
  final int type;
  final double? id;
  final double? message;
  final String country;
  final double? sunrise;
  final double? sunset;

  SYS({
    required this.message,
    required this.type,
    required this.country,
    required this.id,
    required this.sunrise,
    required this.sunset,
  });

  factory SYS.fromJson(Map<String, dynamic> json) {
    return SYS(
      type: json['type'],
      country: json['country'],
      id: json['id'],
      message: json['message'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

/*
"clouds": {
    "all": 1
  },
 */
class Clouds {
  final int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(all: json['all']);
  }
}

/*
"wind": {
    "speed": 1.5,
    "deg": 350
  },
 */
class Wind {
  final double? speed;
  final double? deg;

  Wind({required this.deg, required this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(deg: json['deg'], speed: json['speed']);
  }
}

/*
"main": {
    "temp": 282.55,
    "feels_like": 281.86,
    "temp_min": 280.37,
    "temp_max": 284.26,
    "pressure": 1023,
    "humidity": 100
  },
 */
class Main {
  final double? temp;
  final double? feels_like;
  final double? temp_min;
  final double? temp_max;
  final double? pressure;
  final double? humidity;

  Main({
    required this.feels_like,
    required this.humidity,
    required this.pressure,
    required this.temp,
    required this.temp_max,
    required this.temp_min,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      feels_like: json['feels_like'],
      humidity: json['humidity'],
      pressure: json['pressure'],
      temp: json['temp'],
      temp_max: json['temp_max'],
      temp_min: json['temp_min'],
    );
  }
}

/*
"weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
 */
class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
