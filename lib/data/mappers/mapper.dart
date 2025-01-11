import 'package:todo_list/data/models/weather_request_model.dart';
import 'package:todo_list/data/models/weather_response_model.dart';
import 'package:todo_list/domain/entities/weather_request_entitiy.dart';
import 'package:todo_list/domain/entities/weather_response_entity.dart';

class Mapper {
  static WeatherRequestModel toRequestModel(WeatherRequestEntity entity) {
    return WeatherRequestModel.fromEntity(entity);
  }

  static WeatherResponseEntity toResponseEntity(WeatherResponseModel model) {
    return model.toEntity();
  }
}
