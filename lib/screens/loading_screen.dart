import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    locationData();
  }

  void locationData() async {
    Location locate = Location();
    await locate.getlocation();
    latitude = locate.lat;
    logitude = locate.log;

    NetwokingHelper netwokingHelper = NetwokingHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$logitude&appid=$apiKey');
    var weatherData = await netwokingHelper.getData();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(),
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
