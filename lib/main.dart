import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'DisplayWeatherData.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  DisplayWeatherData _displayWeatherData=DisplayWeatherData();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              child: displayImage(),
            ),
            Container(
              child: _displayWeatherData,
            ),
          ],
        )
      ),
    );
  }

  //function to display images based on date and time
  displayImage(){
    var now = DateTime.now();
    final currentTime = DateFormat.jm().format(now);
    if( currentTime.contains('AM')){
      return Image.asset('images/dayTime.jpg');
    }
    else if( currentTime.contains('PM')){
      return Image.asset('images/nightTime.jpg');
    }
  }


}


