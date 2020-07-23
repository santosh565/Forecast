

import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/util/weather_forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel>snapshot,int index){
  var jsonData = snapshot.data.list;
  DateTime date = DateTime.fromMillisecondsSinceEpoch(jsonData[index].dt*1000);
  var fullDate = Util.getFormattedDate(date);
  var dayOfWeek = fullDate.split(',')[0];// returns day of week

  return Column(
    children: <Widget>[
      Text(dayOfWeek),
    ],
  );

}