import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'ad3f3ad631a917febe0c8858e4cf602f';
const urlString = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getWeatherData() async {
    Location locate = Location();
    await locate.getlocation();

    NetwokingHelper netwokingHelper = NetwokingHelper(
        '$urlString?lat=${locate.lat}&lon=${locate.log}&appid=$apiKey&units=metric');
    var weatherData = await netwokingHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
