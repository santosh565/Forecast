import 'package:flutter/material.dart';
import 'package:weather_forecast/network/network.dart';

import 'model/weather_forecast_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName = 'Lisbon';

  @override
  void initState() {
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);
   forecastObject.then((value) => print(value.list[0].weather[0].main));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forecast'),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text('hello'),
          ),
        ),
      ),
    );
  }
}
