import 'package:flutter/material.dart';
import 'package:version3/data/Network.dart';
import 'package:version3/data/my_location.dart';
import 'dart:core';
import 'package:version3/data/Network.dart';
import 'package:version3/screen/weather_screen.dart';

const apikey = 'c382d3f9177746d74bd0463aadc5a803';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double latitude3;
  late double longitude3;

  @override
  void initState() {
    super.initState();
    getLoacation();
  }

  Future<void> getLoacation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLovation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);
    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric');

    var weatherData = await network.getJsonData();
    print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(parseWeatherData: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("fdas"),
        ),
      ),
    );
  }
}
