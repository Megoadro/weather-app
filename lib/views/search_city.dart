
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchCity extends StatelessWidget {
  const SearchCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
            var getWeatherCubit=   BlocProvider.of<GetWeatherCubit>(context);
            getWeatherCubit.getWeatherInfo(citName: value);
            Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                label: Text('Search'),
                hintText: 'Enter city Name',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.orange,
                ))),
          ),
        ),
      ),
    );
  }
}

