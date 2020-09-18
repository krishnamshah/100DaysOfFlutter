import 'package:geolocator/geolocator.dart';

class Getlocation{
  //get current location
  double latitude;
  double longitude;
  String city;
  Future<void> getCurrentLocation() async{
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude= position.longitude;
      city = await getCityName(position.latitude, position.longitude);
    }catch(e){
      print(e);
    }
  }

  Future<String> getCityName(double lat, double lon) async{
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(lat, lon);
    print('City Name: ${placemark[0].locality}');
    return placemark[0].locality;
  }


}