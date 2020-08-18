import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';
import 'dart:convert';

const apiKey = 'ad3f3ad631a917febe0c8858e4cf602f';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double logitude;

  @override
  void initState() {
    super.initState();
    location();
  }

  void location() async {
    Location locate = Location();
    await locate.getlocation();
    latitude = locate.lat;
    logitude = locate.log;

    getData();
  }

  void getData() async {
    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$logitude&appid=$apiKey');
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      int condition = decodeData['weather'][0]['id'];
      double temp = decodeData['main']['temp'];
      String cityName = decodeData['name'];
      print(condition);
      print(temp);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
