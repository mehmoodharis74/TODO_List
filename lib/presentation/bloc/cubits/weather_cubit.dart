import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/domain/entities/weather_request_entitiy.dart';
import 'package:todo_list/domain/usecases/getweather_usecase.dart';
import 'package:todo_list/presentation/bloc/state/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherCubit(this.getWeatherUseCase) : super(WeatherState.idle());

  void fetchWeather(String city) async {
    emit(WeatherState.loading());
    final request = WeatherRequestEntity(city: city);
    final result = await getWeatherUseCase.getWeather(request);

    result.fold(
      (failure) => emit(WeatherState.failure(failure.message)),
      (weather) => emit(WeatherState.success(weather)),
    );
  }
}