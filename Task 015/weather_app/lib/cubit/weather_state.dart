import '../Models/weather_model.dart';
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSuccess(this.weatherModel);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}