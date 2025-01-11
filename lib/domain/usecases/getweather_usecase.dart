
import 'package:dartz/dartz.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/domain/entities/weather_request_entitiy.dart';
import 'package:todo_list/domain/entities/weather_response_entity.dart';
import 'package:todo_list/domain/repositories/weather_repo.dart';

class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<Either<Failure, WeatherResponseEntity>> getWeather(WeatherRequestEntity request) {
    return repository.getWeather(request);
  }
}
