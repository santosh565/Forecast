import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/util/convert_icon.dart';
import 'package:weather_forecast/util/weather_forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var jsonData = snapshot.data.list;
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(jsonData[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  var dayOfWeek = fullDate.split(',')[0]; // returns day of week

  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 5),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: getWeatherIcon(
                weatherCondition: jsonData[index].weather[0].main,
                size: 45,
                color: Colors.cyan,
              ),
            )
          ],
        ),
      )
    ],
  );
}
