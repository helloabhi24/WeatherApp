import 'package:geolocator/geolocator.dart';

class Location {
  var log;
  var lat;

  Future<void> getlocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      // or Can modify it as
      // Future<Position> position =
      //     Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      // But above code give you a instance instead of actual position,
      // that's why we use await keyword for actual value.

      log = position.longitude;
      lat = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
