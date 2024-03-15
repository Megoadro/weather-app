import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  // GetWeatherCubit(super.initialState);
  GetWeatherCubit() : super(WeatherInitialState());
   WeatherModel? weatherModel;
  getWeatherInfo({required String citName}) async {
    try {
    weatherModel =
          await WeatherServices(dio: Dio()).getCurrentWeather(citName: citName);
      //emit(LoadedWeatherState());
            emit(LoadedWeatherState(weatherModel: weatherModel!));

    } catch (e) {
      emit(FaliarWeatherState());
    }
  }
}
