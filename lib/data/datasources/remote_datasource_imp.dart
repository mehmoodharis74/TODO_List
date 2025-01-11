import 'package:dartz/dartz.dart';
import 'package:todo_list/core/constants/Constants.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/data/mappers/mapper.dart';
import 'package:todo_list/data/models/weather_response_model.dart';
import 'package:todo_list/domain/api_client.dart';
import 'package:todo_list/domain/datasources/datasource.dart';
import 'package:todo_list/domain/entities/weather_request_entitiy.dart';
import 'package:todo_list/domain/entities/weather_response_entity.dart';

import 'dart:convert';


class RemoteDatasourceImp implements Datasource {
  final APIClient httpClient;

  RemoteDatasourceImp(this.httpClient);

  @override
  Future<Either<Failure, WeatherResponseEntity>> getWeather(WeatherRequestEntity request) async {
    //final requestModel = Mapper.toRequestModel(request);
    final city = request.city; // Get the city from the request entity
    const apiKey = Constants.weatherAPIKey;
    //final apiKey = dotenv.env["weather_api_key"]; // Replace with your actual API key
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city,pk&appid=$apiKey';


    try {
      final response = await httpClient.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final weatherModel = WeatherResponseModel.fromJson(jsonData);
        return Right(Mapper.toResponseEntity(weatherModel));
      } else {
        return Left(ServerFailure('Failed to fetch weather data'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}


