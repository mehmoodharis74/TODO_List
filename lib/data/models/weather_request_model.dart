import 'package:todo_list/domain/entities/weather_request_entitiy.dart';

class WeatherRequestModel {
  final String city;

  WeatherRequestModel({required this.city});

  Map<String, dynamic> toJson() {
    return {'city': city};
  }

  static WeatherRequestModel fromEntity(WeatherRequestEntity entity) {
    return WeatherRequestModel(city: entity.city);
  }
}
