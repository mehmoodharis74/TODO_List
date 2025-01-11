import 'package:todo_list/domain/entities/weather_response_entity.dart';

class WeatherResponseModel {
  final String cityName;
  final double temperature;
  final String weatherMain;
  final String weatherDescription;
  final String weatherIcon;
  final double humidity;
  final double windSpeed;
  final double chanceOfRain;

  WeatherResponseModel({
    required this.cityName,
    required this.temperature,
    required this.weatherMain,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.humidity,
    required this.windSpeed,
    required this.chanceOfRain,
  });

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) {
    return WeatherResponseModel(
      cityName: json['name'] ?? '',
      temperature: (json['main']['temp'] ?? 0.0).toDouble(),
      weatherMain: json['weather'][0]['main'] ?? '',
      weatherDescription: json['weather'][0]['description'] ?? '',
      weatherIcon: json['weather'][0]['icon'] ?? '',
      humidity: (json['main']['humidity'] ?? 0.0).toDouble(),
      windSpeed: (json['wind']['speed'] ?? 0.0).toDouble(),
      chanceOfRain: (json['clouds']['all'] ?? 0.0).toDouble(),
    );
  }

  WeatherResponseEntity toEntity() {
    return WeatherResponseEntity(
      cityName: cityName,
      temperature: temperature,
      weatherMain: weatherMain,
      weatherDescription: weatherDescription,
      weatherIcon: weatherIcon,
      humidity: humidity,
      windSpeed: windSpeed,
      chanceOfRain: chanceOfRain,
    );
  }
}
