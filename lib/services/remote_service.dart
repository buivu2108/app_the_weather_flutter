import 'dart:convert';

import 'package:app_the_weather_flutter/models/FutureWeatherThreeHour.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import '../models/CurrentWeather.dart';

class RemoteService {
  getCurrentWeather(String nameCity) async {
    try {
      var response = await Dio().get(
          'https://api.openweathermap.org/data/2.5/weather?q=$nameCity&appid=220dad74c7a8160adea535d772d08adb&units=metric');
      if (response.statusCode == 200) {
        var data = CurrentWeather.fromJson(response.data);
        return data;
      }
    } catch (e) {
      print(e);
    }
  }
  getFutureWeatherThreeHour(String nameCity) async {
    try {
      var response = await Dio().get(
          'https://api.openweathermap.org/data/2.5/forecast?q=$nameCity&appid=220dad74c7a8160adea535d772d08adb&units=metric');
      if (response.statusCode == 200) {
        var dataThreeHour = FutureWeatherThreeHour.fromJson(response.data);
        return dataThreeHour;
      }
    } catch (e) {
      print(e);
    }
  }
}


