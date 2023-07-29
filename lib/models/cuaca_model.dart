import 'package:shamo/models/temp_model.dart';
import 'package:shamo/models/weather_model.dart';

class CuacaModel {
  late int dt;
  late TempModel temp;
  late List<WeatherModel> weather;

  CuacaModel({required this.dt, required this.temp, required this.weather});

  CuacaModel.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = TempModel.fromJson(json['temp']);
    weather = json['weather']
        .map<WeatherModel>((weather) => WeatherModel.fromJson(weather))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'dt': dt,
      'temp': temp.toJson(),
      'weather': weather.map((weather) => weather.toJson()).toList()
    };
  }
}
