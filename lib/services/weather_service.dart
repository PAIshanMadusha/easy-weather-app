import 'dart:convert';

import 'package:easy_weather_app/models/weather_model.dart';
import 'package:easy_weather_app/services/get_location_service.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherService({required this.apiKey});

  //Get the Weather from the City Name
  Future<WeatherModel> getWeather(String cityName) async {
    try {
      final url = "$baseUrl?q=$cityName&appid=$apiKey&units=metric";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return WeatherModel.formJson(json);
      } else {
        throw Exception("Failed to Load the Weather Data");
      }
    } catch (error) {
      throw Exception("Failed");
    }
  }

  //Get the Weather from the Current Location
  Future<WeatherModel> getWeatherFromLocation() async {
    try {
      final location = GetLocationService();

      final cityName = await location.getCityNameFromCurrentLocation();

      final url = "$baseUrl?q=$cityName&appid=$apiKey&units=metric";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return WeatherModel.formJson(json);
      } else {
        throw Exception("Faild to Load the Weather Data");
      }
    } catch (error) {
      throw Exception("Fail");
    }
  }
}
