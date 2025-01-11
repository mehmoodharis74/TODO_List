class WeatherResponseEntity {
  final String cityName;
  final double temperature;
  final String weatherMain;
  final String weatherDescription;
  final String weatherIcon;
  final double humidity;
  final double windSpeed;
  final double chanceOfRain;

  WeatherResponseEntity({
    this.cityName = '',
    this.temperature = 0.0,
    this.weatherMain = '',
    this.weatherDescription = '',
    this.weatherIcon = '',
    this.humidity = 0.0,
    this.windSpeed = 0.0,
    this.chanceOfRain = 0.0,
  });
}
