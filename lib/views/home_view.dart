import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/search_city.dart';
import 'package:weather/widgets/no_weather_body.dart';
import 'package:weather/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, }) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchCity();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body:BlocBuilder<GetWeatherCubit,WeatherState>
      (
        builder: (context,state)
        {
          if (state is WeatherInitialState)
          {
            return NoWeatherBody();
          }else if (state is LoadedWeatherState)
          {
            return WeatherInfoBody(weather: state.weatherModel,);
          }else
          {
            return Text('There was an error');
          }
        },
      ),
    );
  }
}
