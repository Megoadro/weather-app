import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'ac4fc02c0a28426fb73172029222312';
  WeatherServices({required this.dio});
  Future<WeatherModel> getCurrentWeather({required String citName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$citName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessege = e.response?.data['error']['messege'] ??
          'OOPS There was an error, try later';
      throw Exception(errorMessege);
    } catch (e) {
      log(e.toString());
      throw Exception('OOPS There was an error, try later');
    }
  }
}
