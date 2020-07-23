import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/util/weather_forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var jsonData = snapshot.data;
  var cityName = jsonData.city.name;
  var country = jsonData.city.country;
  int unixTimeStamp = jsonData.list[0].dt;

  return Container(
    child: Padding(
      padding: EdgeInsets.all(14.0),
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
          Text(
            '${Util.getFormattedDate(DateTime.fromMillisecondsSinceEpoch(unixTimeStamp * 1000))}',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 10),
          Icon(
            FontAwesomeIcons.cloud,
            size: 150,
            color: Colors.pink,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${jsonData.list[0].temp.day.toStringAsFixed(0)}°C ',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  '${jsonData.list[0].weather[0].description.toUpperCase()}',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text('${jsonData.list[0].speed.toStringAsFixed(1)} km/h'),
                    Icon(FontAwesomeIcons.wind,size: 20,color: Colors.brown,),
                    
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text('${jsonData.list[0].humidity.toStringAsFixed(0)} %'),
                    Icon(FontAwesomeIcons.solidGrinBeamSweat,size: 20,color: Colors.brown,),
                    
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text('${jsonData.list[0].temp.max.toStringAsFixed(0)}°C'),
                      Icon(FontAwesomeIcons.temperatureHigh,size: 20,color: Colors.brown,),
                      
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
