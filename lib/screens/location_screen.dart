import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.weatherData);
  final weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // To pass data between locationScreen and locationScreenState, we have two ways
  // 1. First we create constructor for both class as follows.
  // _LocationScreenState(this.weather);
  // final weather;
  int condition;
  String cityName;
  int tempture;
  // 2. or we use widget.weatherData
  // A [State] object's configuration is the corresponding [StatefulWidget] instance.
  // This property is initialized by the framework before calling [initState].
  // If the parent updates this location in the tree to a new widget with the same [runtimeType] and [Widget.key] as the current configuration,
  // the framework will update this property to refer to the new widget and then call [didUpdateWidget],
  // passing the old configuration as an argument.
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData) {
    condition = weatherData['weather'][0]['id'];
    double temp = weatherData['main']['temp'];
    tempture = temp.toInt();
    cityName = weatherData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$tempture°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '☀️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's 🍦 time in San Francisco!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
