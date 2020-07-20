import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var cityName = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  return Container(
    child: Padding(
      padding:  EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "$cityName, $country",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
  );
}
