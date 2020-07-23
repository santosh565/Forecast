import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/util/convert_icon.dart';
import 'package:weather_forecast/util/weather_forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var jsonData = snapshot.data.list;
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(jsonData[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  var dayOfWeek = fullDate.split(',')[0]; // returns day of week
  var weekDate = fullDate.split(',')[1];
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('$dayOfWeek , $weekDate'),
      ),
      Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: getWeatherIcon(
                weatherCondition: jsonData[index].weather[0].main,
                size: 45,
                color: Colors.cyan,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('${jsonData[index].temp.max.toStringAsFixed(0)}°C '),
                  Icon(
                    FontAwesomeIcons.arrowAltCircleUp,
                    size: 20,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(height: 3),
              Row(
                children: <Widget>[
                  Text('${jsonData[index].temp.min.toStringAsFixed(0)}°C '),
                  Icon(
                    FontAwesomeIcons.arrowAltCircleDown,
                    size: 20,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(height: 3),
              Text('Hum:${jsonData[index].humidity}%'),
              SizedBox(height: 3),
              Text('Wind:${jsonData[index].speed.toStringAsFixed(0)}km/h'),
            ],
          ),
        ],
      )
    ],
  );
}
