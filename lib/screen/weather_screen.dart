import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData});
  final dynamic parseWeatherData;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  late String cityName;
  late double temp;
  late int temp2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upDateData(widget.parseWeatherData);
  }

  void upDateData(dynamic weatherData){
      temp  = weatherData['main']['temp'];
      temp2 = temp.round();
      cityName = weatherData['name'];
      print(temp.round());
      print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
