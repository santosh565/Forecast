import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/ui/forecast_card.dart';

Widget bottomView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var jsonData = snapshot.data.list;
  return (Container(
    child: Column(
      children: <Widget>[
        Text(
          '7-day weather forecast'.toUpperCase(),
          style: TextStyle(color: Colors.black87, fontSize: 15),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            height: 170,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemCount: jsonData.length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.19,
                  height: 160,
                  child: forecastCard(snapshot, index),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                       Colors.cyan,
                        Colors.white,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  ));
}
