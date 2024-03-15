
import 'package:weather/models/weather_model.dart';

class WeatherState{}
class WeatherInitialState extends WeatherState{}
class LoadedWeatherState extends WeatherState {
 final WeatherModel weatherModel;

  LoadedWeatherState({required this.weatherModel});
}
class FaliarWeatherState extends WeatherState{}