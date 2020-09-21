import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherData{
  final String city;
  final String description;
  final double temp;
  final String icon;


  WeatherData({this.city, this.description, this.temp, this.icon});

  factory WeatherData.fromJSON(Map<String, dynamic> json){
    return WeatherData(
      city: json['name'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      temp: json['main']['temp'],
    );
  }
}