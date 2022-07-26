import 'dart:convert';

CurrentWeather currentWeatherFromJson(String str) =>
    CurrentWeather.fromJson(json.decode(str));

String currentWeatherToJson(CurrentWeather data) => json.encode(data.toJson());

class CurrentWeather {
  CurrentWeather({
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.dt,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  late final List<Weather> weather;
  late final String? base;
  late final Main main;
  late final num visibility;
  late final Wind wind;
  late final num dt;
  late final num timezone;
  late final num id;
  late final String name;
  late final num cod;

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    weather =
        List.from(json['weather']).map((e) => Weather.fromJson(e)).toList();
    base = json['base'];
    main = Main.fromJson(json['main']);
    visibility = json['visibility'];
    wind = Wind.fromJson(json['wind']);
    dt = json['dt'];
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    _data['base'] = base;
    _data['main'] = main.toJson();
    _data['visibility'] = visibility;
    _data['wind'] = wind.toJson();
    _data['dt'] = dt;
    _data['timezone'] = timezone;
    _data['id'] = id;
    _data['name'] = name;
    _data['cod'] = cod;
    return _data;
  }
}

class Weather {
  Weather({
    required this.description,
    required this.icon,
  });
  late final String description;
  late final String icon;

  Weather.fromJson(Map<String?, dynamic> json) {
    description = json['description'];
    icon = json['icon'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['description'] = description;
    _data['icon'] = icon;
    return _data;
  }
}

class Main {
  Main({
    required this.temp,
    required this.pressure,
    required this.humidity,
  });

  late final num temp;
  late final num pressure;
  late final num humidity;


  Main.fromJson(Map<String?, dynamic> json) {
    temp = json['temp'];
    pressure = json['pressure'];
    humidity = json['humidity'];

  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['temp'] = temp;
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;

    return _data;
  }
}

class Wind {
  Wind({
    required this.speed,
  });

  late final num speed;

  Wind.fromJson(Map<String?, dynamic> json) {
    speed = json['speed'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['speed'] = speed;
    return _data;
  }
}

