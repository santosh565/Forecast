import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/util/weather_forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var cityName = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  int unixTimeStamp = snapshot.data.list[0].dt;
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
          Text('${Util.getFormattedDate(DateTime.fromMillisecondsSinceEpoch(unixTimeStamp*1000),)}'),
        ],
      ),
    ),
  );
}
