import 'package:geolocator/geolocator.dart';

class MyLocation{
  late double latitude2;
  late double longitude2;

  Future<void> getMyCurrentLovation() async {
    try {
      LocationPermission permission =
          await Geolocator.requestPermission(); //오류 해결 코드
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;

    }catch(e){
      print("connet error");
    }
  }

}