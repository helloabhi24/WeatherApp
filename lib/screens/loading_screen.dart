import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    locationData();
  }

  void locationData() async {
    var weatherData = await WeatherModel().getWeatherData();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(weatherData),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitRotatingCircle(
              color: Colors.white,
              size: 100.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Wait for Access your Location...",
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
