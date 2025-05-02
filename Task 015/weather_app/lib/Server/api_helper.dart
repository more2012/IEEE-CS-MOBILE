import 'package:dio/dio.dart';
import 'package:weather_app/Models/weather_model.dart';

class ApiHelper {
  Future<WeatherModel> getData(String cityName) async {
    String apikey = 'f92417adebf74911ae6223847231204';
    final response = await Dio().get(
      'http://api.weatherapi.com/v1/forecast.json?key=$apikey&q=$cityName&days=7',
    );
    WeatherModel weatherModel = WeatherModel.fromJsom(response.data);
    return weatherModel;
  }
}
