import 'package:flutter/material.dart';
import 'package:weather_forecast/network/network.dart';
import 'package:weather_forecast/ui/mid_view.dart';

import 'model/weather_forecast_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName = 'Kathmandu';

  @override
  void initState() {
    super.initState();
    forecastObject = getWeather(cityName: _cityName);
/*    forecastObject.then((value) => print(value.list[0].weather[0].main));
 */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            textFieldView(),
            FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (BuildContext context,
                  AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (snapshot.hasData) {
                  return midView(snapshot);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Enter City Name',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(8),
          ),
          onSubmitted: (value) {
            _cityName = value;
            setState(() {
              forecastObject = getWeather(cityName: _cityName);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({String cityName}) =>
      Network().getWeatherForecast(cityName: _cityName);
}
