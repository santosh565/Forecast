import 'dart:convert';

import 'package:weather_forecast/util/weather_forecast_util.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:http/http.dart';


class Network{
 Future<WeatherForecastModel> getWeatherForecast({String cityName}) async {
    var finalUrl = 'https://api.openweathermap.org/data/2.5/forecast/daily?q=$cityName&appid=${Util.appId}&units=metric';

    final response = await get(Uri.encodeFull(finalUrl));

    if (response.statusCode==200) {
      print(response.body);
      return WeatherForecastModel.fromJson(jsonDecode(response.body));
      
    } else {
      throw Exception('error');
    }
  }

  
  
}