import 'package:dartz/dartz.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/domain/entities/weather_request_entitiy.dart';
import 'package:todo_list/domain/entities/weather_response_entity.dart';

abstract class Datasource {
  Future<Either<Failure, WeatherResponseEntity>> getWeather(WeatherRequestEntity request);
}