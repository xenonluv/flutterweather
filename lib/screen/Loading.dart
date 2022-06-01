import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'dart:convert' as convert;

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getLoacation();
    fetchData();
  }

  Future<void> getLoacation() async {
    LocationPermission permission =
        await Geolocator.requestPermission(); //오류 해결 코드
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  Future<void> fetchData() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=c382d3f9177746d74bd0463aadc5a803');

    http.Response response = await http.get(url);
    var jsonData = response.body;
    var myWeather = convert.jsonDecode(jsonData);
    print(myWeather["weather"][0]["description"]);

    var wind = convert.jsonDecode(jsonData)["wind"];
    print(wind);
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
