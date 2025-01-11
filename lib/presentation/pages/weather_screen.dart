import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/state/api_state.dart';
import 'package:todo_list/presentation/bloc/cubits/weather_cubit.dart';
import 'package:todo_list/presentation/bloc/state/weather_state.dart';
import 'package:todo_list/presentation/widgets/weather_card.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().fetchWeather('Islamabad,pk');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        switch (state.state) {
          case ApiState.loading:
            return const Center(child: CircularProgressIndicator());
          case ApiState.success:
            return WeatherCard(weather: state.weather!);
          case ApiState.failure:
            return Center(
              child: Text(
                'Error: ${state.errorMessage}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          case ApiState.idle:
          default:
            return const Center(child: Text('Fetching weather data...'));
        }
      },
    );
  }
}