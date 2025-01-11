import 'package:todo_list/core/state/api_state.dart';
import 'package:todo_list/domain/entities/weather_response_entity.dart';

class WeatherState {
  final ApiState state;
  final WeatherResponseEntity? weather;
  final String? errorMessage;

  WeatherState({required this.state, this.weather, this.errorMessage});

  factory WeatherState.idle() => WeatherState(state: ApiState.idle);
  factory WeatherState.loading() => WeatherState(state: ApiState.loading);
  factory WeatherState.success(WeatherResponseEntity weather) =>
      WeatherState(state: ApiState.success, weather: weather);
  factory WeatherState.failure(String errorMessage) =>
      WeatherState(state: ApiState.failure, errorMessage: errorMessage);
}