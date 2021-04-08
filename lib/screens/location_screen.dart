import 'package:clima_app/screens/city_screen.dart';
import 'package:clima_app/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  dynamic temperature;
  dynamic weatherIcon;
  dynamic cityName;

  dynamic message;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = "Error";
        message = "Unable to get weather data";
        cityName = '';
        return;
      }
      dynamic temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      message = weather.getMessage(temperature);

      dynamic condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);

      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: Text(
                  cityName,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  margin:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 80),
                  decoration: BoxDecoration(
                    color: Color(0xff427bfe),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "$weatherIcon",
                        style: kConditionTextStyle,
                      ),
                      Text(
                        "$temperature°",
                        style: kTempTextStyle,
                      ),
                      Text(
                        "$message°",
                        style: kMessageTextStyle,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
