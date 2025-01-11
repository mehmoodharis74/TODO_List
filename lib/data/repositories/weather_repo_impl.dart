import 'package:dartz/dartz.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/domain/datasources/datasource.dart';
import 'package:todo_list/domain/entities/weather_request_entitiy.dart';
import 'package:todo_list/domain/entities/weather_response_entity.dart';
import 'package:todo_list/domain/repositories/weather_repo.dart';

class WeatherRepoImpl implements WeatherRepository{
  final Datasource datasource;

  WeatherRepoImpl(this.datasource);
  @override
  Future<Either<Failure, WeatherResponseEntity>> getWeather(WeatherRequestEntity request) async {
    final response = await datasource.getWeather(request);
      return response;
  }

}