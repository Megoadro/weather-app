class WeatherModel {
  final String citName;
  final DateTime date;
  final String? image;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.citName,
      required this.date,
      required this.image,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(jason) {
    return WeatherModel(
      citName: jason['location']['name'],
      date: DateTime.parse(jason['current']['last_updated']),
      image: jason['forecast']['forecastday'][0]['day']['condition']['icon'],
      avgTemp: jason['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: jason['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: jason['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: jason['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
