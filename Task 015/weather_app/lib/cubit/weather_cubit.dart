import 'package:flutter_bloc/flutter_bloc.dart';
import '../Models/weather_model.dart';
import '../server/api_helper.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  static WeatherCubit get(context) => BlocProvider.of(context);

  void fetchWeather(String cityName) async {
    emit(WeatherLoading());
    try {
      WeatherModel weatherModel = await ApiHelper().getData(cityName);
      emit(WeatherSuccess(weatherModel));
    } catch (e) {
      emit(WeatherError("Failed to load weather: ${e.toString()}"));
    }
  }
}